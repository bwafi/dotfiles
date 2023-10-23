const miniMaxSum = (arr) => {
  const maxValue = Math.max(...arr);
  const minValue = Math.min(...arr);

  const arrSum = arr.reduce((a, b) => a + b, 0);
  console.log(arrSum - maxValue, arrSum - minValue);
};

const arr = [1, 2, 3, 4, 5];
const result = miniMaxSum(arr);
console.log(result);
