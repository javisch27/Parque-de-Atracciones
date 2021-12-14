package controller.session;

import java.util.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import model.Promocion;
import model.Usuario;
import services.AtraccionService;
import services.LoginService;
import services.PromocionService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 8308079314140233763L;
	private LoginService loginService;
	private PromocionService promocionService;

	@Override
	public void init() throws ServletException {
		super.init();
		loginService = new LoginService();
		this.promocionService = new PromocionService(); // TODO esta bien esto aca??
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nombre = req.getParameter("username");
		String password = req.getParameter("password");

		Usuario usuario = loginService.login(nombre, password);

		if (!usuario.isNull()) {

			if (usuario.isAdmin()) {
				req.getSession().setAttribute("usuario", usuario);
				req.getSession().setAttribute("partial", "index");
				resp.sendRedirect("/views/admin/index.jsp");

			} else {

				String lado = usuario.getTipoAtraccionPreferida().getNombre();

//				System.out.println(lado);
				List<Promocion> promociones = promocionService.list(); // TODO cambiar por promociones cuando esté
																		// armado

				req.getSession().setAttribute("lado", lado);
				req.getSession().setAttribute("promociones", promociones);
				req.getSession().setAttribute("usuario", usuario);

				resp.sendRedirect("/index2.jsp");

			}

		} else {
			req.setAttribute("flash", "Nombre de usuario o contraseña incorrectos");// TODO falta poner los mensjes

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
