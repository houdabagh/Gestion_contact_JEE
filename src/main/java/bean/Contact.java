package bean;


public class Contact {
	protected int id;
	protected String nom_con ;
	protected String prenom_con ;
	protected String email;
	protected String cin;
	protected String adresse;
	protected int tel;
	
	public Contact() {
	}
	
	public Contact(String nom_con, String prenom_con , String email, String cin, String adresse,int tel) {
		super();
		this.nom_con = nom_con;
		this.prenom_con = prenom_con;
		this.email = email;
		this.cin = cin;
		this.adresse = adresse;
		this.tel = tel;
		
	}

	public Contact(int id, String nom_con, String prenom_con , String email, String cin, String adresse,int tel) {
		super();
		this.id=id;
		this.nom_con = nom_con;
		this.prenom_con = prenom_con;
		this.email = email;
		this.cin = cin;
		this.adresse = adresse;
		this.tel = tel;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom_con() {
		return nom_con;
	}

	public void setNom_con(String nom_con) {
		this.nom_con = nom_con;
	}

	public String getPrenom_con() {
		return prenom_con;
	}

	public void setPrenom_con(String prenom_con) {
		this.prenom_con = prenom_con;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	
	
}
