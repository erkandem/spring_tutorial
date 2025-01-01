package com.example.landingpage.controller;

import com.example.landingpage.model.Product;
import com.example.landingpage.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class LandingPageController {

    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String showLandingPage(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "index";
    }
}