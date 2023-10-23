const kangaroo = (x1, v1, x2, v2) => {
  if (v1 < v2) {
    return "NO";
  } else {
    if ((x2 - x1) % (v1 - v2) === 0) {
      return "YES";
    } else {
      return "NO";
    }
  }
};

const x1 = 2;
const v1 = 3;
const x2 = 5;
const v2 = 3;
const result = kangaroo(x1, v1, x2, v2);
console.log(result);
