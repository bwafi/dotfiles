export const sum = (first, second) => {
  return first + second;
};

export const sumAll = (numbers) => {
  let total = 0;
  for (let number of numbers) {
    total += number;
  }

  return total;
};

class MyExpection extends Error {}

export function callMe(name) {
  if (name === "Wapi") {
    throw new MyExpection("Ups My expection happens");
  } else {
    return "Ok";
  }
}

export const sayHelloAsync = (name) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (name) {
        resolve(`Hello ${name}`);
      } else {
        reject("Name is Empty");
      }
    }, 1000);
  });
};

export const sayHello = (name) => {
  if (name) {
    return `Hello ${name}`;
  } else {
    throw new Error("Name is required");
  }
};

sayHello("wapi");

export const calculate = (numbers) => {
  let total = 0;
  for (let number of numbers) {
    total += number;
  }

  return total;
};

console.log(calculate([10, 10, 10]));

const x = 1;
console.log(x);
