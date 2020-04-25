require("@babel/polyfill");
require("@babel/register")({ cwd: __dirname });

module.exports = require("react_render/priv/server");
