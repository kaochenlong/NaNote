import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// fetch("https://jsonplaceholder.typicode.com/users")
//   .then((resp) => resp.json()) // Promise
//   .then((data) => {
//     // [ {} ,  {}  , {}... x 10]
//     for (let { username } of data) {
//       console.log(username);
//     }
//     // data.forEach((d) => {
//     //   console.log(d.username);
//     // });
//   });

function addFavorite(id) {
  // fetch().then().then()
}

document.addEventListener("DOMContentLoaded", () => {
  const btn = document.querySelector("#favorite_btn");

  if (btn) {
    btn.addEventListener("click", () => {
      addFavorite(2);
    });
  }
});
