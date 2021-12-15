package controller.usuarios;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TipoAtraccion;
import model.Usuario;
import services.UsuarioService;

@WebServlet("/usuarios/create.do")
public class CreateUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 3455721046062278592L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/usuarios/create2.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nombre = req.getParameter("nombre");
		String password = req.getParameter("password");
		Boolean admin = Boolean.parseBoolean(req.getParameter("admin"));
		TipoAtraccion tipoAtraccion = TipoAtraccion.valueOf(req.getParameter("tipoAtraccionPreferida"));
		Integer presupuestoDisponible = Integer.parseInt(req.getParameter("presupuestoDisponible"));
		Double tiempoMaximo = Double.parseDouble(req.getParameter("tiempoDisponible"));

		Usuario usuario = usuarioService.create(nombre, password, admin, tipoAtraccion, presupuestoDisponible, tiempoMaximo);
		if (usuario.isValid()) {
			resp.sendRedirect("/usuarios/index.do");
		} else {
			req.setAttribute("usuario", usuario);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/views/usuarios/create2.jsp");
			dispatcher.forward(req, resp);
		}

	}

}