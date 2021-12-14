package controller.usuarios;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Propuesta;
import model.Usuario;
import persistence.commons.DAOFactory;
import services.UsuarioService;

@WebServlet("/usuario/compras.do")
public class ListUserComprasServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 3427393377514997175L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");
		Usuario usuario2 = usuarioService.find(usuario.getUsuario_id());
		
		LinkedList<Propuesta> propuestasCompradas = usuario2.getPropuestasContratadas();  
				
		req.setAttribute("propuestas", propuestasCompradas);
		
		

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/usuarios/resumenCompras.jsp");
		dispatcher.forward(req, resp);

	}

}
