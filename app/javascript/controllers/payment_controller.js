import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "selection", "additionalFields"]

  initialize() {
    this.showAdditionalFields()
  }

  showAdditionalFields() {
    let selection = this.selectionTarget.value

    for (let fields of this.additionalFieldsTargets) {
      fields.disabled = fields.hidden = (fields.dataset.type != selection)
    }
  }
}
