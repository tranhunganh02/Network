// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyA3P4gIuS86tPkU145e44LmHFgQybeZDyM",
  authDomain: "network-c063b.firebaseapp.com",
  projectId: "network-c063b",
  storageBucket: "network-c063b.appspot.com",
  messagingSenderId: "604475934663",
  appId: "1:604475934663:web:50a5501f0c9234f5753be2"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
var admin = require("firebase-admin");

var serviceAccount = require("path/to/serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});
