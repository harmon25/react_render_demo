require("@babel/polyfill");
require("@babel/register")({ cwd: __dirname });

let { render } = require("react_render/priv/server");

function newRender(compPath, props) {
  const path = require("path");
  const { ChunkExtractor } = require("@loadable/server");
  const statsFile = path.resolve("./priv/static/js/loadable-stats.json");
  const extractor = new ChunkExtractor({ statsFile, entrypoints: ["app"] });

  const renderResult = render(compPath, props);
  // You can now collect your script tags
  const scriptTags = extractor.getScriptTags(); // or extractor.getScriptElements();
  // You can also collect your "preload/prefetch" links
  const linkTags = extractor.getLinkTags(); // or extractor.getLinkElements();
  // And you can even collect your style tags (if you use "mini-css-extract-plugin")
  const styleTags = extractor.getStyleTags(); // or extractor.getStyleElements();

  return { ...renderResult, tags: { scriptTags, linkTags, styleTags } };
}

module.exports = { render: newRender };
