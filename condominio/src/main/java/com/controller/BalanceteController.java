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
			model.addAttribute("recebimentos", recebimentoDao.find(datas[0].trim(), datas[1].trim()));
			model.addAttribute("totalCondominio",recebimentoDao.findRecebimento(datas[0].trim(), datas[1].trim(), "condominio"));
			model.addAttribute("totalFundo",recebimentoDao.findRecebimento(datas[0].trim(), datas[1].trim(), "fundo de reserva"));
			model.addAttribute("totalCota",recebimentoDao.findRecebimento(datas[0].trim(), datas[1].trim(), "cota extra"));			
			model.addAttribute("pagamentos",pagamentoDao.find(datas[0].trim(), datas[1].trim()));
			model.addAttribute("totalPagamentoOrdinario",pagamentoDao.findPagamento(datas[0].trim(), datas[1].trim(), "condominio"));
			model.addAttribute("totalPagamentoFundo",pagamentoDao.findPagamento(datas[0].trim(), datas[1].trim(), "fundo de reserva"));
			model.addAttribute("totalPagamentoExtra",pagamentoDao.findPagamento(datas[0].trim(), datas[1].trim(), "cota extra"));

			return "balancetes";
			
		}
	}

