import { Controller } from "stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  static targets = ["addForm"];
  static values = { columnId: String }

  connect() {
    this.sortable = Sortable.create(this.element, {
      animation: 150,
      group: {
        name: "shared",
        pull: true,
        sort: true,
      },
      filter: ".js-card--sticky",
      fallbackOnBody: true,
      swapThreshold: 0.65,
      onAdd: this.add.bind(this),
      onEnd: this.reorder.bind(this),
    });
  }

  add(event) {
    const formElement = this.addFormTarget;
    
    formElement.querySelector(
      "#js-name-value"
    ).value = event.item.querySelector(".card__title").textContent.trim();
    formElement.querySelector("#js-column-id").value = this.columnIdValue;
    formElement.querySelector("#js-position-value").value = this.buildPosition(
      event
    );

    const submit = formElement.querySelector(".js-card__submit");
    submit.click();

    const formElementToDelete = event.item.querySelector("form");
    formElementToDelete.querySelector("input[name=_method]").value = "delete";

    const submitDelete = formElementToDelete.querySelector(".js-card__submit");
    submitDelete.click();
  }

  reorder(event) {
    const formElement = event.item.querySelector("form");
    formElement.querySelector("#js-position-value").value = this.buildPosition(
      event
    );

    const submit = formElement.querySelector(".js-card__submit");
    submit.click();
  }

  // eslint-disable-next-line class-methods-use-this
  buildPosition(event) {
    const previousCard = $(event.item).prevAll(".card").first();
    let index = event.newIndex;
    if (previousCard.length === 0) {
      index = 1;
    } else if (previousCard.data("position") > parseInt(event.item.dataset.position)){
      index = previousCard.data("position");
    } else {
      index = previousCard.data("position") + 1;
    }
    return index;
  }
}
