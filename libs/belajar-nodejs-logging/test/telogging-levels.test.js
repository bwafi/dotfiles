const winston = require("winston");

test("creaate new logger", () => {
  const logger = winston.createLogger({
    level: "debug",
    transports: [new winston.transports.Console({})],
  });

  logger.log({ level: "error", message: "Hello error" });
  logger.log({ level: "warn", message: "Hello warn" });
  logger.log({ level: "info", message: "Hello info" });
  logger.log({ level: "http", message: "Hello http" });
  logger.log({ level: "verbose", message: "Hello verbose" });
  logger.log({ level: "debug", message: "Hello debug" });
  logger.log({ level: "silly", message: "Hello silly" });
});

test("creaate new logger", () => {
  const logger = winston.createLogger({
    level: "debug",
    format : winston.format.simple(),
    transports: [new winston.transports.Console({})],
  });

  logger.error("Hello Error");
  logger.warn("Hello warn");
  logger.info("Hello info");
  logger.http("Hello http");
  logger.verbose("Hello verbose");
  logger.debug("Hello debug");
  logger.silly("Hello silly");
});
