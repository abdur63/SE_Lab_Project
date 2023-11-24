const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');
const userRoutes = require('./routes/userRoutes');
const requireRoles = require('./utils/auths/authorization_middleware');
require('./utils/db');
const port = 3076;

//Middleware
app.use(bodyParser.json());
app.use(cors());

//Apis
app.use('/api', userRoutes);

app.listen(port, () => {
    console.log(`Server is listening on port ${port}`);
});