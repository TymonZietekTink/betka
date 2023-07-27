package pl.betka.connectors.common.http;

import org.apache.hc.client5.http.impl.classic.AbstractHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpResponse;
import org.apache.hc.core5.http.HttpEntity;

public class StandardResponseHandler extends AbstractHttpClientResponseHandler<ClassicHttpResponse> {

  @Override
  public ClassicHttpResponse handleResponse(ClassicHttpResponse response) {
    return response;
  }

  @Override
  public ClassicHttpResponse handleEntity(HttpEntity entity) {
    return null;
  }
}
