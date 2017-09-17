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
			model.addAttribute("totalCondominio",recebimentoDao.findRecebimento(datas[0].trim(), datas[1].trim(), "condominio", null));
			model.addAttribute("totalCondominioAnterior",recebimentoDao.findRecebimento("01-01-2015", datas[1].trim(), "condominio",1));
			model.addAttribute("totalFundo",recebimentoDao.findRecebimento(datas[0].trim(), datas[1].trim(), "fundo de reserva",null));
			model.addAttribute("totalFundoAnterior",recebimentoDao.findRecebimento("01-01-2015", datas[1].trim(), "fundo de reserva",1));
			model.addAttribute("totalCota",recebimentoDao.findRecebimento(datas[0].trim(), datas[1].trim(), "cota extra",null));	
			model.addAttribute("totalCotaAnterior",recebimentoDao.findRecebimento("01-01-2015", datas[1].trim(), "cota extra",1));	
			model.addAttribute("pagamentos",pagamentoDao.find(datas[0].trim(), datas[1].trim()));
			model.addAttribute("totalPagamentoOrdinario",pagamentoDao.findPagamento(datas[0].trim(), datas[1].trim(), "condominio",null));
			model.addAttribute("totalPagamentoFundo",pagamentoDao.findPagamento(datas[0].trim(), datas[1].trim(), "fundo de reserva",null));
			model.addAttribute("totalPagamentoExtra",pagamentoDao.findPagamento(datas[0].trim(), datas[1].trim(), "cota extra",null));
			model.addAttribute("totalPagamentoOrdinarioAnterior",pagamentoDao.findPagamento("01-01-2015", datas[1].trim(), "condominio",1));
			model.addAttribute("totalPagamentoFundoAnterior",pagamentoDao.findPagamento("01-01-2015", datas[1].trim(), "fundo de reserva",1));
			model.addAttribute("totalPagamentoExtraAnterior",pagamentoDao.findPagamento("01-01-2015", datas[1].trim(), "cota extra",1));

			return "balancetes";
			
		}
	}

