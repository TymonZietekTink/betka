package pl.betka.refresh_controller.controllers;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RefreshController {

  @PostMapping("/refresh")
  public void refresh(@RequestParam String connectorId, @RequestBody Map<String,String> authData){
      
  }
}
