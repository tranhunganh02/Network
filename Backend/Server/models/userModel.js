const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: { type: String, require: true, minlength: 5, maxlength: 30 },
  email: {
    type: String,
    require: true,
    minlength: 10,
    maxlength: 50,
    unique: true,
  },
  password: { type: String, require: true, minlength: 8, maxlength: 80 },
}, {
     timestamps: true
});

const userModel = mongoose.model("User", userSchema)

module.exports = userModel