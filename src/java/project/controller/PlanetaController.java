/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import bda.dao.BussinessException;
import bda.dao.BussinessMessage;
import java.io.UnsupportedEncodingException;
import project.persistence.dao.PlanetaDAO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import project.model.Planeta;
import project.model.Satelite;
import project.persistence.dao.SateliteDAO;

/**
 *
 * @author Lorenzo González
 */
@MultipartConfig
@Controller
public class PlanetaController {

    @Autowired
    private PlanetaDAO planetaDAO;
    @Autowired
    private SateliteDAO sateliteDao;

    @RequestMapping({"/planeta"})
    public ModelAndView read(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        

        try {
            List<Planeta> planetas = planetaDAO.findAll();
            List<Satelite> satelites = sateliteDao.findAll();
            model.put("planetas", planetas);
            model.put("satelites", satelites);
            viewName = "planetasListado";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/planeta/newForInsert.html"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Planeta planeta = planetaDAO.create();
            model.put("formOperation", FormOperation.INSERT);
            model.put("planeta", planeta);

            viewName = "planeta";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/planeta/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Planeta planeta = null;
        try {
            planeta = planetaDAO.create();
            planeta.setNombre(request.getParameter("nombre"));
            

            planetaDAO.saveOrUpdate(planeta);

            viewName = "redirect:/planeta.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/planeta/readForUpdate.html"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Planeta planeta = planetaDAO.get(id);
            if (planeta == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el planeta con id = " + id));
            }
            model.put("formOperation", FormOperation.UPDATE);
            model.put("planeta", planeta);
            viewName = "planeta";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/planeta/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Planeta planeta = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idPlaneta"));

            planeta = planetaDAO.get(id);
            if (planeta == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el planeta"));
            }
            planeta.setNombre(request.getParameter("nombre"));
            

            planetaDAO.saveOrUpdate(planeta);

            viewName = "redirect:/planeta.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/planeta/readForDelete.html"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Planeta planeta = planetaDAO.get(id);
            if (planeta == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el planeta con id = " + id));
            }
            model.put("formOperation", FormOperation.DELETE);
            model.put("planeta", planeta);
            viewName = "planeta";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/planeta/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Planeta planeta = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idPlaneta"));

            planeta = planetaDAO.get(id);
            if (planeta == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el planeta a borrar"));
            }

            planetaDAO.delete(id);

            viewName = "redirect:/planeta.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("planeta", planeta);
            model.put("formOperation", FormOperation.DELETE);
            viewName = "planeta";
        }
        return new ModelAndView(viewName, model);
    }
}
