package controller.attractions;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import model.Ofertador;
import model.Usuario;
import services.AtraccionService;
import services.UsuarioService;

@WebServlet("/attractions")
public class ListAttractionsServlet extends HttpServlet implements Servlet {

	private static final long serialVersionUID = -8346640902238722429L;
	private AtraccionService atraccionService;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.atraccionService = new AtraccionService();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Atraccion> atracciones = atraccionService.list();
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");
		String lado = req.getParameter("lado");

		if (usuario != null ) {
			req.setAttribute("atracciones", atracciones);
			Usuario usuario2 = usuarioService.find(usuario.getUsuario_id());
			String partial = req.getParameter("partial");
		

			if (usuario2.isAdmin()) {//admin
				
				if (partial != null && partial.equals("listadoParaPromos") ) {	//crea listado atracciones para promo				
				
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/promociones/create.do");
					dispatcher.forward(req, resp);

				} else if (partial != null && partial.equals("editandoPromos") ) {
										
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/promociones/edit2.jsp");
					dispatcher.forward(req, resp);
							
				
				} else { //listado atraccciones en panel
					
					req.setAttribute("atracciones", atracciones);
					req.setAttribute("partial", "atracciones");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/admin/index.jsp");
					dispatcher.forward(req, resp);

				}

			} else { //usuario logeado
				
				List<Atraccion> atraccionesOrdenadas = Ofertador.ordenarAtracciones(atracciones,usuario.getTipoAtraccionPreferida());			
				req.setAttribute("atracciones", atraccionesOrdenadas);		
				req.setAttribute("lado", lado.toUpperCase());
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/index2.jsp");
				dispatcher.forward(req, resp);
			}

		} else if (lado != null) { //usuario no logueado

			req.setAttribute("atracciones", atracciones);		
			req.setAttribute("lado", lado.toUpperCase());
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/attractions/index2.jsp");
			dispatcher.forward(req, resp);

		} else { //directo 
			resp.sendRedirect("/");
		}

	}

}
