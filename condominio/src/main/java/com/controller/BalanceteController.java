package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.PagamentoDao;
import com.dao.RecebimentoDao;

@Controller
@RequestMapping("/balancete")
public class BalanceteController {

		
		@Autowired 
		public PagamentoDao pagamentoDao;
		
		@Autowired 
		public RecebimentoDao recebimentoDao;
		
		@RequestMapping("/list")	
		public String list(Model model){
			model.addAttribute("pagamentos",pagamentoDao.findAll());
			model.addAttribute("recebimentos", recebimentoDao.findAll());
	        return "balancetes";
			
		}
	}

