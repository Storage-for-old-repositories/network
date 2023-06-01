import { Server } from "net"; // tcp

const server = new Server();

server.on("connection", (socket) => {
  console.log("Client connect", socket.address());

  socket.on("data", (buffer) => {
    const isPing = buffer.toString("utf-8") === "ping";
    if (isPing) {
      return;
    }

    console.log(buffer)
  });

  socket.on('error', (err) => {
    console.warn('client error hook');
    console.log(err);
  })

  socket.
});

server.listen(7184, () => {
  console.log("Server start");
});
