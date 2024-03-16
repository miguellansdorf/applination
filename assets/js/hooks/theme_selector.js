export const ThemeSelector = {
  mounted() {
    const lightThemeSelector = document.getElementById('light-theme-selector');
    const darkThemeSelector = document.getElementById('dark-theme-selector');

    lightThemeSelector.addEventListener('click', () => {
      localStorage.theme = 'light';
      document.documentElement.classList.remove('dark');
    })

    darkThemeSelector.addEventListener('click', () => {
      localStorage.theme = 'dark';
      document.documentElement.classList.add('dark');
    })
  }
}