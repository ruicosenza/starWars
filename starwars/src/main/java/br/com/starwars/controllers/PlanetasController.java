package br.com.starwars.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.starwars.dao.PlanetaDao;
import br.com.starwars.models.Planeta;
import br.com.starwars.validation.PlanetaValidation;

@Controller
@RequestMapping("/planetas")
public class PlanetasController {
	
	@Autowired
	private PlanetaDao planetaDao;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new PlanetaValidation());
	}
	
	@RequestMapping("form")
	public ModelAndView form() {
		ModelAndView mav = new ModelAndView("planetas/form");
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView gravar(@Valid Planeta planeta, BindingResult result, RedirectAttributes redAttr) {
		
		if( result.hasErrors() ) {
			return form();
		}
		planetaDao.gravar(planeta);
		redAttr.addFlashAttribute("sucesso", "Planeta cadastrado com sucesso!");
		
		return new ModelAndView("redirect:planetas");
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listar(){
	    List<Planeta> planetas = planetaDao.listar();
	    ModelAndView modelAndView = new ModelAndView("/planetas/lista");
	    modelAndView.addObject("planetas", planetas);
	    return modelAndView;
	}
}