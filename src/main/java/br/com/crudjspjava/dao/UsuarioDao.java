package br.com.crudjspjava.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import br.com.crudjspjava.bean.Usuario;
public class UsuarioDao {
	
	public static Connection getConnection() {
		
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbusers","root","root");
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
	public static int excluirUsuario(Usuario u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps =  (PreparedStatement) con.prepareStatement("DELETE FROM users WHERE id=?");
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
		}
		catch (Exception e) {
		System.out.println(e);
		}
		return status;
	
	
	}
	public static int salvarUsuario(Usuario u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps =  (PreparedStatement) con.prepareStatement("INSERT INTO users(nome, data_nascimento, sexo, email, senha) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, u.getNome());
			ps.setDate(2, new Date(u.getData_nascimento().getTime()));
			ps.setString(3, u.getSexo());
			ps.setString(4, u.getEmail());
			ps.setString(5, u.getSenha());
			status = ps.executeUpdate();
		}
		catch (Exception e) {
		System.out.println(e);
		}
		return status;
	}

	public boolean loginUsuario(Usuario Usuario) throws ClassNotFoundException{
		boolean status = false;
		try {
			Connection con = getConnection();
			PreparedStatement ps =  (PreparedStatement) con.prepareStatement("SELECT * FROM users WHERE email=? and senha=?");
			ps.setString(1, Usuario.getEmail());
			ps.setString(2, Usuario.getSenha());
			ResultSet rs = ps.executeQuery();
			status = rs.next();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static Usuario getRegistroById(int id){
		Usuario users = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps =  (PreparedStatement) con.prepareStatement("SELECT * FROM users WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				users = new Usuario();
				users.setId(rs.getInt("id"));
				users.setNome(rs.getString("nome"));
				users.setData_nascimento(new java.util.Date(rs.getDate("data_nascimento").getTime()));
				users.setSexo(rs.getString("sexo"));
				users.setEmail(rs.getString("email"));
				users.setSenha(rs.getString("senha"));
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return users;
	}
	
	public static int updateUsuario(Usuario u) {
		int status = 0;
		
		System.out.println("U ----> " + u);
		System.out.println( "id ----> " + u.getId());
		System.out.println( "nome ----> " + u.getNome());
		System.out.println( "data ----> " + new Date(u.getData_nascimento().getTime()));
		System.out.println( "sexo ----> " + u.getSexo());
		System.out.println("e-mail ----> " + u.getEmail());
		System.out.println("senha ----> " +u.getSenha());

		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE users SET nome=?,"
					+ " data_nascimento=?, sexo=?, email=?, senha=? WHERE id=?");
			ps.setString(1, u.getNome());
			ps.setDate(2, new Date(u.getData_nascimento().getTime()));
			ps.setString(3, u.getSexo());
			ps.setString(4, u.getEmail());
			ps.setString(5, u.getSenha());		
			ps.setInt(6, u.getId());

			System.out.println("P ----> " + ps);
			status = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
public static List<Usuario> getAllUsuarios(){
	List<Usuario> list = new ArrayList<Usuario>();
	
	try {
		Connection con = getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM users");
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			Usuario users = new Usuario();
			users.setId(rs.getInt("id"));
			users.setNome(rs.getString("nome"));
			users.setData_nascimento(rs.getDate("data_nascimento"));
			users.setSexo(rs.getString("sexo"));
			users.setEmail(rs.getString("email"));
			users.setSenha(rs.getString("senha"));
			list.add(users);
		}
	}catch (Exception e){
		System.out.println(e);
	}
	return list;
}
	
}
