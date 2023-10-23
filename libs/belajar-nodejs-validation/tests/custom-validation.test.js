import Joi from "joi";

describe("Joi", () => {
  it("custom validation", async () => {
    const registerSchema = Joi.object({
      userName: Joi.string().required().min(3).max(100),
      password: Joi.string()
        .required()
        .min(6)
        .max(100)
        .custom((value, helper) => {
          if (value.startsWith("wapi")) {
            return helper.error("password.wrong");
          }

          return value;
        })
        .messages({
          "password.wrong": "password cannot start with wapi",
        }),

      confirmPassword: Joi.string()
        .required()
        .min(6)
        .max(100)
        .custom((value, helper) => {
          if (value.password !== value.confirmPassword) {
            return helper.error("register.confirmPassword");
          }
          return value;
        })
        .messages({
          "register.confirmPassword": "password different",
        }),
    });

    const request = {
      userName: "wapi",
      password: "boneka",
      confirmPassword: "abneka",
    };

    const result = registerSchema.validate(request, {
      abortEarly: false,
    });
    console.info(result);
  });
});
