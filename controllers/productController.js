const db = require('../config/db');

// 1. get All products
exports.getProducts = async (req, res) => {
  try {
    const [products] = await db.execute('SELECT * FROM products');
    res.json(products);
  } catch (error) {
    res.status(500).json({ message: 'Server Error', error: error.message });
  }
};

// 2. Get Single Product
exports.getProductById = async (req, res) => {
  try {
    const [product] = await db.execute('SELECT * FROM products WHERE id = ?', [req.params.id]);
    if (product.length === 0) {
      return res.status(404).json({ message: 'Product not found!' });
    }
    res.json(product[0]);
  } catch (error) {
    res.status(500).json({ message: 'Server Error', error: error.message });
  }
};

// 3. create new products
exports.createProduct = async (req, res) => {
  const { title, price, image, category, countInStock, description } = req.body;

  try {
    const [result] = await db.execute(
      `INSERT INTO products (title, price, image, category, countInStock, description) 
       VALUES (?, ?, ?, ?, ?, ?)`,
      [title, price, image, category, countInStock || 0, description]
    );

    res.status(201).json({ id: result.insertId, ...req.body });
  } catch (error) {
    console.error("Error inserting product:", error);
    res.status(500).json({ message: "Database Error", error: error.message });
  }
};

// 4. delete products
exports.deleteProduct = async (req, res) => {
  const { id } = req.params;

  try {
    await db.execute('DELETE FROM products WHERE id = ?', [id]);
    res.json({ message: 'Product deleted successfully' });
  } catch (error) {
    console.error("Error deleting product:", error);
    res.status(500).json({ message: "Database Error", error: error.message });
  }
};