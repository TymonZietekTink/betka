package pl.betka.connectors.common.utils;

import com.google.common.base.Strings;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

public class TypeMapper<V> extends GenericTypeMapper<V, String> {

    private TypeMapper(Builder<V, String, ?> builder) {
        super(builder);
    }

    public static <V> TypeMapperBuilder<V, ?> builder() {
        return new DefaultTypeMapperBuilder<>();
    }

    protected boolean verify(String key, Collection<V> values) {
        Optional<V> translated = Optional.of(translate(key));
        return translated.isPresent() && values.contains(translated.get());
    }

    /**
     * Returns the type associated with the key, if any. A warning is logged if the key cannot be
     * mapped to a type, unless the key has been ignored.
     */
    public V translate(String typeKey) {
        if (Strings.isNullOrEmpty(typeKey)) {
            // `typeKey` comes from the bank and can be null.
            return defaultValue.get();
        }

        return super.translate(typeKey.toLowerCase());
    }

    public abstract static class TypeMapperBuilder<V, B extends TypeMapperBuilder<V, B>>
            extends Builder<V, String, B> {

        TypeMapperBuilder() {
            super();
        }

        @Override
        /** Known keys, and the account type they should be mapped to. */
        public TypeMapperBuilder<V, B> put(V value, String... keys) {
            Set<String> collect =
                    Arrays.stream(keys).map(String::toLowerCase).collect(Collectors.toSet());
            self().reversed.put(value, collect);
            return self();
        }

        @Override
        public TypeMapperBuilder<V, B> putAll(Map<V, List<String>> map) {
            self().reversed.putAll(map);
            return self();
        }

        /**
         * Known keys that should not be mapped to any specific account type. The effect is that a
         * warning will not be printed when attempting to map these keys.
         */
        @Override
        public TypeMapperBuilder<V, B> ignoreKeys(String... keys) {
            self().ignoredKeys
                    .addAll(
                            Arrays.stream(keys)
                                    .map(String::toLowerCase)
                                    .collect(Collectors.toList()));
            return self();
        }

        @Override
        public TypeMapperBuilder<V, B> setDefaultTranslationValue(V defaultTranslationValue) {
            self().defaultValue = Optional.ofNullable(defaultTranslationValue);
            return self();
        }

        @Override
        public abstract TypeMapper<V> build();
    }

    public static class DefaultTypeMapperBuilder<V>
            extends TypeMapperBuilder<V, DefaultTypeMapperBuilder<V>> {

        @Override
        public TypeMapper<V> build() {
            return new TypeMapper<>(this);
        }

        @Override
        protected DefaultTypeMapperBuilder self() {
            return this;
        }
    }
}