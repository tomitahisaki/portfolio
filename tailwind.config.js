module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
    plugins: [
      require("daisyui")
  ],
  daisyui:{
    themes:["corporate",]
  },
  theme: {
    extend: {
      colors: {
        custom_color1: "#a0c0e0",
        custom_color2: "#60a0e0",
        custom_color3: "#c0e0e0",
        custom_color4: "#004080",
      }
    }
  },
}
