const winston = require("winston");

test("creaate new logger", () => {
  const logger = winston.createLogger({
    transports: [new winston.transports.Console({})],
  });

  logger.log({
    level: "info",
    message: "Hello Logging",
  });
  
});
