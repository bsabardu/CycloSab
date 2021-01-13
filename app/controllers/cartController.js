const dataMapper = require('../dataMapper');


exports.cartPage = (request, response) => {
  if(!request.session.cart) {
    request.session.cart = []
  }

  response.render('panier', {
    cart: request.session.cart
  })
}

exports.addToCart = (request, response) => {
  const id = parseInt(request.params.id, 10)

  if(!request.session.cart) request.session.cart = [];

  const product = request.session.cart.find(element => element.id === id)

  if (product) {
    product.quantity++
    response.redirect('/cart')
  } else {

    dataMapper.getOneProduct(id, (product) => {

      product.quantity = 1;
      request.session.cart.push(product)
      response.redirect('/cart')

      })

  }


  // response.render('panier', {cart : request.session.cart})
}