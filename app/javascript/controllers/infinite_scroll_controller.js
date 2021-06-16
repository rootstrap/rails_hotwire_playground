import { Controller } from 'stimulus';

export default class extends Controller {
    static targets = ['entry']

    static values = {
      path: String,
    }

    connect() {
      this.createObserver();
    }

    createObserver() {
      const options = {
        threshold: [0, 1.0],
      };

      const observer = new IntersectionObserver(
        (entries) => this.handleIntersect(entries), options,
      );
      observer.observe(this.entryTarget);
    }

    handleIntersect(entries) {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          history.replaceState(history.state, '', this.pathValue);
        }
      });
    }
}
