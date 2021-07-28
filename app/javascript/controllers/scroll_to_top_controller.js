import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'scrollToTopBtn' ]

  scrollToTop() {
    console.log('asdasd')
    thisRootTarget.scrollTo({
      top: 0,
      behavior: "smooth"
    })
  }
}
