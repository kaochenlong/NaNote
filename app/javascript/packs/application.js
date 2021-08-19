import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import ax from "axios";

function addFavorite(id) {
  const url = `/api/v1/notes/${id}/favorite`;
  const token = document.querySelector("meta[name=csrf-token]").content;
  ax.defaults.headers.common["X-CSRF-Token"] = token;

  ax.post(url)
    .then((res) => {
      console.log(res.data);
    })
    .catch((err) => {
      console.log(err);
    });
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
