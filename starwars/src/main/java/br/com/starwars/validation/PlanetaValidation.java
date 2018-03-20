package br.com.starwars.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.starwars.models.Planeta;

public class PlanetaValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Planeta.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "clima", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "terreno", "field.required");
	}
}