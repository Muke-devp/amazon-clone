CREATE DATABASE IF NOT EXISTS amazon_clone;

USE amazon_clone;
-- 1. Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Products Table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image VARCHAR(500) NOT NULL,
    category VARCHAR(100),
    rating DECIMAL(3, 2) DEFAULT 0.0,
    countInStock INT DEFAULT 10,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Orders Table
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(50) DEFAULT 'Paid',
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
);

INSERT INTO
    products (
        title,
        description,
        price,
        image,
        category,
        countInStock,
        rating
    )
VALUES (
        'Wireless Bluetooth Headphones',
        'High quality sound with noise cancellation and long battery life.',
        99.99,
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&q=80',
        'Electronics',
        10,
        4.5
    ),
    (
        'Smart Watch Series 7',
        'Fitness tracker with heart rate monitor and HD display.',
        199.99,
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&q=80',
        'Electronics',
        5,
        4.8
    ),
    (
        'Men\'s Casual Jacket',
        'Slim fit warm winter coat made with durable materials.',
        49.99,
        'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500&q=80',
        'Clothing',
        15,
        4.2
    ),
    (
        'John Hardy Men\'s Silver Bracelet',
        'Classic chain bracelet inspired by traditional jewelry design.',
        695.00,
        'https://images.unsplash.com/photo-1611591475874-a20c15efd581?w=500&q=80',
        'Jewelry',
        8,
        4.6
    ),
    (
        'Solid Gold Petite Micropave Ring',
        'Satisfaction Guaranteed. Elegant design for special occasions.',
        168.00,
        'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=500&q=80',
        'Jewelry',
        12,
        3.9
    ),
    (
        'Portable External Hard Drive 2TB',
        'USB 3.0 fast transfer rate for PC, Mac, and gaming consoles.',
        64.99,
        'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=500&q=80',
        'Electronics',
        20,
        4.7
    ),
    (
        '27-Inch Gaming Monitor 144Hz',
        'Full HD IPS display with ultra-fast response time.',
        229.99,
        'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500&q=80',
        'Electronics',
        7,
        4.9
    ),
    (
        'Women\'s Winter Warm Fleece Coat',
        'Thickened outdoor jacket with hood and comfortable fit.',
        59.99,
        'https://images.unsplash.com/photo-1539533018447-63fcce2678e3?w=500&q=80',
        'Clothing',
        18,
        4.4
    ),
    (
        'Ergonomic Mesh Office Chair',
        'Adjustable lumbar support and breathable mesh back.',
        129.99,
        'https://images.unsplash.com/photo-1580481072645-022f9a6d8310?w=500&q=80',
        'Furniture',
        14,
        4.3
    ),
    (
        'Stainless Steel Electric Kettle 1.7L',
        'Fast boiling with auto shut-off protection.',
        29.99,
        'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f6?w=500&q=80',
        'Home & Kitchen',
        25,
        4.1
    ),
    (
        'Classic Leather Sneakers',
        'Comfortable white casual sneakers made with premium materials.',
        79.99,
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80',
        'Fashion',
        15,
        4.3
    ),
    (
        'Ergonomic Mechanical Keyboard',
        'RGB backlit gaming keyboard with smooth switches.',
        65.00,
        'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500&q=80',
        'Electronics',
        12,
        4.8
    ),
    (
        'Minimalist Quartz Wristwatch',
        'Elegant analog watch with a genuine leather strap.',
        120.00,
        'https://images.unsplash.com/photo-1524805444758-089113d48a6d?w=500&q=80',
        'Fashion',
        6,
        4.6
    ),
    (
        'Professional Camera Lens 50mm',
        'Fast aperture lens for sharp portraits and photography.',
        299.99,
        'https://images.unsplash.com/photo-1617005082133-548c4dd27f35?w=500&q=80',
        'Electronics',
        5,
        4.9
    ),
    (
        'Stainless Steel Water Bottle 1L',
        'Insulated thermal flask that keeps drinks cold.',
        25.00,
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=500&q=80',
        'Home & Kitchen',
        20,
        4.4
    ),
    (
        'Unisex Denim Jacket',
        'Classic blue denim jacket with comfortable fit.',
        55.00,
        'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=500&q=80',
        'Fashion',
        10,
        4.2
    );