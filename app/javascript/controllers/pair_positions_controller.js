import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["buttonUp", "buttonDown", "pairElement"];

  static values = {
    element: String,
    elementType: String,
    matchChallenge: String,
  };

  positionUp() {
    let data = new FormData();
    data.set("id", this.elementValue);
    data.set("type", this.elementTypeValue);
    data.set("match_challenge", this.matchChallengeValue);

    fetch("/position_up", {
      method: "POST",
      credentials: "same-origin",
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token"),
      },
      body: data,
    }).then(location.reload());
  }

  positionDown() {
    let data = new FormData();
    data.set("id", this.elementValue);
    data.set("type", this.elementTypeValue);
    data.set("match_challenge", this.matchChallengeValue);

    fetch("/position_down", {
      method: "POST",
      credentials: "same-origin",
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token"),
      },
      body: data,
    }).then(location.reload());
  }

  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`);
    return element.getAttribute("content");
  }

  checkSubmission() {
    let data = new FormData();
    data.set("match_challenge", this.matchChallengeValue);

    fetch("/check_submission", {
      method: "POST",
      credentials: "same-origin",
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token"),
      },
      body: data,
    })
      .then(console.log("THEN"))
      .finally(console.log("FINALLY"));
  }
}
