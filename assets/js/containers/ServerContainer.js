import React from "react";
import App from "../components/App";
import { StaticRouter } from "react-router-dom";

// props passed to this container component are the props passed from elixir -> react during server render
// use this container component for things like react-routers `<StaticRouter>` to be run only on the server.
const ServerContainer = ({ location, context = {} }) => {
  return (
    <StaticRouter location={location} context={context}>
      <App />
    </StaticRouter>
  );
};

export default ServerContainer;
