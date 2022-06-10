package br.com.crudjspjava.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import br.com.crudjspjava.dao.UsuarioDao;
import br.com.crudjspjava.bean.Usuario;


@WebServlet("/login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UsuarioDao UsuarioDao;
	
	public void init() {
		UsuarioDao = new UsuarioDao();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		Usuario Usuario = new Usuario();
		Usuario.setEmail(email);
		Usuario.setSenha(senha);
		try {
			if(UsuarioDao.loginUsuario(Usuario)) {
				response.sendRedirect("HTML/index.html");
			}
			else {
				HttpSession session = request.getSession();
				response.sendRedirect("loginerro.jsp");
			}
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
