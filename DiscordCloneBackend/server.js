const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');
const userRoutes = require('./routes/userRoutes');
const port = 3076;
require('./utils/db');

// for checking paste localhost:3076 in browser, if it shows "Discord Clone local server is working!" then server is working fine 
app.get("/", (req, res) => {
    res.send("Discord Clone local server is working!");
});

//Middlewares
app.use(bodyParser.json());
app.use(cors());

//User API
app.use('/api', userRoutes);

app.listen(port, () => {
    console.log(`Server is listening on port ${port}`);
});