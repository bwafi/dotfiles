function aVeryBigSum(ar) {
  return ar.reduce((a, b) => a + b, 0);
}

const n = [1000000001, 1000000002, 1000000003, 1000000004, 1000000005];
const result = aVeryBigSum(n);
console.log(result);
