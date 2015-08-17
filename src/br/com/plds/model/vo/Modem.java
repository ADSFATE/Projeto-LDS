package br.com.plds.model.vo;

public class Modem {

	private String tipo;
	private String numeroSerie;
	private String fabricante;
	private String matTecnico;

	public String getNumeroSerie() {
		return numeroSerie;
	}

	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public String getMatTecnico() {
		return matTecnico;
	}

	public void setMatTecnico(String matTecnico) {
		this.matTecnico = matTecnico;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
}
