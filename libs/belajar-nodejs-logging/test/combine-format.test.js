const winston = require("winston");

test("Combine format", () => {
  const logger = winston.createLogger({
    format: winston.format.combine(
      winston.format.timestamp(),
      winston.format.ms(),
      winston.format.simple(),
    ),
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
