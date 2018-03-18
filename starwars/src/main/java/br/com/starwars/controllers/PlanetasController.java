package br.com.starwars.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.starwars.dao.PlanetaDao;
import br.com.starwars.models.Planeta;
import br.com.starwars.services.RestClientConsumer;

@Controller
public class PlanetasController {
	
	@Autowired
	private PlanetaDao planetaDao;
	private RestClientConsumer client;

	@RequestMapping("/planetas/form")
	public String form() {
		return "planetas/form";
	}
	
	@RequestMapping("/planetas")
	public String gravar(Planeta planeta) {
		planetaDao.gravar(planeta);
		
		return "/planetas/ok";
	}
	
	@RequestMapping("/planetas/listar")
	public void listarPlanetas() {
		client = new RestClientConsumer();
		ArrayList<String> planetas = new ArrayList<>();
		try {
			for( int i = 1; i <= 4; i++ ) {
				planetas = client.getPlanetas(i);
			}
			
			for (String p : planetas) {
				System.out.println(p);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}