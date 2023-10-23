const timeConversion = (s) => {
  let AMPM = s.slice(-2);
  let timeArr = s.slice(0, -2).split(":");
  console.log(timeArr);

  if (AMPM === "AM" && timeArr[0] === "12") {
    // catching edge-case of 12AM
    timeArr[0] = "00";
  } else if (AMPM === "PM") {
    // everything with PM can just be mod'd and added with 12 - the max will be 23
    console.log((timeArr[0] % 12) + 12);
    timeArr[0] = (timeArr[0] % 12) + 12;
  }

  return timeArr.join(":");
};

const s = "07:05:45PM";
const result = timeConversion(s);
console.log(result);
