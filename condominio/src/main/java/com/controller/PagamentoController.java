package com.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.FornecedorDao;
import com.dao.PagamentoDao;
import com.model.Pagamento;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController {
	
	@Autowired 
	public PagamentoDao pagamentoDao;
	
	@Autowired 
	public FornecedorDao fornecedorDao;
	
	@RequestMapping("/list")	
	public String list(Model model){
		model.addAttribute("pagamentos",pagamentoDao.findAll());
		model.addAttribute("fornecedores", fornecedorDao.findAll());
        return "pagamentos";
		
	}
	
	@RequestMapping("/save")	
	public String save(Model model,@ModelAttribute("pagamento") Pagamento pagamento){
		pagamentoDao.save(pagamento);		
		model.addAttribute("pagamentos",pagamentoDao.findAll());
		model.addAttribute("fornecedores", fornecedorDao.findAll());
        return "pagamentos";		
	}

}
