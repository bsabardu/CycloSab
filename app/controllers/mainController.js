const dataMapper = require('../dataMapper')


exports.homePage = (request, response) => {
  dataMapper.getAllProducts((products) => {
    response.render('accueil', {products});
  })
}

exports.articlePage = (request, response) => {
  dataMapper.getOneProduct(request.params.id, (product) => {
    response.render('article', {product});
  })


}
