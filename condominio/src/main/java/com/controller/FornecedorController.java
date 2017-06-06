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
@RequestMapping("/fornecedor")
public class FornecedorController {
	
	@Autowired 
	public FornecedorDao fornecedorDao;
	
	@RequestMapping("/list")	
	public String list(Model model){
		model.addAttribute("fornecedores",fornecedorDao.findAll());
        return "fornecedores";
		
	}
	
	@RequestMapping("/save")	
	public String save(Model model,@ModelAttribute("fornecedor") Fornecedor fornecedor){
		fornecedorDao.save(fornecedor);		
		model.addAttribute("fornecedores",fornecedorDao.findAll());
        return "fornecedores";		
	}
	
	@RequestMapping("/delete")	
	public String delete(Model model,@ModelAttribute("fornecedor") String id){
		fornecedorDao.delete(id);		
		return "fornecedor deletado com sucesso ";	

	}
	
	@RequestMapping("/update")	
	public String update(Model model,@ModelAttribute("fornecedor") Fornecedor fornecedor){
		fornecedorDao.update(fornecedor);		
		return "Fornecedor alterado com sucesso";	
	
	}
	
	@RequestMapping("/find")	
	public String find(Model model,@ModelAttribute("fornecedor") String id){
		model.addAttribute("fornecedores",fornecedorDao.findAll());
        return "fornecedores";
	
	}

}
