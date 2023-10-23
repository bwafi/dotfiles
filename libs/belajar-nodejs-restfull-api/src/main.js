import { loggers } from "@/node_modules/winston/index";
import { web } from "./application/web";

web.listen(3000, () => {
  loggers.info("Apps Start");
});
