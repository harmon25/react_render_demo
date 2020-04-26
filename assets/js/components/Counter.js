import React, { useState } from "react";

const Counter = () => {
  const [count, setCount] = useState(0);
  const handleIncClick = () => {
    setCount(count + 1);
  };

  const handleDecClick = () => {
    setCount(count - 1);
  };

  const handleResetClick = () => {
    setCount(0);
  };

  return (
    <div>
      <h4> Count: {count}</h4>

      <button
        className="button"
        onClick={handleIncClick}
        style={{ marginRight: "0.25em" }}
      >
        Increment
      </button>
      <button className="button button-outline" onClick={handleDecClick}>
        Decrement
      </button>
      <br />
      <button className="button button-clear" onClick={handleResetClick}>
        Reset
      </button>
    </div>
  );
};

export default Counter;
