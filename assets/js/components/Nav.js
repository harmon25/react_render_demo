import React from "react";
import { Link } from "react-router-dom";
const Nav = () => {
  return (
    <nav className="navigation">
      <section className="container">
        <Link to="/">
          <h1 className="title">ReactRenderDemo</h1>
        </Link>

        <ul className="navigation-list float-right">
          <li className="navigation-item">
            <Link className="navigation-link" to="/profile">
              Profile
            </Link>
          </li>
          <li className="navigation-item">
            <a
              className="navigation-link"
              target="_blank"
              href="https://github.com/harmon25/react_render_demo/tree/react_router"
            >
              Github
            </a>
          </li>
        </ul>
      </section>
    </nav>
  );
};

export default Nav;
