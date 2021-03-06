// Toujours commencer par importer les variables d'environnement !
require('dotenv').config();

const express = require('express');

// on importe le router
const router = require('./app/router');

//import express session
const session = require('express-session')

// un peu de config
const PORT = process.env.PORT || 5000;


const app = express();

const dataMapper = require('./app/dataMapper');
const { request, response } = require('express');

app.set('view engine', 'ejs')
app.set('views', './app/views')

// servir les fichiers statiques qui sont dans "integration"
app.use(express.static('integration'));

//express session
app.use(session({
  secret: process.env.SECRET,
  resave: true,
  saveUninitialized: true,
}))


//Middleware to get categories
app.use('', (req,res,next) => {
  dataMapper.getCountByCategorie((categoriesCounts) => {
    app.locals.categoriesCounts = categoriesCounts;
  })
  next();
}
)

// routage !
app.use(router);


// on lance le serveur
app.listen(PORT, () => {
  console.log(`Listening on ${PORT}`);
});
