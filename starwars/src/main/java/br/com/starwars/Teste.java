package br.com.starwars;

import java.util.ArrayList;

import br.com.starwars.services.RestClientConsumer;

public class Teste {
	// private String cookies;

	public static void main(String[] args) {
		RestClientConsumer consumer = new RestClientConsumer();
		
		try {
			ArrayList<String> planetas = consumer.getPlaneta(1);
			String s = planetas.get(0);
			System.out.println(s);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}