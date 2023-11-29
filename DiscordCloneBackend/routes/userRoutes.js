// router/userRoutes.js
const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');

// create a new user
router.post('/signup', userController.createUser);

// login a user
router.post('/user/login', userController.loginUser);

// delete a user by Email
router.delete('/user/:email', userController.deleteUser);

// get all users
router.get('/users', userController.getAllUsers);

// update a user by ID
router.put('/user/:id', userController.updateUser);

module.exports = router;