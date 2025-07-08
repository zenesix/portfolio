package kr.co.four.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GardenController {

    private static final Logger logger = LoggerFactory.getLogger(GardenController.class);

    @RequestMapping(value = "/garden", method = RequestMethod.GET)
    public String garden(Model model) {
        logger.info("심비오틱 가든으로 이동");
        model.addAttribute("pageTitle", "심비오틱 가든");
        return "garden/index";
    }
} 