package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.FornecedorDao;
import com.model.Fornecedor;
import com.model.Morador;

@Controller
public class FornecedorController {
	
	@Autowired 
	public FornecedorDao fornecedorDao;
	
	@RequestMapping("/list")	
	public String list(Model model){
		model.addAttribute("fornecedores",fornecedorDao.findAll());
        return "formsMorador";
		
	}
	
	@RequestMapping("/save")	
	public String save(Model model,@ModelAttribute("fornecedor") Fornecedor morador){
		fornecedorDao.save(morador);		
		model.addAttribute("fornecedores",fornecedorDao.findAll());
        return "formsFornecedor";		
	}

}
