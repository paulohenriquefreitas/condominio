package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.FornecedorDaoImpl;

@RestController
@RequestMapping("/fornecedor")
public class FornecedorController {
	
	@Autowired
	FornecedorDaoImpl fornecedorDao;
	
	@RequestMapping(method=RequestMethod.GET)	
	public ModelAndView list()throws ServletException, IOException{
		ModelAndView modelAndView = new ModelAndView("formsFornec.html");
        modelAndView.addObject("fornecedor", fornecedorDao.findAll());
        return modelAndView ;
		
	}

}
