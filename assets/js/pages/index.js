// import ProfilePage from "./ProfilePage";
// import IndexPage from "./IndexPage";
import React from "react";
import loadable from "@loadable/component";

import Loading from "../components/Loading.js";

const pages = [
  {
    path: "/",
    component: loadable(() => import("./IndexPage.js"), {
      fallback: <Loading />,
    }),
    exact: true,
  },
  {
    path: "/profile",
    component: loadable(() => import("./ProfilePage"), {
      fallback: <Loading />,
    }),
  },
];

export default pages;
