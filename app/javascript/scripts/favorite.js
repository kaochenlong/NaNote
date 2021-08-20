import ax from "axios";

function addFavorite(id) {
  const url = `/api/v1/notes/${id}/favorite`;
  const token = document.querySelector("meta[name=csrf-token]").content;
  ax.defaults.headers.common["X-CSRF-Token"] = token;

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

document.addEventListener("turbolinks:load", () => {
  const btn = document.querySelector("#favorite_btn");

  if (btn) {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      addFavorite(e.currentTarget.dataset.id);
    });
  }
});
