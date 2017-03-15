package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.FornecedorDao;

@RestController
@RequestMapping("/fornecedor")
public class FornecedorController {
	
	@Autowired
	FornecedorDao fornecedorDao;
	
	@RequestMapping(method=RequestMethod.GET)	
	public ModelAndView list()throws ServletException, IOException{
		ModelAndView modelAndView = new ModelAndView("index.html");
        modelAndView.addObject("fornecedor", fornecedorDao.findAll());
        return modelAndView ;
		
	}

}
