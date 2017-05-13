package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.RecebimentoDao;
import com.model.Recebimento;


@Controller
@RequestMapping("/recebimento")
public class RecebimentoController {
	
	@Autowired 
	public RecebimentoDao recebimentoDao;
	
	@RequestMapping("/list")	
	public String list(Model model){
		model.addAttribute("recebimentos",recebimentoDao.findAll());
        return "formsRecebimento";
		
	}
	
	@RequestMapping("/save")	
	public String save(Model model,@ModelAttribute("recebimento") Recebimento recebimento){
		recebimentoDao.save(recebimento);		
		model.addAttribute("recebimentos",recebimentoDao.findAll());
        return "formsRecebimento";		
	}

}


