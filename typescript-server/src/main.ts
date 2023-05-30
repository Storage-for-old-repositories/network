import { Server } from "net"; // tcp

const server = new Server();

server.on('connection', (socket) => {
  console.log('Client connect', socket.address());

  socket.on('data', buffer => {
    console.log(buffer);
  })
})

server.listen(7184, "localhost", () => {
  console.log('Server start');
});

