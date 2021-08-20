import { Controller } from "stimulus";

export default class extends Controller {
  toggleFavorite(e) {
    e.preventDefault();
    console.log(123);
  }
}
