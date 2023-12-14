const express = require("express")
const { registerUser, loginUser, findUser, getUser } = require("../controller/userController")

const router = express.Router()

router.post("/login", loginUser)
router.post("/register", registerUser)
router.get("/find/:userId", findUser)
router.get("/", getUser)

module.exports = router;