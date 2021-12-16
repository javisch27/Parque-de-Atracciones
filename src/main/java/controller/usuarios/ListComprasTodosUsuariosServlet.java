package controller.usuarios;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Propuesta;
import model.Usuario;
import services.UsuarioService;

@WebServlet("/usuarios/comprasTodosUsuarios.do")
public class ListComprasTodosUsuariosServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 3427393377514997175L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Usuario> usuarios = usuarioService.list();
		Map <Usuario, Propuesta> compras = new HashMap<Usuario, Propuesta>();
		for(Usuario usuario : usuarios) {
			for(Propuesta propuesta : usuario.getPropuestasCompradas()) {
				compras.put(usuario, propuesta);
			}
		}

		req.setAttribute("compras", compras);

//		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/usuarios/comprasTodosUsuarios.jsp");
//		dispatcher.forward(req, resp);
		
		req.setAttribute("partial", "compras");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/index.jsp");
		dispatcher.forward(req, resp);

	}

}