package br.com.starwars.services;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.swapi.models.Planet;
import com.swapi.sw.StarWars;
import com.swapi.sw.StarWarsApi;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

@Component
public class RestClientConsumer {

	public ArrayList<String> getPlanetas( int i ) throws Exception {
		ArrayList<String> lista = new ArrayList<>();
        StarWarsApi.init();
        StarWars api = StarWarsApi.getApi();
        
        api.getPlanet(i, new Callback<Planet>() {

			@Override
			public void success(Planet t, Response response) {
				lista.add(t.name);				
			}

			@Override
			public void failure(RetrofitError error) {
				// TODO Auto-generated method stub
				
			}

        	
        });
        
        return lista;
	}
}