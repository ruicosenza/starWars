package br.com.starwars.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swapi.models.Planet;

import br.com.starwars.dao.PlanetaDao;
import br.com.starwars.models.Planeta;
import br.com.starwars.services.RestClientConsumer;
import br.com.starwars.validation.PlanetaValidation;

@Controller
@RequestMapping("/planetas")
public class PlanetasController {
	
	@Autowired
	private PlanetaDao planetaDao;
	@Autowired
	private RestClientConsumer clientConsumer;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new PlanetaValidation());
	}
	
	@RequestMapping("form")
	public ModelAndView form(Planeta planeta) {
		ModelAndView mav = new ModelAndView("planetas/form");
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView gravar(@Valid Planeta planeta, BindingResult result, RedirectAttributes redAttr) {
		
		if( result.hasErrors() ) {
			return form(planeta);
		}
		planetaDao.gravar(planeta);
		redAttr.addFlashAttribute("sucesso", "Planeta cadastrado com sucesso!");
		
		return new ModelAndView("redirect:planetas");
	}
	
	@RequestMapping("/excluir")
	public ModelAndView excluir(Integer id, RedirectAttributes redAttr){
		
		planetaDao.excluir(id);
		
		redAttr.addFlashAttribute("sucesso", "Planeta excluído com sucesso!");
		return new ModelAndView("redirect:/planetas");
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listar(){
	    List<Planeta> planetas = planetaDao.listar();
	    ModelAndView modelAndView = new ModelAndView("/planetas/lista");
	    modelAndView.addObject("planetas", planetas);
	    return modelAndView;
	}
	
	@RequestMapping("api" )
	public ModelAndView api(@RequestParam("idPlaneta") String idPlaneta, RedirectAttributes redAttr ) {
		Planet planet = new Planet();
		
		try {
			int id = Integer.valueOf(idPlaneta);
			ArrayList<String> planeta = clientConsumer.getPlaneta(id);
			System.out.println(planeta.get(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		redAttr.addFlashAttribute("nome", planet.name);
		return new ModelAndView("redirect:/");
	}
}