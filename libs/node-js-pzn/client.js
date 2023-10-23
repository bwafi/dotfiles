import net from "node:net";

const client = net.createConnection({
  port: 3000,
  host: "localhost",
});

client.addListener("data", (data) => {
  console.info(`Receive data from server : ${data.toString()}`);
});

setInterval(() => {
  client.write("eko\r\n");
}, 2000);
