package pl.betka.connectors.authentication.service.pl.fortuna.web_scraping;

import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.BrowserType;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Locator.TypeOptions;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.Playwright;
import com.microsoft.playwright.options.Cookie;
import java.net.HttpCookie;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Component;
import pl.betka.connectors.authentication.service.common.domain.AuthenticationResponse;
import pl.betka.connectors.authentication.service.common.exceptions.AuthenticationException;
import pl.betka.connectors.authentication.service.common.process.AuthenticatorService;
import pl.betka.connectors_configuration.UserInfo;
import pl.betka.connectors_configuration.pl.fortuna.FortunaUserInfo;
import pl.betka.domain.AuthenticationStatus;

@Component
@RequiredArgsConstructor
public class FortunaWebScrapingAuthenticationService implements AuthenticatorService {
  private FortunaUserInfo authData;

  @Override
  public AuthenticationResponse authenticate(UserInfo authenticationData) {
    authData = (FortunaUserInfo) authenticationData;
    Cookie authTokenWebCookie;
    try (Playwright playwright = Playwright.create()) {
      var browser =
          playwright.chromium().launch(new BrowserType.LaunchOptions().setHeadless(false));
      var context = browser.newContext();
      var page = context.newPage();
      authTokenWebCookie = login(context, page);
    }
    var cookie = convertCookie(authTokenWebCookie);
    authData.setToken(cookie);
    return AuthenticationResponse.builder()
        .authenticationStatus(AuthenticationStatus.AUTHENTICATED)
        .authData(authData)
        .build();
  }

  @SneakyThrows
  public Cookie login(BrowserContext context, Page page) {
    page.navigate("https://www.efortuna.pl/");
    acceptCookies(page);
    clickLoginButton(page);
    submitLoginForm(page);
    return waitForTokenCookie(context);
  }

  private void submitLoginForm(Page page) {
    Locator inputLocator = page.locator("//div[@id='user-box-login']//input[@type='text']");
    waitForInputForm(inputLocator);
    inputLocator.type(authData.getUsername(), new TypeOptions().setDelay(50));
    Locator passwordInput = page.locator("//div[@id='user-box-login']//input[@type='password']");
    passwordInput.type(authData.getPassword(), new TypeOptions().setDelay(50));
    Locator submitButton =
        page.locator(
            "//button[contains(concat(' ',normalize-space(@class),' '),' user-box-form-button')]");
    submitButton.click();
  }

  private void waitForInputForm(Locator locator) {
    for (int i = 0; i < 5; i++) {
      if (!locator.isHidden()) {
        return;
      }
    }
    throw new AuthenticationException("Input form not found");
  }

  private void clickLoginButton(Page page) {
    Locator loginButton =
        page.locator(
            "//div[contains(concat(' ',normalize-space(@class),' '),' user-box-login-button ')]");
    loginButton.click();
  }

  private void acceptCookies(Page page) {
    Locator cookiePopup = page.locator("//div[@id='cookie-consent-dialog']");
    if (cookiePopup.isVisible()) {
      Locator cookieAcceptButton = page.locator("//button[@id='cookie-consent-button-accept']");
      cookieAcceptButton.click();
    }
  }

  private Cookie waitForTokenCookie(BrowserContext context) {
    for (int i = 0; i < 5; i++) {
      Optional<Cookie> tokenCookie =
          context.cookies().stream().filter(cookie -> "auth_token".equals(cookie.name)).findFirst();
      if (tokenCookie.isPresent()) {
        return tokenCookie.get();
      }
    }
    throw new AuthenticationException("Auth token cookie not found");
  }

  @Override
  public String getConnectorIdentifier() {
    return "pl-fortuna-web";
  }

  private HttpCookie convertCookie(Cookie cookie) {
    HttpCookie httpCookie = new HttpCookie(cookie.name, cookie.value);
    httpCookie.setDomain(cookie.domain);
    httpCookie.setPath(cookie.path);
    return httpCookie;
  }
}
