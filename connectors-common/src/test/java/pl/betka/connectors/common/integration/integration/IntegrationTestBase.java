package pl.betka.connectors.common.integration.integration;

import static org.springframework.cloud.contract.wiremock.WireMockSpring.options;

import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.http.JvmProxyConfigurer;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;

public abstract class IntegrationTestBase {
  protected WireMockServer wireMockServer;

  protected abstract String getFileRootPath();

  @BeforeEach
  public void setUp(){
    wireMockServer = new WireMockServer(options()
        .dynamicPort()
        .keystorePath("./src/test/resources/keystore/wiremock.jks")
        .keystorePassword("password")
        .keyManagerPassword("password")
        .withRootDirectory(getFileRootPath())
        .enableBrowserProxying(true));
    wireMockServer.start();
    JvmProxyConfigurer.configureFor(wireMockServer);
  }

  @AfterEach
  public void tearDown(){
    wireMockServer.stop();
    JvmProxyConfigurer.restorePrevious();
  }
}
