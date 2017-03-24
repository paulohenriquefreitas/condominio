package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.FornecedorDaoImpl;

@Controller
@RequestMapping("/fornecedor")
public class FornecedorController {
	
	@Autowired
	FornecedorDaoImpl fornecedorDao;
	
	@RequestMapping("/")	
	public String list(Model model)throws ServletException, IOException{
		model.addAttribute("fornecedores",fornecedorDao.findAll());
        return "formsFornec";
		
	}
	
	@RequestMapping("/save")	
	public String save(Model model)throws ServletException, IOException{
		System.out.println("teste");
        return "formsMorador";
		
	}

}
