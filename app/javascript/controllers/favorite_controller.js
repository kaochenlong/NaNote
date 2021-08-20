import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["icon"];
  static values = { id: Number };

  toggleFavorite(e) {
    e.preventDefault();
    this.addFavorite(this.idValue);
  }

  addFavorite(id) {
    const url = `/api/v1/notes/${id}/favorite`;

    Rails.ajax({
      url: url,
      type: "post",
      data: "",
      success: (data) => {
        const icon = this.iconTarget;

        if (data.status === "added") {
          icon.classList.remove("favorite-off");
          icon.classList.add("favorite-on");
        } else {
          icon.classList.remove("favorite-on");
          icon.classList.add("favorite-off");
        }
      },
      error: function (err) {
        console.log(err);
      },
    });
  }
}
