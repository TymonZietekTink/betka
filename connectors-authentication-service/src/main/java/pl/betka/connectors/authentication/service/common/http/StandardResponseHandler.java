package pl.betka.connectors.authentication.service.common.http;

import java.io.IOException;
import org.apache.hc.client5.http.impl.classic.AbstractHttpClientResponseHandler;
import org.apache.hc.core5.http.ClassicHttpResponse;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.io.HttpClientResponseHandler;
import org.apache.hc.core5.http.io.entity.EntityUtils;

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
