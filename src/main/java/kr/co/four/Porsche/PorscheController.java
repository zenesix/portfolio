package kr.co.four.Porsche;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/porsche")
public class PorscheController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String porscheMain() {
        return "porsche1/porsche_main";
    }

    @RequestMapping(value = "/quote", method = RequestMethod.GET)
    public String quote() {
        return "porsche1/quote";
    }

    @RequestMapping(value = "/consult", method = RequestMethod.GET)
    public String consult() {
        return "porsche1/consult";
    }

    @RequestMapping(value = "/testdrive", method = RequestMethod.GET)
    public String testdrive() {
        return "porsche1/testdrive";
    }

    @RequestMapping(value = "/dealer", method = RequestMethod.GET)
    public String dealer() {
        return "porsche1/dealer";
    }

    @RequestMapping(value = "/benefits", method = RequestMethod.GET)
    public String benefits() {
        return "porsche1/benefits";
    }

    @RequestMapping(value = "/service", method = RequestMethod.GET)
    public String service() {
        return "porsche1/service";
    }

    @RequestMapping(value = "/model", method = RequestMethod.GET)
    public String model() {
        return "porsche1/model";
    }

    @RequestMapping(value = "/purchase", method = RequestMethod.GET)
    public String purchase() {
        return "porsche1/purchase";
    }

    @RequestMapping(value = "/service-membership", method = RequestMethod.GET)
    public String serviceMembership() {
        return "porsche1/service_membership";
    }

    @RequestMapping(value = "/support", method = RequestMethod.GET)
    public String support() {
        return "porsche1/support";
    }

    @RequestMapping(value = "/brand", method = RequestMethod.GET)
    public String brand() {
        return "porsche1/brand";
    }

    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String shop() {
        return "porsche1/shop";
    }

    @RequestMapping(value = "/connect", method = RequestMethod.GET)
    public String connect() {
        return "porsche1/connect";
    }

    @RequestMapping(value = "/store", method = RequestMethod.GET)
    public String store() {
        return "porsche1/store";
    }

    @RequestMapping(value = "/ev", method = RequestMethod.GET)
    public String ev() {
        return "porsche1/ev";
    }

    @RequestMapping(value = "/future", method = RequestMethod.GET)
    public String future() {
        return "porsche1/future";
    }
} 