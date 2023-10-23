import cluster from "cluster";
import http from "http";
import os from "node:os";

if (cluster.isPrimary) {
  console.info(`Primary : ${process.pid}`);
  for (let i = 0; i < os.cpus().length; i++) {
    cluster.fork();
  }

  cluster.addListener("exit", (worker) => {
    console.info(`worker ${worker.id} is exit`);
    cluster.fork()
  });
}

if (cluster.isWorker) {
  console.log(`Worker : ${process.pid}`);

  const server = http.createServer((req, res) => {
    res.write(`Response from ${process.pid}`);
    res.end();
    process.exit();
  });

  server.listen(3000);
}
