/** @type {import('tailwindcss').Config} */
const defaultCss = {
  pre: false,
};

const smCss = {
  pre: false,
};

const lgCss = {
  pre: false,
  h1: {
    fontSize: '2.0em',
    fontWeight: '700',
  },
};

const xlCss = {
  pre: false,
};

const xl2Css = {
  pre: false,
};


module.exports = {
  content: ["./templates/**/*.{html,js}", 
            "./templates/activitytree/header.html"],
  theme: {
    extend: {
        typography: (theme) => ({
                 quoteless: {
          css: {
            'blockquote p:first-of-type::before': { content: 'none' },
            'blockquote p:first-of-type::after': { content: 'none' },
              } 
                 },
                DEFAULT: {
                  css: {
                    pre: false,
                    "code::before": {content: ''},
                    "code::after": {content: ''}
                  },
                },
    }),
  }
  }, 
  plugins: [
    require('@tailwindcss/typography'),require('@tailwindcss/aspect-ratio'),require('@tailwindcss/forms'),
  ],
}
