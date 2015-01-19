module.exports = function (router) {
  router.get(['/', '/:name'], function (req, res) {
    res.send('Hello ' + (req.params.name || 'Stranger') + '!');
    res.end();
  });
};
