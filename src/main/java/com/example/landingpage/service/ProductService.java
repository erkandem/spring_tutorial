package com.example.landingpage.service;

import com.example.landingpage.model.Product;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    public List<Product> getProducts() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            // Inline JSON content as a String
            String json = """
            [
              {
                "id": "1",
                "name": "Product A",
                "description": "Description for Product A",
                "price": 19.99
              },
              {
                "id": "2",
                "name": "Product B",
                "description": "Description for Product B",
                "price": 29.99
              }
            ]
            """;

            // Parse the JSON string into a list of Product objects
            return mapper.readValue(json, new TypeReference<List<Product>>() {});
        } catch (Exception e) {
            throw new RuntimeException("Error parsing inline JSON", e);
        }
    }
}
