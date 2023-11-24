// controllers/UserController.js
const User = require('../models/userModel');
const jwt = require('jsonwebtoken'); // Import the jwt library

//create a new User
async function createUser(req, res) {
    try {
        const newUser = await User.create(req.body);
        res.status(201).json({
            message: "User Created!",
            user: newUser,
        });
    } catch (error) {
        res.status(500).json({
            message: "User with this email already exists",
            error: error.message,
        });
    }
}

//get all Users
async function getAllUsers(req, res) {
    try {
        console.log('request recieved');
        const Users = await User.find();
        res.status(200).json(Users);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
}

//update a User by ID
async function updateUser(req, res) {
    try {
        const { id } = req.params;
        const updatedUser = await User.findByIdAndUpdate(id, req.body, { new: true });
        res.json(updatedUser);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
}

//delete a User by ID
async function deleteUser(req, res) {
    try {
        const { id } = req.params;
        await User.findByIdAndRemove(id);
        res.status(200).json({ message: "User Deleted!" });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
}

// Login User
async function loginUser(req, res) {
    const { userName, password } = req.body;
    try {
        const user = await User.findOne({ userName });
        if (!user) {
            return res.status(401).json({ message: "Authentication failed. User not found." });
        }
        if (user.password !== password) {
            return res.status(401).json({ message: "Authentication failed. Incorrect password." });
        }

        var token = GenerateToken(user);

        res.status(200).json({
            message: "Authentication successful",
            userName: user.userName,
            role: user.role,
            id: user._id,
            token: token
        });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

function GenerateToken(user) {
    const payload = {
        role: user.role,
        id: user._id,
    };
    const token = jwt.sign(payload, "adsfasdfjkh$#asdfasdf.adsfxc");
    return token;
};

async function adminDashboard(req, res) {
    res.status(200).json({ message: "Admin Dashboard" });
}

async function roleBased(req, res) {
    res.status(200).json({
        message: "OK",
    });
}

module.exports = {
    createUser,
    getAllUsers,
    updateUser,
    deleteUser,
    loginUser,
    adminDashboard,
    roleBased
};