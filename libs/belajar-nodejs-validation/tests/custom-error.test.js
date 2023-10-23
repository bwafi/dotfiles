import Joi from "joi";

describe("Joi", () => {
  it("custom error", async () => {
    const schema = Joi.string().required().min(3).messages({
      "string.min": "{{#label}} panjang harus {{#limit}} karakter",
    });

    const result = schema.validate("a");

    if (result.error) {
      console.info(result.error);
    }
  });
});
