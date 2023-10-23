const winston = require("winston");

test("creaate new logger", () => {
  const logger = winston.createLogger({
    // format: winston.format.simple(),
    // format: winston.format.logstash(),

    // custom format
    format: winston.format.printf((info) => {
      return `${new Date()} : ${info.level} : ${info.message}`;
    }),
    level: "debug",
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
