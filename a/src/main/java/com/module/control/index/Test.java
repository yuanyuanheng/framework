package com.module.control.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.module.control.common.BaseCtrl;

@Controller
@RequestMapping(value="/")
public class Test extends BaseCtrl{
	  
	@RequestMapping("gofirst")
	  public String index() {
		logger.info("test index");
	    return "gofirst";
	  }
	@RequestMapping("flowchart")
	  public String flowchart() {
		logger.info("test index");
	    return "flowchart";
	  }
}
