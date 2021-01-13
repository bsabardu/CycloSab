const express = require('express');

// on importe nos controllers
const mainController = require('./controllers/mainController');
const cartController = require('./controllers/cartController');


const router = express.Router();

// page d'accueil
router.get('/', mainController.homePage);

// page article
router.get('/article/:id', mainController.articlePage);

// page panier
router.get('/cart', cartController.cartPage);

//page category
router.get('/category/:category', mainController.categoryPage);

//add to cart
router.get('/cart/add/:id', cartController.addToCart)

//remove to cart
router.get('/cart/remove/:id', cartController.removeFromCart)

// on exporte le router 
module.exports = router;