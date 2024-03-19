export const MenuToggler = {
  mounted() {
    const heroIcon = this.el.children[0];
    const navLinks = document.getElementById('nav-links');
    console.log(navLinks);
    this.el.addEventListener('click', () => {
      heroIcon.classList.toggle('hero-bars-3');
      heroIcon.classList.toggle('hero-x-mark');
      navLinks.classList.toggle('top-[100%]');
    });

  }
}