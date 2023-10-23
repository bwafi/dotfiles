function staircase(n) {
  let star = "";
  for (let i = 1; i <= n; i++) {
    for (let j = 0; j < n - i; j++) {
      star += " ";
    }
    for (let k = 0; k < i; k++) {
      star += "*";
    }
    star += "\n";
  }

  console.log(star);
}

const n = 6;
const result = staircase(n);
console.log(result);
