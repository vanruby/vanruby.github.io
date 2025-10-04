document.addEventListener('DOMContentLoaded', () => {
  const themeToggle = document.getElementById('themeToggle');
  const themeIcon = themeToggle.querySelector('svg use');

  // Available theme modes
  const themes = ['system', 'light', 'dark'];
  let currentThemeIndex = themes.indexOf(localStorage.getItem('theme-preference') || 'system');

  // Function to apply the selected theme
  function applyTheme(theme) {
    let actualTheme = theme;
    if (theme === 'system') {
      // In system mode, use the system's color scheme preference
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      actualTheme = prefersDark ? 'dark' : 'light';
      themeIcon.setAttribute('xlink:href', '/images/icons/bootstrap-icons.svg#circle-half');
    } else if (theme === 'light') {
      themeIcon.setAttribute('xlink:href', '/images/icons/bootstrap-icons.svg#sun-fill');
    } else if (theme === 'dark') {
      themeIcon.setAttribute('xlink:href', '/images/icons/bootstrap-icons.svg#moon-stars-fill');
    }

    // Set the theme attribute on <html> (Bootstrap 5.3+)
    document.documentElement.setAttribute('data-bs-theme', actualTheme);
    // Save the user selection
    localStorage.setItem('theme-preference', theme);
  }

  // Toggle theme on button click
  themeToggle.addEventListener('click', () => {
    currentThemeIndex = (currentThemeIndex + 1) % themes.length;
    const selectedTheme = themes[currentThemeIndex];
    applyTheme(selectedTheme);
  });

  // Listen for system preference changes when in system mode
  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
    if (localStorage.getItem('theme-preference') === 'system') {
      applyTheme('system');
    }
  });

  // Initialize theme on page load
  applyTheme(themes[currentThemeIndex]);
});
