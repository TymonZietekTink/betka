package pl.betka.connectors;

import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.module.paramnames.ParameterNamesModule;
import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.impl.classic.HttpClientBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Profile;
import pl.betka.connectors.common.utils.RandomValuesProvider;
import pl.betka.connectors.common.utils.StandardRandomValuesProvider;

@Configuration
public class ConnectorsConfiguration {

  @Bean
  @Primary
  ObjectMapper providesObjectMapper() {
    return new ObjectMapper()
        .registerModule(new Jdk8Module())
        .registerModule(new JavaTimeModule())
        .registerModule(new ParameterNamesModule())
        .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
        .configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true)
        .setSerializationInclusion(Include.NON_NULL)
        .setVisibility(PropertyAccessor.FIELD, Visibility.ANY)
        .configure(MapperFeature.ACCEPT_CASE_INSENSITIVE_ENUMS, true);
  }

  @Bean
  @Profile({"production","dev"})
  public HttpClient providesHttpClient() {
    return HttpClientBuilder.create().build();
  }

  @Bean
  @Profile({"production","dev"})
  public RandomValuesProvider standardRandomValuesProvider() {
    return new StandardRandomValuesProvider();
  }
}
