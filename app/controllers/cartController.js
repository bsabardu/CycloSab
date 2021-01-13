const dataMapper = require('../dataMapper');


exports.cartPage = (request, response) => {
  if (!request.session.cart) {
    request.session.cart = []
  }

  const cart = request.session.cart;
  const shippingFees = 9.99;
  const taxBase = 0.2;

  
  
  const taxFreeTotal = parseFloat(cart.reduce((accumulator, product) => {
    const productTotal = product.price * product.quantity;
    return accumulator + productTotal;
  }, 0).toFixed(2));
  
  const taxAmount = parseFloat((taxBase * (taxFreeTotal+ shippingFees)).toFixed(2))

  const total = parseFloat(taxFreeTotal+shippingFees+taxAmount).toFixed(2);

  response.render('panier', {
    cart,
    shippingFees,
    taxFreeTotal,
    taxBase,
    taxAmount,
    total
  })

}

exports.addToCart = (request, response) => {
  const id = parseInt(request.params.id, 10)

  if (!request.session.cart) request.session.cart = [];

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
}

exports.removeFromCart = (request, response) => {
  const id = parseInt(request.params.id, 10)

  if (!request.session.cart) request.session.cart = [];



  product = request.session.cart.find(element => element.id === id);

  if (product) {
    product.quantity--

    if (product.quantity < 1) {
      dataMapper.getOneProduct(id, (product) => {

        request.session.cart = request.session.cart.filter(element => element.id !== id)
        response.redirect('/cart')

      })
    } else {
      response.redirect('/cart')
    }


  } else {
    response.redirect('/cart')
  }

}