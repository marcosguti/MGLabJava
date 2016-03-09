package domain;

import javax.persistence.*;


//@Entity
public class Paciente {
//	  @Id
//	    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="paciente_id_seq")
//	    @SequenceGenerator(name="paciente_id_seq", sequenceName="paciente_id_seq", allocationSize=1)
//	    @Column(name = "id")
	private int id;
	private String cedula;
	private String nombres;
	private String telefono;
	private String sexo;
        private String direccion;
	private int edad;
	
	public Paciente(){}

    public Paciente(String cedula, String nombres, String telefono, String sexo, String direccion, int edad) {
        this.cedula = cedula;
        this.nombres = nombres;
        this.telefono = telefono;
        this.sexo = sexo;
        this.direccion = direccion;
        this.edad = edad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	

}
