/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */
package pl.betka.infrastructure.kafka.model.avro;
@org.apache.avro.specific.AvroGenerated
public enum FetchingStatus implements org.apache.avro.generic.GenericEnumSymbol<FetchingStatus> {
  STARTED, FETCHING, FETCHED, FAILED  ;
  public static final org.apache.avro.Schema SCHEMA$ = new org.apache.avro.Schema.Parser().parse("{\"type\":\"enum\",\"name\":\"FetchingStatus\",\"namespace\":\"pl.betka.infrastructure.kafka.model.avro\",\"symbols\":[\"STARTED\",\"FETCHING\",\"FETCHED\",\"FAILED\"]}");
  public static org.apache.avro.Schema getClassSchema() { return SCHEMA$; }

  @Override
  public org.apache.avro.Schema getSchema() { return SCHEMA$; }
}
