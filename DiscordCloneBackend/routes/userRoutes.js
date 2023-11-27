// router/userRoutes.js
const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// create a new user
router.post('/signup', userController.createUser);

// login a user
router.post('/user/login', userController.loginUser);

// get all users
router.get('/users', userController.getAllUsers);

// update a user by ID
router.put('/user/:id', userController.updateUser);

// delete a user by ID
router.delete('/user/:id', userController.deleteUser);

module.exports = router;