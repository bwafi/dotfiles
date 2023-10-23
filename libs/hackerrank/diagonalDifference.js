function diagonalDifference(arr) {
  let left = 0;
  let right = 0;
  for (let i = 0; i < arr.length; i++) {
    left += arr[i][i];
    right += arr[i][arr.length - i - 1];
    // console.log(left);
    // console.log(right);
  }

  return Math.abs(left - right);
}

const a = [11, 2, 4];
const b = [4, 5, 6];
const c = [10, 8, -12];
const arr = [a, b, c];
const result = diagonalDifference(arr);
console.log(result);
