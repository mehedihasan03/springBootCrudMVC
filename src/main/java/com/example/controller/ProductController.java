package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Product;
import com.example.repository.ProductRepository;

@Controller
public class ProductController {

	@Autowired
	private ProductRepository productRepository;
	
	@GetMapping("/")
	public ModelAndView indexpage(){
		return new ModelAndView("create_product");
	}
	
	@GetMapping("/products")
	public ModelAndView getProducts() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Product> productList = productRepository.findAll();
		map.put("productList", productList);
		return new ModelAndView("product_table", "data", map);
	}
	
	@PostMapping("/product_save")
	public ModelAndView saveProducts(@ModelAttribute Product entity, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Product product = productRepository.save(entity);
		map.put("productList", product);
		return new ModelAndView("create_product" , "data", map);
	}
	
	@GetMapping("/delete/{id}")
	public ModelAndView delete(@PathVariable(value = "id") long id) {
		Product product = productRepository.findById(id).get();
		productRepository.delete(product);
		return new ModelAndView("redirect:/products");
	}
	
	@GetMapping("/edit/{id}")
	public ModelAndView edit_product(@PathVariable(value = "id") long id) {
		Map<String, Object> map = new HashMap<>();
		Product product = productRepository.findById(id).get();
		map.put("product", product);
		return new ModelAndView("edit_products", "data", map);
	}
	
	@PostMapping("/update")
	public ModelAndView updateProducts(@ModelAttribute Product product, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		product = productRepository.save(product);
		map.put("productList", product);
		return new ModelAndView("create_product" , "data", map);
	}
}
