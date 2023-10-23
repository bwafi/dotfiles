function plusMinus(arr) {
  let positive = 0;
  let negative = 0;
  let zero = 0;
  arr.forEach((value) => {
    if (value > 0) return positive++;
    if (value < 0) return negative++;
    if (value === 0) return zero++;
  });

  console.log(positive / arr.length);
  console.log(negative / arr.length);
  console.log(zero / arr.length);
}

const arr = [-4, 3, -9, 0, 4, 1];
const result = plusMinus(arr);
console.log("ini result : " + result);
