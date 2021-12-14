package controller.usuarios;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import model.TipoAtraccion;
import model.Usuario;
import services.UsuarioService;

@WebServlet("/usuarios/edit.do")
public class EditUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 7598291131560345626L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));

		Usuario usuario = usuarioService.find(id);
		req.setAttribute("usuario", usuario);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/usuarios/edit2.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String password = req.getParameter("password");
		Boolean admin = Boolean.parseBoolean(req.getParameter("admin"));
		TipoAtraccion tipoAtraccion = TipoAtraccion.valueOf(Integer.parseInt(req.getParameter("Tipo_Atraccion")));
		Integer presupuestoDisponible = Integer.parseInt(req.getParameter("presupuestoDisponible"));
		Double tiempoMaximo = Double.parseDouble(req.getParameter("tiempoMaximo"));
		Integer usuario_id = Integer.parseInt(req.getParameter("usuario_id"));

		Usuario usuario = usuarioService.update(password, admin, tipoAtraccion, presupuestoDisponible, tiempoMaximo,
				usuario_id);

		if (usuario.isValid()) {
//			resp.sendRedirect("/LaFuerza-Turismo/usuarios/index.do");
			resp.sendRedirect("/views/admin/index.jsp&partial=usuarios");
			
		} else {
			req.setAttribute("usuario", usuario);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/usuarios/edit2.jsp");
			dispatcher.forward(req, resp);
		}
	}
}