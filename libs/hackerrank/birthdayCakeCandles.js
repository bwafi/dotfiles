const birthdayCakeCandles = (candles) => {
  const maxValue = Math.max(...candles);

  return (filterValue = candles.filter((item) => item === maxValue).length);
};

const candles = [3, 2, 1, 3];
const result = birthdayCakeCandles(candles);
console.log(result);
