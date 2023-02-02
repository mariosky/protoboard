/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./newtemplates/**/*.{html,js}", 
            "./newtemplates/activitytree/header.html"],
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
    require('@tailwindcss/typography'),
  ],
}
