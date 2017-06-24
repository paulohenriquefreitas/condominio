package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		public String list(Model model , @RequestParam ("dataRange") String dataRange){
			String [] datas = dataRange.split(" - ");
			model.addAttribute("pagamentos",pagamentoDao.find(datas[0].trim(), datas[1].trim()));
			model.addAttribute("recebimentos", recebimentoDao.find(datas[0].trim(), datas[1].trim()));
	        return "balancetes";
			
		}
	}

