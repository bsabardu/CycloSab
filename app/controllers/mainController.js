const dataMapper = require('../dataMapper')


exports.homePage = (request, response) => {
  dataMapper.getAllProducts((products) => {
    response.render('accueil', {
      products
    });
  })
}


exports.articlePage = (request, response) => {
  dataMapper.getOneProduct(request.params.id, (product) => {

    dataMapper.getReviewsOfProduct(request.params.id, (reviews) => {

      response.render('article', {
        product,
        reviews
      });

    })

  })
}

exports.categoryPage = (request, response) => {
  dataMapper.getProductsByCategory(request.params.category, (products) => {
    response.render('accueil', {
      products
    });
  })
}