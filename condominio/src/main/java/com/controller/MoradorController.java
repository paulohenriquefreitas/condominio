package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.MoradorDao;
import com.model.Morador;

@Controller
@RequestMapping("/morador")
public class MoradorController {
	
	@Autowired 
	public MoradorDao moradorDao;
	
	@RequestMapping("/list")	
	public String list(Model model){
		model.addAttribute("moradores",moradorDao.findAll());
        return "moradores";
		
	}
	
	@RequestMapping("/save")	
	public String save(Model model,@ModelAttribute("morador") Morador morador){
		moradorDao.save(morador);		
		model.addAttribute("moradores",moradorDao.findAll());
        return "moradores";		
	}
	
	@RequestMapping("/delete")	
	public String delete(Model model,@ModelAttribute("morador") Morador morador){
		moradorDao.delete(morador.getAp());		
		model.addAttribute("moradores",moradorDao.findAll());
        return "moradores";		
	
	}
	
	@RequestMapping("/update")	
	public String alterar(Model model,@ModelAttribute("morador") Morador morador){
		moradorDao.alterar(morador);		
		model.addAttribute("moradores",moradorDao.findAll());
        return "moradores";
	
	}
	
	
	
	
	//TODO delete update findbyid

}
