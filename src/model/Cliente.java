package model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Cliente  implements Serializable{
	
	 
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	String nome,cognome,indirizzo,telefono;
	 
	Timestamp appuntamento;

		public Cliente(int id,String nome,String cognome,String telefono,String indirizzo,Timestamp appuntamento) {
		
		this.id=id;
		this.nome=nome;
			this.cognome=cognome;
			this.telefono=telefono;
			this.indirizzo=indirizzo;
			this.appuntamento=appuntamento;
			
		}

	 
		public Timestamp getAppuntamento() {
			return appuntamento;
		}

		public void setAppuntamento(Timestamp appuntamento) {
			this.appuntamento = appuntamento;
		}
	 
		public String getNome() {
			return nome;
		}

		public void setNome(String nome) {
			this.nome = nome;
		}
		 
		public String getCognome() {
			return cognome;
		}

		public void setCognome(String cognome) {
			this.cognome = cognome;
		}
		 
		public String getIndirizzo() {
			return indirizzo;
		}

		public void setIndirizzo(String indirizzo) {
			this.indirizzo = indirizzo;
		}
	 
		public String getTelefono() {
			return telefono;
		}

		public void setTelefono(String telefono) {
			this.telefono = telefono;
		}
		
		

}
