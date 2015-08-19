package br.com.plds.model.vo;

public class Modem {

	private int idAtribuicao;
	private String tipo;
	private String numeroSerie;
	private String fabricante;
	private String matTecnico;
	private String dataAtribuicao;
	private String dataBaixado;
	private int numeroCircuito;
	private String ratFrente;
	private String ratVerso;
	private String status;

	public int getIdAtribuicao() {
		return idAtribuicao;
	}

	public void setIdAtribuicao(int idAtribuicao) {
		this.idAtribuicao = idAtribuicao;
	}
	
	public String getDataAtribuicao() {
		return dataAtribuicao;
	}

	public void setDataAtribuicao(String dataAtribuicao) {
		this.dataAtribuicao = dataAtribuicao;
	}

	public String getDataBaixado() {
		return dataBaixado;
	}

	public void setDataBaixado(String dataBaixado) {
		this.dataBaixado = dataBaixado;
	}

	public int getNumeroCircuito() {
		return numeroCircuito;
	}

	public void setNumeroCircuito(int numeroCircuito) {
		this.numeroCircuito = numeroCircuito;
	}

	public String getRatFrente() {
		return ratFrente;
	}

	public void setRatFrente(String ratFrente) {
		this.ratFrente = ratFrente;
	}

	public String getRatVerso() {
		return ratVerso;
	}

	public void setRatVerso(String ratVerso) {
		this.ratVerso = ratVerso;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

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
