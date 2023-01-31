import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["buttonUp", "buttonDown", "pairElement"];

  static values = {
    element: String,
    elementType: String,
  };

  positionUp() {
    let data = new FormData();
    data.set("id", this.elementValue);
    data.set("type", this.elementTypeValue);

    fetch("/position_up", {
      method: "POST",
      credentials: "same-origin",
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token"),
      },
      body: data,
    });
  }

  positionDown() {
    let data = new FormData();
    data.set("id", this.elementValue);
    data.set("type", this.elementTypeValue);

    fetch("/position_down", {
      method: "POST",
      credentials: "same-origin",
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token"),
      },
      body: data,
    });
  }

  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`);
    return element.getAttribute("content");
  }
}
