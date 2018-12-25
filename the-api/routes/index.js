const express = require('express');
const router = express.Router();
const popEstimates = require('../lib/pop-estimates-by-zip');

function isValidZip(zip) {
  return /^[0-9]{5}(?:-[0-9]{4})?$/.test(zip);
}

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

router.get('/v1/population/:zip', function(req, res, next) {
  const zip = req.params.zip;

  if (!isValidZip(zip)) {
    res.send('not a zip code', 422);
  }
  
  const result = popEstimates[zip];

  if (result) {
    res.set('Content-Type', 'application/json');
    res.send(result);
  } else {
    res.send('no population estimates found', 404);
  }
});

module.exports = router;
