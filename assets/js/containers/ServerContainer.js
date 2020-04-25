import React from "react";
import App from "../components/App";

// props passed to this container component are the props passed from elixir -> react during server render
// use this container component for things like react-routers `<StaticRouter>` to be run only on the server.
const ServerContainer = ({}) => {
  return <App />;
};

export default ServerContainer;
