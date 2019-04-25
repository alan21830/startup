package model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.eclipse.persistence.jpa.jpql.parser.DateTime;

@Entity
@Table(name="Clienti")
public class Cliente  implements Serializable{
	
	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
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

		@Column(name="APPUNTAMENTO")
 	    @Temporal(TemporalType.TIMESTAMP)
		public Timestamp getAppuntamento() {
			return appuntamento;
		}

		public void setAppuntamento(Timestamp appuntamento) {
			this.appuntamento = appuntamento;
		}
		@Column(name="NOME")
		public String getNome() {
			return nome;
		}

		public void setNome(String nome) {
			this.nome = nome;
		}
		@Column(name="COGNOME")
		public String getCognome() {
			return cognome;
		}

		public void setCognome(String cognome) {
			this.cognome = cognome;
		}
		@Column(name="INDIRIZZO")
		public String getIndirizzo() {
			return indirizzo;
		}

		public void setIndirizzo(String indirizzo) {
			this.indirizzo = indirizzo;
		}
		@Column(name="TELEFONO")
		public String getTelefono() {
			return telefono;
		}

		public void setTelefono(String telefono) {
			this.telefono = telefono;
		}
		
		

}
