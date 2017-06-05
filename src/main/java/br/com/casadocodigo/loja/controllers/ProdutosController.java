package br.com.casadocodigo.loja.controllers;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("produtos")
public class ProdutosController {

    @Autowired
    private ProdutoDAO produtoDao;

    @RequestMapping("/form")
    public ModelAndView form() {
    	ModelAndView modelAndView = new ModelAndView("produtos/form");
    	modelAndView.addObject("tipos", TipoPreco.values());
        return modelAndView;
    }

    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView grava(Produto produto, RedirectAttributes redirectAttributes) {

        System.out.println(produto);
        produtoDao.gravar(produto);
        redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso!");
        return new ModelAndView("redirect:produtos");
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView listar() {
    	ModelAndView mv = new ModelAndView("produtos/lista");
    	List<Produto> produtos = produtoDao.listar();
    	mv.addObject("produtos", produtos);
    	return mv;
    }

}
