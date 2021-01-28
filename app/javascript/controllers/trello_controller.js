import { Controller } from 'stimulus';
import Sortable from 'sortablejs';

export default class extends Controller {
  static values = { columnId: String }

  connect() {
    this.sortable = Sortable.create(this.element, {
      animation: 150,
      group: {
        name: 'shared',
        pull: true,
        sort: true,
      },
      filter: '.js-card--sticky',
      fallbackOnBody: true,
      swapThreshold: 0.65,
      onEnd: this.reorder.bind(this),
    });
  }

  reorder(event) {
    const formElement = event.item.querySelector('form');

    if (this.newCard(event)) {
      formElement.querySelector('#js-column-id').value = event.item.parentElement.dataset.trelloColumnIdValue;
    }

    formElement.querySelector('#js-position-value').value = this.buildPosition(
      event,
    );

    const submit = formElement.querySelector('.js-card__submit');
    submit.click();
  }

  buildPosition(event) {
    // eslint-disable-next-line no-undef
    const previousCard = $(event.item).prevAll('.card').first();
    let index = previousCard.data('position') + 1;
    if (previousCard.length === 0) {
      index = 1;
    } else if (previousCard.data('position') > Number(event.item.dataset.position) && !this.newCard(event)) {
      index = previousCard.data('position');
    }
    return index;
  }

  newCard(event) {
    return event.item.parentElement.dataset.trelloColumnIdValue !== this.columnIdValue;
  }
}
