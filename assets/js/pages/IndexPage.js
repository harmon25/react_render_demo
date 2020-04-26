import React from "react";

const IndexPage = () => {
  console.log("Index page");
  console.error("Uh Oh and error~");
  return (
    <div className="container">
      <h2> Index </h2>
      <p> Some awesome content.</p>
    </div>
  );
};

export default IndexPage;
