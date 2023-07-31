package pl.betka.connectors.authentication.service.integration.pl.betlic.http;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;
import pl.betka.connectors.authentication.service.integration.utils.IntegrationTestBase;
import pl.betka.connectors.authentication.service.integration.configuration.TestConnectorConfiguration;
import pl.betka.connectors.authentication.service.common.domain.AuthenticationResponse;
import pl.betka.connectors.authentication.service.connectors.pl.betclic.http.BetclicHttpAuthenticationService;
import pl.betka.connectors_configuration.pl.betclic.BetclicUserInfo;
import pl.betka.domain.AuthenticationStatus;

@SpringBootTest
//fixme something is wrong that I can't import classes from connectors-common test
@Import(TestConnectorConfiguration.class)
@ActiveProfiles("integration")
public class BetclicHttpAuthenticationServiceTest extends IntegrationTestBase {
  private static final String USERNAME = "dummy_mail";
  private static final String PASSWORD = "dummy_password";
  private static final String DATE_OF_BIRTH = "1990-02-06";
  private static final String NEW_FINGERPRINT = "d38611dd-f45d-4ff3-884a-353683918438";
  private static final String STORED_FINGERPRINT = "dbca8694-9945-4f13-a511-2a5588188b4e";

  @Autowired
  BetclicHttpAuthenticationService service;

  @Override
  protected String getFileRootPath() {
    return "src/test/resources/integration/pl/betclic";
  }

  @Test
  public void happy_path_register_device() {
    wireMockServer.setScenarioState("authentication-with-registration","started");
    BetclicUserInfo data =
        BetclicUserInfo.builder()
            .username(USERNAME)
            .password(PASSWORD)
            .dateOfBirth(DATE_OF_BIRTH)
            .build();

    // when
    AuthenticationResponse result = service.authenticate(data);

    // then
    assertThat(result.getAuthenticationStatus()).isEqualTo(AuthenticationStatus.AUTHENTICATED);
    assertThat((BetclicUserInfo) result.getAuthData())
        .isEqualTo(createExpectedAuthData(NEW_FINGERPRINT));
  }

  @Test
  public void happy_path_login_with_registered_device(){
    wireMockServer.setScenarioState("authentication-with-registered-device","started");
    BetclicUserInfo data =
        BetclicUserInfo.builder()
            .username(USERNAME)
            .password(PASSWORD)
            .dateOfBirth(DATE_OF_BIRTH)
            .fingerprint(STORED_FINGERPRINT)
            .build();

    // when
    AuthenticationResponse result = service.authenticate(data);

    // then
    assertThat(result.getAuthenticationStatus()).isEqualTo(AuthenticationStatus.AUTHENTICATED);
    assertThat((BetclicUserInfo) result.getAuthData())
        .isEqualTo(createExpectedAuthData(STORED_FINGERPRINT));
  }

  private BetclicUserInfo createExpectedAuthData(String fingerPrint) {
    return BetclicUserInfo.builder()
        .username(USERNAME)
        .password(PASSWORD)
        .dateOfBirth(DATE_OF_BIRTH)
        .fingerprint(fingerPrint)
        .token(
            "{\"auth\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJHbG9iYWwuTW9iaWxlLkFwaS5BdXRoLkFwaS5TaGEyNTZBbGdvcml0aG0ifQ.IntcdTAwMjJJcFx1MDAyMjpcdTAwMjI4OS42NC44OS4yMDNcdTAwMjIsXHUwMDIyU2Vzc2lvblx1MDAyMjpcdTAwMjI0Njg4MDIxNDAzXHUwMDIyLFx1MDAyMlVzZXJJZFx1MDAyMjoxMzQzNzgzNixcdTAwMjJDb3VudHJ5Q29kZVx1MDAyMjpcdTAwMjJQTFx1MDAyMixcdTAwMjJMYW5ndWFnZUNvZGVcdTAwMjI6XHUwMDIycGFcdTAwMjIsXHUwMDIyQ3VycmVuY3lDb2RlXHUwMDIyOlx1MDAyMnBsblx1MDAyMixcdTAwMjJJc0FkbWluXHUwMDIyOmZhbHNlLFx1MDAyMklzTG9nZ2VkRnJvbUJvXHUwMDIyOmZhbHNlLFx1MDAyMklzTGF1bmNoZXJcdTAwMjI6ZmFsc2UsXHUwMDIyUmVndWxhdG9ySWRcdTAwMjI6NyxcdTAwMjJOb3RCZWZvcmVcdTAwMjI6XHUwMDIyMjAyMy0wNi0yMFQyMDowMTozOC4xNzE4NzI1Wlx1MDAyMixcdTAwMjJFeHBpcmF0aW9uVGltZVx1MDAyMjpcdTAwMjIyMDIzLTA2LTIwVDIyOjAzOjM4LjE3MTkxMDFaXHUwMDIyfSI.mltDlQq6SZWsO5qDtn_rG9x8lENdpA2Q4t1NRK3G8cU\",\"context\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJHbG9iYWwuTW9iaWxlLkFwaS5BdXRoLkFwaS5TaGEyNTZBbGdvcml0aG0ifQ.IntcdTAwMjJMZWdpc2xhdGlvblx1MDAyMjpcdTAwMjJQbFx1MDAyMixcdTAwMjJTaXRlXHUwMDIyOlx1MDAyMnBscGFcdTAwMjIsXHUwMDIyTGFuZ3VhZ2VcdTAwMjI6XHUwMDIycGFcdTAwMjIsXHUwMDIyQ2hhbm5lbElkXHUwMDIyOlx1MDAyMkJldGNsaWNQbFx1MDAyMixcdTAwMjJVbml2ZXJzZVx1MDAyMjpcdTAwMjJTcG9ydHNcdTAwMjIsXHUwMDIyTm90QmVmb3JlXHUwMDIyOlx1MDAyMjIwMjMtMDYtMjBUMjA6MDE6MzguMTcxODcyNVpcdTAwMjIsXHUwMDIyRXhwaXJhdGlvblRpbWVcdTAwMjI6XHUwMDIyMjAyMy0wNi0yMFQyMjowMzozOC4xNzIwMDQ4Wlx1MDAyMn0i.zlhUEE7apZKPZIr339GcNG465NQV_c2lmJ8WQQmQFOk\",\"expiresIn\":7199006}")
        .build();
  }
}
