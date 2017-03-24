package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.MoradorDao;

@Controller
public class MoradorController {
	
	@Autowired 
	public MoradorDao moradorDao;
	
	@RequestMapping("/morador")	
	public String list(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name){
		model.addAttribute("moradores",moradorDao.findAll());
        return "formsMorador";
		
	}

}
