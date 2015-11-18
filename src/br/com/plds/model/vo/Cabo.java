package br.com.plds.model.vo;

public class Cabo {

	private int idAtribuicao;
	private String tipo;
	private String numeroSerie;
	private String fabricante;
	private String matTecnico;
	private String dataAtribuicao;
	private String cliente;
	private String dataBaixado;
	private String numeroCircuito;
	private String numRat;
	
	public String getNumRat() {
		return numRat;
	}

	public void setNumRat(String numRat) {
		this.numRat = numRat;
	}

	private String ratFrente;
	private String ratVerso;
	private String status;

		
	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

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

	public String getNumeroCircuito() {
		return numeroCircuito;
	}

	public void setNumeroCircuito(String numeroCircuito) {
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
