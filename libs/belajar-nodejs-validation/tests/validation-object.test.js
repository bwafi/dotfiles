import Joi from "joi";

describe("Joi", () => {
  it("should can valudate object", async () => {
    const loginSchema = Joi.object({
      username: Joi.string().required().min(3).max(100).email(),
      password: Joi.string().required().min(6).max(100),
    });

    const request = {
      username: "wapi",
      password: "rahasia",
    };

    const result = loginSchema.validate(request, {
      abortEarly: false,
    });

    console.info(result);
  });

  it("should can nested object validate", async () => {
    const createUserNameSchema = Joi.object({
      id: Joi.string().required().max(1000),
      name: Joi.string().required().max(100),
      address: Joi.object({
        street: Joi.string().required().max(100),
        city: Joi.string().required().max(100),
        country: Joi.string().required().max(100),
      }),
    });
    const request = {};

    const result = createUserNameSchema.validate(request, {
      abortEarly: false,
    });

    console.info(result);
  });
});
