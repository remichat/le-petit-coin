import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById('banner-typed-text')) {
    new Typed('#banner-typed-text', {
      strings: ["Find the toilet you need", "No more pant accident", "Make the future of toilet"],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
