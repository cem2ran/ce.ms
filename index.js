var path = require('path'),
ghost = require('ghost'),
express = require('express'),
enrouten = require('express-enrouten'),
parentApp = express();

parentApp.use(enrouten({ directory: 'content/routes' }));

ghost({
  config: path.join(__dirname, 'config.js')
}).then(function (ghostServer) {
  parentApp.use(ghostServer.config.paths.subdir, ghostServer.rootApp);
  ghostServer.start(parentApp);
});
