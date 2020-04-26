const WebSocket = require("isomorphic-ws");
// inject websocket into global, so phoenix can use it.
global.window = { WebSocket };
const { Socket } = require("phoenix");

let socket = new Socket("http://localhost:4000/logger-socket", {
  params: { token: "atoken?" },
});

socket.connect();

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("ssr_logs:all", {});
channel
  .join()
  .receive("ok", (resp) => {
    // console.log("Joined successfully", resp);
  })
  .receive("error", (resp) => {
    // console.log("Unable to join", resp);
  });

console.log = (...args) => {
  channel.push("log", { log: args });
};

console.error = (...args) => {
  channel.push("error", { log: args });
};

require("@babel/polyfill");
require("@babel/register")({ cwd: __dirname });

module.exports = require("react_render/priv/server");
