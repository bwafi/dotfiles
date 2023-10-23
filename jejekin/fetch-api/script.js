fetch("https://jsonplaceholder.typicode.com/posts")
  .then((response) => response.json())
  .then((data) => {
    const dataList = document.getElementById("data-list");
    const filterData = data.filter((item) => {
      return item.userId === 2;
    });

    console.log(filterData);

    // data.forEach((item) => {
    //   const listItem = document.createElement("li");
    //   listItem.innerHTML = `
    //     <h3>${item.title}</h3>
    //     <p>${item.body}</p>
    //   `;
    //   dataList.appendChild(listItem);
    // });
  })
  .catch((error) => {
    console.error("Terjadi kesalahan:", error);
  });
