const io = require("socket.io-client");
const socket = io("http://localhost:3000");

const sendMessage = () => {
  const message = `message ${Math.random()}`;
  socket.emit("chat message", message);
};

socket.on("chat message", (msg) => {
  console.log(msg);
});

setInterval(() => {
  sendMessage();
}, 2000);
