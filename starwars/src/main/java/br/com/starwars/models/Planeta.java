package br.com.starwars.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Planeta implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6609559622375692971L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String nome;
	private String clima;
	private String terreno;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getClima() {
		return clima;
	}
	public void setClima(String clima) {
		this.clima = clima;
	}
	public String getTerreno() {
		return terreno;
	}
	public void setTerreno(String terreno) {
		this.terreno = terreno;
	}
	
	@Override
	public String toString() {
		return "Planeta [id=" + id + ", nome=" + nome + ", clima=" + clima + ", terreno=" + terreno + "]";
	}
}