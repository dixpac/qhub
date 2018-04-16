import { Controller } from "stimulus";
import * as SimpleMDE from "simplemde";
import "simplemde/dist/simplemde.min.css"

export default class extends Controller {
  initialize() {
    new SimpleMDE({
      element: this.element,
      spellChecker: false
    })
  }
}
