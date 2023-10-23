import Joi from "joi";

describe("Joi", () => {
  it("should be create schema", async () => {
    // const schema = Joi.string().min(3).max(100).required();

    const request = "wapi";

    const result = schema.validate(request);

    if (result.error) {
      console.info(result.error);
    }
  });
});
