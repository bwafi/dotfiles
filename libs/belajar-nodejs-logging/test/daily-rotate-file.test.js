import winston from "winston";
import DailyRotateFile from "winston-daily-rotate-file";

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
      new DailyRotateFile({
        filename : "app-%DATE%.log",
        zippedArchive : true,
        maxSize : "1m",
        maxFiles : '14d'
      })
    ],
  });

  for (let i = 0; i < 100000; i++) {
    logger.info("Info logger");
  }
});
