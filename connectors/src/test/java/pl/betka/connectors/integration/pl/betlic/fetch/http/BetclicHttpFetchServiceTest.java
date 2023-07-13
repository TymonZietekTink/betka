package pl.betka.connectors.integration.pl.betlic.fetch.http;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;
import pl.betka.connectors.common.domain.fetching.FetchResponse;
import pl.betka.connectors.connectors.pl.betclic.fetching.http.BetclicHttpFetchService;
import pl.betka.connectors.integration.HttpAuthenticationConfig;
import pl.betka.connectors.integration.IntegrationTestBase;
import pl.betka.connectors_configuration.pl.betclic.BetclicHttpAuthenticationData;
import pl.betka.domain.FetchStatus;

@SpringBootTest
@Import(HttpAuthenticationConfig.class)
@ActiveProfiles("integration")
public class BetclicHttpFetchServiceTest extends IntegrationTestBase {
  private static final String USERNAME = "dummy_mail";
  private static final String PASSWORD = "dummy_password";
  private static final String DATE_OF_BIRTH = "1990-02-06";
  private static final String AUTH_TOKEN = "{\"auth\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJHbG9iYWwuTW9iaWxlLkFwaS5BdXRoLkFwaS5TaGEyNTZBbGdvcml0aG0ifQ.IntcIklwXCI6XCI4OS42NC44OS4yMDNcIixcIlVzZXJJZFwiOjEzNDM3ODM2LFwiU2Vzc2lvblwiOlwiNDY4ODAyMTQwM1wiLFwiQ291bnRyeUNvZGVcIjpcIlBMXCIsXCJMYW5ndWFnZUNvZGVcIjpcInBhXCIsXCJDdXJyZW5jeUNvZGVcIjpcInBsblwiLFwiSXNBZG1pblwiOmZhbHNlLFwiSXNMb2dnZWRGcm9tQm9cIjpmYWxzZSxcIklzTGF1bmNoZXJcIjpmYWxzZSxcIlJlZ3VsYXRvcklkXCI6NyxcIk5vdEJlZm9yZVwiOlwiMjAyMy0wNi0yMFQyMDowMTozOC44NDUwMTk1WlwiLFwiRXhwaXJhdGlvblRpbWVcIjpcIjIwMjMtMDYtMjBUMjI6MDM6MzguODQ1MDE5NVpcIn0i.Be4eZvybdCjHhJjju0mIR1s6cP-waB1hqJHXzVn2O9Y\",\"context\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJHbG9iYWwuTW9iaWxlLkFwaS5BdXRoLkFwaS5TaGEyNTZBbGdvcml0aG0ifQ.IntcIkxlZ2lzbGF0aW9uXCI6XCJQbFwiLFwiU2l0ZVwiOlwiUGxQYVwiLFwiTGFuZ3VhZ2VcIjpcIlBhXCIsXCJDaGFubmVsSWRcIjpcIkJldGNsaWNQbFwiLFwiVW5pdmVyc2VcIjpcIlNwb3J0c1wiLFwiTm90QmVmb3JlXCI6XCIyMDIzLTA2LTIwVDIwOjAxOjM4Ljg0NTAxOTVaXCIsXCJFeHBpcmF0aW9uVGltZVwiOlwiMjAyMy0wNi0yMFQyMjowMzozOC44NDUwMTk1WlwifSI.lhr-CWWdi_SN_36WDgenJ6mmDjexw0rfVY3eovoyZbM\",\"expiresIn\":7199976}";

  @Autowired
  BetclicHttpFetchService service;

  @Override
  protected String getFileRootPath() {
    return "src/test/resources/integration/pl/betclic";
  }

  @Test
  public void happy_path_fetching_transactions() {
    wireMockServer.setScenarioState("fetching-transaction","first_page");
    BetclicHttpAuthenticationData data =
        BetclicHttpAuthenticationData.builder()
            .username(USERNAME)
            .password(PASSWORD)
            .dateOfBirth(DATE_OF_BIRTH)
            .token(AUTH_TOKEN)
            .build();

    // when
    FetchResponse result = service.fetchTransactions(data);


    // then
    assertThat(result.getFetchStatus()).isEqualTo(FetchStatus.FETCHED);
    assertThat(result.getTickets()).hasSize(29);
  }
}
