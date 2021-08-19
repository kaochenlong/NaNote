import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

function addFavorite(id) {
  console.log(id);
  // fetch().then().then()
}

document.addEventListener("turbolinks:load", () => {
  const btn = document.querySelector("#favorite_btn");

  if (btn) {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      addFavorite(e.currentTarget.dataset.id);
    });
  }
});
