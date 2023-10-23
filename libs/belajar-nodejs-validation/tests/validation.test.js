import Joi from "joi";

describe("Joi", () => {
  it("should can validate data type", async () => {
    const userNameSchema = Joi.string().email().required();
    const isAdminSchema = Joi.boolean().required();
    const priceSchema = Joi.number().required().min(1000).max(1000000);

    const resultUserName = userNameSchema.validate("wapi@gmail.com");
    console.info(resultUserName);

    const resultAdmin = isAdminSchema.validate("true");
    console.info(resultAdmin);

    const resultPrice = priceSchema.validate("1000");
    console.info(resultPrice);
  });

  it("should can validate date", async () => {
    const birthDateSchema = Joi.date().required().max("now").min("1-1-1988");

    const result = birthDateSchema.validate("1-1-1999");
    console.info(result.value);
    console.info(result.error);

    const result2 = birthDateSchema.validate("1-1-1500");
    console.info(result2.error);
    console.info(result2.value);
  });

  it("should return validation error", async () => {
    const userNameSchema = Joi.string().min(5).email().required();

    const result = userNameSchema.validate("ups", {
      abortEarly: false,
    });
    console.info(result.value);

    if (result.error) {
      result.error.details.forEach((detail) => {
        console.info(`${detail.path} = ${detail.message}`);
      });
    }
  });
});
