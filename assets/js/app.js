// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
// import "phoenix_html"
import "../css/app.scss";
import React from "react";
import ClientContainer from "./containers/ClientContainer";
import { hydrateRoot } from "react_render/priv/client";
import { loadableReady } from "@loadable/component";

// can do whatever with these data attributes, but this is how the phoenix server encodes data to be accessed by react
// kindof limiteded to only serliazable json in this form however...
// think it might be worth trying to inject a inline script along with the react root container component that could be used to inject more complex js state?
const elixirProps = JSON.parse(
  document.getElementById("react-root").dataset.props
);

const Main = () => {
  return <ClientContainer {...elixirProps} />;
};

//
loadableReady(() => {
  // this is ran as apposed to render.
  hydrateRoot(Main, "react-root");
});
