package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.MoradorDao;
import com.model.Morador;

@RestController
@RequestMapping("/morador")
public class MoradorController {
	
	@Autowired
	MoradorDao moradorDao;
	
	@RequestMapping(method=RequestMethod.GET)	
	public ModelAndView list()throws ServletException, IOException{
		ModelAndView modelAndView = new ModelAndView("formsMorador.html");
        modelAndView.addObject("moradores", moradorDao.findAll());
       System.out.println(moradorDao.findAll().get(0).getNome());
        return modelAndView ;
		
	}

}
