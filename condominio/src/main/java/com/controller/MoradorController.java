package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.MoradorDao;

@RestController
@RequestMapping("/morador")
public class MoradorController {
	
	@Autowired
	MoradorDao moradorDao;
	
	@RequestMapping(method=RequestMethod.GET)	
	public String list()throws ServletException, IOException{
		System.out.println("ola");
		ModelAndView modelAndView = new ModelAndView("moradores/list");
        modelAndView.addObject("moradores", moradorDao.findAll());
        return "TESTe";
		
	}

}
