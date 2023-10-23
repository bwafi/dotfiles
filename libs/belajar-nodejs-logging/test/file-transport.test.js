const winston = require("winston");

test("Combine format", () => {
  const logger = winston.createLogger({
    format: winston.format.combine(
      winston.format.timestamp(),
      winston.format.ms(),
      winston.format.simple(),
    ),
    level: "debug",
    transports: [
      new winston.transports.Console({}),
      new winston.transports.File({
        filename: "apps.log",
      }),

      new winston.transports.File({
        level: "error",
        filename: "apps-error.log",
      }),
    ],
  });

  logger.info("Hello World");
  logger.info("Hello World");
  logger.info("Hello World");
  logger.info("Hello World");
  logger.error("errro logger");
});
