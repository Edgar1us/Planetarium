/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import bda.dao.BussinessException;
import bda.dao.BussinessMessage;
import java.io.UnsupportedEncodingException;
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
import project.persistence.dao.PlanetaDAO;
import project.persistence.dao.SateliteDAO;

/**
 *
 * @author Lorenzo González
 */
@MultipartConfig
@Controller
public class SateliteController {

    @Autowired
    private SateliteDAO sateliteDAO;
    @Autowired
    private PlanetaDAO planetaDAO;

    @RequestMapping({"/satelite"})
    public ModelAndView read(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            List<Satelite> satelites = sateliteDAO.findAll();
            model.put("satelites", satelites);
            viewName = "sateliteListado";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/satelite/newForInsert.html"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Satelite satelite = sateliteDAO.create();
            model.put("formOperation", FormOperation.INSERT);
            model.put("satelite", satelite);

            viewName = "satelite";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/satelite/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Satelite satelite = null;
        
        try {
            satelite = sateliteDAO.create();
            satelite.setPeriodo(request.getParameter("periodo"));
            satelite.setPeso(request.getParameter("peso"));
            satelite.setMedida(request.getParameter("medida"));
            satelite.setPlaneta(planetaDAO.get(Integer.parseInt(request.getParameter("idPlaneta"))));

            sateliteDAO.saveOrUpdate(satelite);

            viewName = "redirect:/satelite.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/satelite/readForUpdate.html"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Satelite satelite = sateliteDAO.get(id);
            if (satelite == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el satelite con id = " + id));
            }
            model.put("formOperation", FormOperation.UPDATE);
            model.put("satelite", satelite);
            viewName = "satelite";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/satelite/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Satelite satelite = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idSatelite"));

            satelite = sateliteDAO.get(id);
            if (satelite == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el satelite"));
            }
            satelite.setPeriodo(request.getParameter("periodo"));
            satelite.setPeso(request.getParameter("peso"));
            satelite.setMedida(request.getParameter("medida"));
            

            sateliteDAO.saveOrUpdate(satelite);

            viewName = "redirect:/satelite.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/satelite/readForDelete.html"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Satelite satelite = sateliteDAO.get(id);
            if (satelite == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el satelite con id = " + id));
            }
            model.put("formOperation", FormOperation.DELETE);
            model.put("satelite", satelite);
            viewName = "satelite";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/satelite/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Satelite satelite = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idSatelite"));

            satelite = sateliteDAO.get(id);
            if (satelite == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el satelite a borrar"));
            }

            sateliteDAO.delete(id);

            viewName = "redirect:/satelite.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("satelite", satelite);
            model.put("formOperation", FormOperation.DELETE);
            viewName = "satelite";
        }
        return new ModelAndView(viewName, model);
    }
}
