// controllers/UserController.js
const User = require('../models/userModel');

//register a user
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

// Login User 
async function loginUser(req, res) {
    const { email, password } = req.body;
    try {
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(401).json({ message: "Authentication failed. User not found." });
        }
        if (user.password !== password) {
            return res.status(401).json({ message: "Authentication failed. Incorrect password." });
        }

        res.status(200).json({
            message: "Authentication successful",
            data: user,
        });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

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

//delete a User by Email
async function deleteUser(req, res) {
    try {
        const { email } = req.params;
        await User.findOneAndDelete(email);
        res.status(200).json({ message: "User Deleted!" });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
}

module.exports = {
    createUser,
    loginUser,
    deleteUser,
    getAllUsers,
    updateUser,
};