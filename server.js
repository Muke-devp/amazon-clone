// 

// 1. Routes import ማድረጉን ማረጋገጥ
const productRoutes = require('./routes/productRoutes');

// 2. Middlewares ከጨረሱ በኋላ Routeን መጥራት
app.use('/api/products', productRoutes);