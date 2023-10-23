const gradingStudents = (grades) => {
  let finalGrade = [];
  grades.map((n) => {
    const selisih = 5 - (n % 5);

    if (selisih < 3 && n >= 38) {
      finalGrade.push(n + selisih);
    } else {
      finalGrade.push(n);
    }
  });

  return finalGrade;
};

const grades = [73, 67, 38, 33];
const result = gradingStudents(grades);
console.log(result);
