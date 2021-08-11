/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.controller;

import bda.dao.BussinessException;
import bda.dao.BussinessMessage;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import project.model.Usuario;
import project.persistence.dao.UsuarioDAO;

/**
 *
 * @author EDGAR
 */
@Controller
public class UsuarioController {

    @Autowired
    private UsuarioDAO usuarioDao;

    @RequestMapping({"/usuario"})
    public ModelAndView read(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            List<Usuario> usuarios = usuarioDao.findAll();
            model.put("usuarios", usuarios);
            viewName = "usuariosListado";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }
    
    

    @RequestMapping({"/usuario/newForInsert.html"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Usuario usuario = usuarioDao.create();
            model.put("formOperation", FormOperation.INSERT);
            model.put("usuario", usuario);

            viewName = "usuario";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Usuario usuario = null;
        try {
            usuario = usuarioDao.create();
            usuario.setUsuario(request.getParameter("usuario"));
            usuario.setPassword(request.getParameter("password"));

            usuarioDao.saveOrUpdate(usuario);

            model.put("formOperation", FormOperation.LOGIN);
            viewName = "redirect:/usuario.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/readForUpdate.html"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Usuario usuario = usuarioDao.get(id);
            if (usuario == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el usuario con id = " + id));
            }
            model.put("formOperation", FormOperation.UPDATE);
            model.put("usuario", usuario);
            viewName = "gestionarUsuario";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Usuario usuario = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idUsuario"));

            usuario = usuarioDao.get(id);
            if (usuario == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el usuario"));
            }
            usuario.setUsuario(request.getParameter("usuario"));
            usuario.setPassword(request.getParameter("password"));

            usuarioDao.saveOrUpdate(usuario);

            viewName = "redirect:/usuario.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/readForDelete.html"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        int id;

        id = Integer.parseInt(request.getParameter("id"));

        try {
            Usuario usuario = usuarioDao.get(id);
            if (usuario == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el usuario con id = " + id));
            }
            model.put("formOperation", FormOperation.DELETE);
            model.put("usuario", usuario);
            viewName = "gestionarUsuario";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        request.setCharacterEncoding("UTF-8");

        Usuario usuario = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("idUsuario"));

            usuario = usuarioDao.get(id);
            if (usuario == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el usuario a borrar"));
            }

            usuarioDao.delete(id);

            viewName = "redirect:/usuario.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("usuario", usuario);
            model.put("formOperation", FormOperation.DELETE);
            viewName = "usuario";
        }
        return new ModelAndView(viewName, model);
    }
    
    
    @RequestMapping({"/index.html"})
    public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        viewName = "usuario";
        model.put("formOperation", FormOperation.LOGIN);

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/usuario/login"})
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            String us, password;
            try {
                us = request.getParameter("usuario");
                password = request.getParameter("password");
            } catch (NumberFormatException e) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el usuario a borrar"));
            }

            Usuario usuario = null;
            List<Usuario> usuarios = usuarioDao.findAll();

            for (Usuario u : usuarios) {
                if (u.getUsuario().contentEquals(us) && u.getPassword().contentEquals(password)) {
                    usuario = u;
                }
            }
            if (usuario != null) {
                model.put("usuario", usuario);
                viewName = "menu";
            } else {
                model.put("formOperation", FormOperation.LOGIN);
                viewName = "usuario";
            }

        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }
        return new ModelAndView(viewName, model);
    }

}
