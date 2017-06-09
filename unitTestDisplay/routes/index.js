var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/', function(req, res, next) {
	req.body.count
	var exec = require('child_process').exec;
	var cmd = 'osascript -e \'tell app "MacTestPresenter" to lookup "' + req.body.passed + "," + req.body.failed + '"\'';

	exec(cmd, function(error, stdout, stderr) {
  // command output is in stdout
});
  res.json(req.body)
});


module.exports = router;
