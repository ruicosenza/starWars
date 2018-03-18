package br.com.starwars;

import java.util.ArrayList;

import com.swapi.models.Planet;
import com.swapi.models.SWModelList;
import com.swapi.sw.StarWars;
import com.swapi.sw.StarWarsApi;

import br.com.starwars.services.RestClientConsumer;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class Teste {
	// private String cookies;

	public static void main(String[] args) {
		RestClientConsumer consumer = new RestClientConsumer();
		
		try {
			ArrayList<String> planetas = consumer.getPlanetas(1);
			String s = planetas.get(0);
			System.out.println(s);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}