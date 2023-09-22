package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Contact;

public class ContactDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/gestion_contact?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	private String jdbcDriver = "com.mysql.jdbc.Driver";
	
	private static final String INSERT_USERS_SQL = "INSERT INTO contact" + "  (nom_con,prenom_con , email,  cin,  adresse, tel ) VALUES "
			+ " (?, ?, ?, ?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select id,nom_con,prenom_con , email,  cin,  adresse, tel from contact where id =?";
	private static final String SELECT_ALL_USERS = "select * from contact";
	private static final String DELETE_USERS_SQL = "delete  from contact where id = ?;";
	private static final String UPDATE_USERS_SQL = "update contact set  nom_con =?,prenom_con=?,email=?,cin=?,adresse=?,tel=?  where id= ?;";

	public ContactDao() {
		
	}

	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			System.out.println("connecte");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void insertUser(Contact contact) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			
			preparedStatement.setString(1, contact.getNom_con());
			preparedStatement.setString(2, contact.getPrenom_con());
			preparedStatement.setString(3, contact.getEmail());
			preparedStatement.setString(4, contact.getCin());
			preparedStatement.setString(5, contact.getAdresse());
			preparedStatement.setInt(6, contact.getTel());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Contact selectUser(int id) {
		Contact contact = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				
				String nom_con = rs.getString("nom_con");
				String prenom_con = rs.getString("prenom_con");
				String email = rs.getString("email");
				String cin = rs.getString("cin");
				String adresse = rs.getString("adresse");
				int tel = rs.getInt("tel");
				
				contact = new Contact(id, nom_con,prenom_con,email,cin,adresse,tel);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return contact;
	}

	public List<Contact> selectAllUsers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Contact> contacts = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id= rs.getInt("id");
				String nom_con = rs.getString("nom_con");
				String prenom_con = rs.getString("prenom_con");
				String email = rs.getString("email");
				String cin = rs.getString("cin");
				String adresse = rs.getString("adresse");
				int tel= rs.getInt("tel");
				
				contacts.add(new Contact(id, nom_con,prenom_con,email,cin,adresse,tel ));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return contacts;
	}

	public boolean deleteUser(int id_fonct) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id_fonct);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateUser(Contact contact) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			System.out.println("updated USer:"+statement);
			
			statement.setString(1, contact.getNom_con());
			statement.setString(2, contact.getPrenom_con());
			statement.setString(3, contact.getEmail());
			statement.setString(4, contact.getCin());
			statement.setString(5, contact.getAdresse());
			statement.setInt(6, contact.getTel());
			statement.setInt(7, contact.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	

	
	

	

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
