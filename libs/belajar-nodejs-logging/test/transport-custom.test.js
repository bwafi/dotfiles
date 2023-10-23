import winston, { level } from "winston";
import DailyRotateFile from "winston-daily-rotate-file";
import Transport, {
  TransportStreamOptions as TransportOptions,
} from "winston-transport";

test("Create new transports", () => {
  class MyTransport extends Transport {
    constructor(opts) {
      super(opts);
    }

    log(info, next) {
      console.log(
        `${new Date()} : ${info.level.toUpperCase()} : ${info.message}`,
      );
      next();
    }
  }

  const logger = winston.createLogger({
    format: winston.format.combine(
      winston.format.timestamp(),
      winston.format.ms(),
      winston.format.simple(),
    ),
    level: "debug",
    transports: [new MyTransport({})],
  });

  logger.info("Hello Info")
});
