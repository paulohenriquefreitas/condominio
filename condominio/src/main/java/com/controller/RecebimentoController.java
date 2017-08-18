package com.controller;



import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.RecebimentoDao;
import com.model.Recebimento;


@Controller
@RequestMapping("/recebimento")
public class RecebimentoController {
	
	
	
	@Autowired 
	public RecebimentoDao recebimentoDao;	
	
	@RequestMapping("/list")	
	public String list(Model model){
		model.addAttribute("recebimentos",recebimentoDao.findAll());
        return "recebimentos";
		
	}
	
	@RequestMapping("/save")	
	public String save(Model model,@ModelAttribute("recebimento") Recebimento recebimento){
		BigDecimal valor = null;
		if (recebimento.getTipo().equals("condominio")){
			valor = new BigDecimal(System.getProperty("condominio")).setScale(2, RoundingMode.HALF_UP);
		}else if(recebimento.getTipo().equals("fundo de reserva")){
			valor = new BigDecimal(System.getProperty("fundo")).setScale(2, RoundingMode.HALF_UP);;
		}else {
			valor = new BigDecimal(System.getProperty("cota")).setScale(2, RoundingMode.HALF_UP);
		}
		
		recebimento.setValor(valor);
		try {
			recebimentoDao.save(recebimento);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		model.addAttribute("recebimentos",recebimentoDao.findAll());
        return "recebimentos";		
	}
	
	@RequestMapping("/update")	
	public String alterar(Model model,@ModelAttribute("recebimento") Recebimento recebimento){
		recebimentoDao.update(recebimento);		
		model.addAttribute("recebimentos",recebimentoDao.findAll());
        return "recebimentos";
	
	}
	
	@RequestMapping("/delete")	
	public String delete(Model model,@ModelAttribute("recebimento") Recebimento recebimento){
		recebimentoDao.delete(recebimento.getId_rece());	
		model.addAttribute("recebimentos",recebimentoDao.findAll());
        return "recebimentos";		
	
	}
	
	
        
	
}


