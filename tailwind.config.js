/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./templates/**/*.{html,js}", 
            "./templates/activitytree/header.html"],
  theme: {
    extend: {
        typography: (theme) => ({
                DEFAULT: {
                  css: {
                    color: theme('colors.gray.800'),
                    pre: {
                      color: theme("colors.grey.1000"),
                      backgroundColor: theme("colors.grey.100")
                    },
                  },
                },
              }),
    },
  },

  plugins: [
    require('@tailwindcss/typography'),require('@tailwindcss/aspect-ratio'),require('@tailwindcss/forms'),
  ],
}
