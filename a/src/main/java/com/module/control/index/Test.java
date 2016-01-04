package com.module.control.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.module.control.common.BaseCtrl;

@Controller
@RequestMapping(value="/")
public class Test extends BaseCtrl{
	  
	@RequestMapping("j")
	  public String index() {
		logger.info("test index");
	    return "index";
	  }
	@RequestMapping("h")
	  public String in() {
		logger.info("test index");
	    return "flowchart";
	  }
}
