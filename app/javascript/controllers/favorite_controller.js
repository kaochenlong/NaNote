import { Controller } from "stimulus";
// import ax from "axios";
import ax from "lib/http/ax";

function addFavorite(id) {
  const url = `/api/v1/notes/${id}/favorite`;

  ax.post(url)
    .then((res) => {
      const icon = document.querySelector(".favorite_icon");

      if (res.data.status === "added") {
        icon.classList.remove("favorite-off");
        icon.classList.add("favorite-on");
      } else {
        icon.classList.remove("favorite-on");
        icon.classList.add("favorite-off");
      }
    })
    .catch((err) => {
      console.log(err);
    });
}

export default class extends Controller {
  static targets = ["button"];
  static values = { id: Number };

  toggleFavorite(e) {
    e.preventDefault();
    addFavorite(this.idValue);
  }
}
