package br.com.starwars.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.starwars.controllers.HomeController;
import br.com.starwars.dao.PlanetaDao;

@EnableWebMvc
@ComponentScan(basePackageClasses={HomeController.class, PlanetaDao.class})
public class AppWebConfiguration {

	@Bean
	public InternalResourceViewResolver internalResourceViewResolver(){
	    InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	    resolver.setPrefix("/WEB-INF/views/");
	    resolver.setSuffix(".jsp");
	    return resolver;
	}
}