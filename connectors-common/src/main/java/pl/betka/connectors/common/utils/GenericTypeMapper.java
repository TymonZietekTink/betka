package pl.betka.connectors.common.utils;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.function.BiPredicate;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class GenericTypeMapper<V, T> {

    final Optional<V> defaultValue;
    private final Map<T, V> translator;
    private final Set<T> ignoredKeys;
    private BiPredicate<T, Collection<V>> isOneOfType =
            (input, types) -> Optional.of(translate(input)).map(types::contains).orElse(false);

    GenericTypeMapper(Builder<V, T, ?> builder) {
        ignoredKeys = builder.getIgnoredKeys();

        defaultValue = builder.getDefaultValue();

        ImmutableMap.Builder<T, V> tmpTranslator = ImmutableMap.builder();
        for (Map.Entry<V, Collection<T>> entry : builder.getReversed().entrySet()) {
            entry.getValue().stream()
                    .peek(
                            key ->
                                    Preconditions.checkState(
                                            !ignoredKeys.contains(key),
                                            String.format(
                                                    "Key %s is both mapped and ignored.", key)))
                    .forEach(key -> tmpTranslator.put(key, entry.getKey()));
        }
        translator = tmpTranslator.build();
    }

    public static <V, T> Builder<V, T, ?> genericBuilder() {
        return new GenericBuilder<>();
    }

    protected boolean verify(T key, V value) {
        return Optional.of(translate(key)).filter(value::equals).isPresent();
    }

    protected boolean verify(T key, Collection<V> values) {
        return Optional.of(translate(key)).filter(values::contains).isPresent();
    }

    /**
     * Returns the type associated with the key, if any. A warning is logged if the key cannot be
     * mapped to a type, unless the key has been ignored.
     */
    public V translate(T typeKey) {
        if (Objects.isNull(typeKey)) {
            log.warn("Null typeKey: {}", typeKey);
            return defaultValue.get();
        }

        Optional<V> type = Optional.ofNullable(translator.get(typeKey));

        if (!type.isPresent() && !ignoredKeys.contains(typeKey)) {
            log.warn("Unknown key: {}", typeKey);
            return defaultValue.get();
        }

        return type.get();
    }

    public Collection<V> getMappedTypes() {
        return translator.values().stream().distinct().collect(Collectors.toList());
    }

    public boolean isOneOf(T input, Collection<V> types) {
        return isOneOfType.test(input, types);
    }

    public boolean isOf(T input, V type) {
        return isOneOfType.test(input, Collections.singleton(type));
    }

    public abstract static class Builder<V, T, B extends Builder<V, T, B>> {

        final Map<V, Collection<T>> reversed = new HashMap<>();
        final Set<T> ignoredKeys = new HashSet<>();
        Optional<V> defaultValue;

        protected Builder() {
            this.defaultValue = Optional.empty();
        }

        public abstract GenericTypeMapper<V, T> build();

        /** Known keys, and the account type they should be mapped to. */
        public Builder<V, T, B> put(V value, T... keys) {
            self().reversed.put(value, Arrays.asList(keys));
            return self();
        }

        public Builder<V, T, B> putAll(Map<V, List<T>> map) {
            self().reversed.putAll(map);
            return self();
        }

        public Builder<V, T, B> setDefaultTranslationValue(V defaultTranslationValue) {
            self().defaultValue = Optional.ofNullable(defaultTranslationValue);
            return self();
        }

        public Optional<V> getDefaultValue() {
            return self().defaultValue;
        }

        protected abstract B self();

        /** Known keys that should not be mapped to any specific account type. */
        /**
         * Known keys that should not be mapped to any specific account type. The effect is that a
         * warning will not be printed when attempting to map these keys.
         */
        public Builder<V, T, B> ignoreKeys(T... keys) {
            self().ignoredKeys.addAll(Arrays.asList(keys));
            return this;
        }

        public Builder<V, T, B> ignoreKeys(List<T> keys) {
            self().ignoredKeys.addAll(keys);
            return this;
        }

        Map<V, Collection<T>> getReversed() {
            return this.reversed;
        }

        Set<T> getIgnoredKeys() {
            return this.ignoredKeys;
        }
    }

    public static class GenericBuilder<V, T> extends Builder<V, T, GenericBuilder<V, T>> {
        GenericBuilder() {
            super();
        }

        @Override
        protected GenericBuilder self() {
            return this;
        }

        public GenericTypeMapper<V, T> build() {
            return new GenericTypeMapper<>(this);
        }
    }
}