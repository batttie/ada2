var Phantom = require('phantom');

var Intel = function (username, password, cb) {
  this.phantom = null;
  this.page = null;
  this.setupPhantom(function () {
    this.doLogin(username, password, function (result) {
      cb(result);
    }.bind(this));
  }.bind(this));
};
Intel.prototype.phantomStdOutHandler = function (data) {
  // We don't want all that garbage!
  // console.log('PhantomStdOut: ' + data.toString());
};
Intel.prototype.phantomStdErrHandler = function (data) {
  // We don't want all that garbage!
  // console.log('PhantomStdErr: ' + data.toString());
};
Intel.prototype.setupPhantom = function (cb) {
  Phantom.create({ onStdout: this.phantomStdOutHandler.bind(this), onStderr: this.phantomStdErrHandler.bind(this), parameters: { 'ignore-ssl-errors': 'true' }}, function (phantom) {
    this.phantom = phantom;
    phantom.createPage(function (page) {
      page.set('settings.userAgent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X) AppleWebKit/538.1 (KHTML, like Gecko) Safari/538.1;');
      page.set('viewportSize', { width: 1280, height: 720 });
      page.set('onConsoleMessage', function (msg, line, source) {
        console.log('console> ' + msg);
      });
      this.page = page;
      cb();
    }.bind(this));
  }.bind(this));
};
Intel.prototype.doLogin = function (username, password, cb) {
  this.page.open('https://www.ingress.com/intel/', function (status) {
    if (status !== 'success') {
      cb(false);
    } else {
      // this.page.render('./debug/01_pre_login.png');
      this.page.evaluate(function () {
        return document.getElementsByTagName('a')[0].href;
      }, function (link) {
        this.page.open(link, function (status) {
          setTimeout(function () {
            // this.page.render('./debug/02_pre_login_b.png');
            this.waitForPageToLoad(function () {
              this.page.evaluate(function (user, pass) {
                document.getElementById('Email').value = user;
                document.querySelector('input#signIn').click();
                setTimeout(function () {
                  document.getElementById('Passwd').value = pass;
                  document.querySelector('input#signIn').click();
                }, 500);
              }, function () {
                // this.screenshot('./debug/03_post_login.png');
                setTimeout(function () {
                  // this.page.render('./debug/04_pre_iitc.png');
                  this.waitForPageToLoad(function () {
                    this.page.includeJs('http://iitc.jonatkins.com/release/total-conversion-build.user.js');
                    this.waitForIitcToLoad(function () {
                      this.page.render('./debug/05_post_iitc.png');
                      cb(true);
                    }.bind(this));
                  }.bind(this));
                }.bind(this), 5000);
              }.bind(this), username, password);
            }.bind(this));
          }.bind(this), 2000);
        }.bind(this));
      }.bind(this));
    }
  }.bind(this));
};

Intel.prototype.screenshot = function (path, cb) {
  this.page.render(path, cb);
};

Intel.prototype.waitFor = function (extract, test, cb) {
  var i = null;
  i = setInterval(function () {
    this.page.evaluate(extract, function(rtv) {
      // console.log('waitFor RTV: ' + rtv);
      if (test(rtv)) {
        clearInterval(i);
        cb();
      }
    });
  }.bind(this), 500);
};

Intel.prototype.waitForPageToLoad = function (cb) {
  // console.log('waitForPageToLoad');
  this.waitFor(function () {
      return document.readyState;
    }, function (val) {
      return val === 'complete'
    },
    cb
  );
};

Intel.prototype.waitForIitcToLoad = function (cb) {
  // console.log('waitForIitcToLoad');
  this.waitFor(function () {
      return window.mapDataRequest.getStatus()['short'];
    }, function (val) {
      return val === 'done'
    },
    cb
  );
};

Intel.prototype.loadScript = function (url, cb) {
  this.page.includeJs(url, cb);
  // https://ingress.dj-djl.com/iic/gm.user.js
};

Intel.prototype.hideUIElements = function (cb) {
  this.page.evaluate(function () {
    $('#gmnoprint, #chat, #chatinput, #chatcontrols, #updatestatus, #sidebartoggle, #scrollwrapper, .leaflet-control-container').hide();
  }, cb);
};

Intel.prototype.setMapLatLngZoom = function (latlng, zoom, cb) {
  this.page.evaluate(function (latlngArr, zoomLevel) {
    window.map.setView(latlngArr, zoomLevel);
  }, function () {
    setTimeout(function () {
      this.waitForIitcToLoad(cb);
    }.bind(this), 5000);
  }.bind(this), latlng, zoom);
};

Intel.prototype.fitBounds = function (bounds, cb) {
  this.page.evaluate(function (boundsArr, zoomLevel) {
    var bound = new L.LatLngBounds();
    for(var i in boundsArr) {
      bound.extend(boundsArr[i]);
    }
    map.fitBounds(bound);
  }, function () {
    setTimeout(function () {
      this.waitForIitcToLoad(cb);
    }.bind(this), 5000);
  }.bind(this), bounds);
};

Intel.prototype.setPortalDetailLevel = function (level, cb) {
  this.page.evaluate(function (lvl) {
    window.getDataZoomForMapZoom = function () { return lvl; };
  }, cb, level);
};

Intel.prototype.getPortalData = function (cb) {
  this.page.evaluate(function () {
    console.log('getPortalData.evaluate fired.');
    var data = {};
    var itemsToDelete = ['mission50plus', 'mission', 'ornaments', 'unknown12'];
    console.log('XXXXXXX pre-prep');
    for(var guid in window.portals) {
      if (window.portals.hasOwnProperty(guid)) {
        data[guid] = window.portals[guid].options.data;
        for(var i in itemsToDelete) delete data[guid][(itemsToDelete[i])];
      }
    }
    console.log('XXXXXXX post-prep returning');
    return data;
  }, cb);
};

Intel.prototype.exit = function () {
  this.phantom.exit();
};

module.exports = Intel;
