package kr.co.four.lab;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/lab")
public class LabController {

    @RequestMapping(value = "/creative", method = RequestMethod.GET)
    public String creativeLab() {
        return "lab/creative_lab";
    }
} 