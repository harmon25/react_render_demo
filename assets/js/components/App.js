import React from "react";
import { Switch, Route } from "react-router";
import pages from "../pages";

import Nav from "./Nav";

const App = () => {
  return (
    <>
      <main className="wrapper">
        <Nav />
        <Switch>
          {pages.map((p) => (
            <Route
              key={p.path}
              path={p.path}
              exact={p.exact || false}
              component={p.component}
            />
          ))}
        </Switch>
      </main>
    </>
  );
};

export default App;
