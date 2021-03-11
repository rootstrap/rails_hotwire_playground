const colors = require('tailwindcss/colors')

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
    colors: {
      transparent: 'transparent',
      current: 'currentColor',

      black: colors.black,
      white: colors.white,
      gray: colors.coolGray,
      red: colors.red,
      yellow: colors.amber,
      green: colors.emerald,
      blue: colors.blue,
      indigo: colors.indigo,
      purple: colors.violet,
      pink: colors.pink,
      'rs-gray': {
        100: '#F1F2F5',
        200: '#B5B5B8',
        300: '#808183'
      } ,
      'rs-yellow': '#EAE639',
      'rs-blue': '#0036F7',
      'rs-green': '#2CBB85',
      'rs-pink': '#FF918E',
      'rs-red': '#CF4031',
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
