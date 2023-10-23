import Joi from "joi";

describe("Joi", () => {
  it("should can validate array", async () => {
    const hobbieSchema = Joi.array().items(Joi.string().min(3).max(100));

    const hobbies = ["a", "main", "gaming"];

    const result = hobbieSchema.validate(hobbies);
    console.info(result);
  });

  it("description", async () => {
    const addressSchema = Joi.array()
      .min(1)
      .items(
        Joi.object({
          street: Joi.string().required().max(100),
          city: Joi.string().required().max(100),
        }),
      );

    const address = [
      {
        street: "sasda",
        city: "jember",
      },
    ];

    const result = addressSchema.validate(address, {
      abortEarly: false,
    });

    console.info(result);
  });
});
