import React from "react";
import App from "../components/App";
import { BrowserRouter } from "react-router-dom";

const ClientContainer = (props) => {
  console.log("Props from Phoenix:");
  console.log(props);

  return (
    <BrowserRouter>
      <App />
    </BrowserRouter>
  );
};

export default ClientContainer;
