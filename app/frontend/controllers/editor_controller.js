import { Controller } from "stimulus";
import MediumEditor from "medium-editor";
import "medium-editor/dist/css/medium-editor.min.css";

export default class extends Controller {
  connect() {
    new MediumEditor(this.element, {});
  }
}
