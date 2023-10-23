import net from "node:net";

const server = net.createServer((client) => {
  console.info("Client Connected");
  client.addListener("data", (data) => {
    console.info(`Receive data ${data.toString()}`);
    client.write(`hello ${data.toString()}\r\n`);
  });
});

server.listen(3000, "localhost");
