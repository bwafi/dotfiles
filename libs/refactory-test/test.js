function findPair(arr) {
  let result = "";
  for (let i = 0; i < arr.length; i++) {
    let char = arr[i].toLowerCase();
    let position = char.charCodeAt(0) - 96;
    result += position + " ";
  }
  return result.trim();
}

console.log(findPair("The sunset sets at twelve o' clock."));
