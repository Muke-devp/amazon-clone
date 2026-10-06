const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config();

const app = express();

// Middlewares
app.use(cors());
app.use(express.json());

// Routes
const authRoutes = require('./routes/authRoutes');
const productRoutes = require('./routes/productRoutes');

app.use('/api/auth', authRoutes);
app.use('/api/products', productRoutes);

// ከ Routes በፊት ወይም በኋላ ጨምረው
app.get('/', (req, res) => {
  res.send('Backend API is running successfully!');
});
app.get('/api/test', (req, res) => {
  res.send('API route works fine!');
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});