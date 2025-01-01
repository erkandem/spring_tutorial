package com.example.landingpage.seed;

import com.example.landingpage.model.Product;
import com.example.landingpage.repository.ProductRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DatabaseSeeder implements CommandLineRunner {

    private final ProductRepository productRepository;

    public DatabaseSeeder(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public void run(String... args) {
        System.out.println("Starting database seeding...");
        if (productRepository.count() == 0) {
            productRepository.save(new Product("Product A", "Description for Product A", 19.99));
            productRepository.save(new Product("Product B", "Description for Product B", 29.99));
            productRepository.save(new Product("Product C", "Description for Product C", 39.99));

            System.out.println("Database seeding completed successfully.");
        } else {
            System.out.println("Database already contains data. Seeding skipped.");
        }
    }
}
