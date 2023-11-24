// router/userRoutes.js
const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const validateToken = require('../utils/auths/authorization_middleware');
const requireRoles = require('../utils/auths/RolebaseAuthorization');

// create a new user
router.post('/signup', userController.createUser);

// get all users
router.get('/users', userController.getAllUsers);

// update a user by ID
router.put('/user/:id', userController.updateUser);

// delete a user by ID
router.delete('/user/:id', userController.deleteUser);

// login a user
router.post('/user/login', userController.loginUser);

router.post('/user/admin', validateToken, userController.adminDashboard);

router.get('/user/roles', validateToken, requireRoles(['Admin', 'Super User']), userController.roleBased);

module.exports = router;