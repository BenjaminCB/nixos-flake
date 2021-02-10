#dark mode
config.set("colors.webpage.darkmode.enabled",True)

#fonts
# c.fonts.default_family = "fira code"
c.fonts.default_size = "16pt"
c.fonts.hints = "22pt"

#bindings
config.bind("<", "tab-prev")
config.bind(">", "tab-next")

#zoom
c.zoom.default = "150%"
c.zoom.levels = ["25%", "33%", "50%", "67%", "75%", "90%", "100%", "110%", "120%", "130%", "140%", "150%", "160%", "170%", "180%", "190%", "200%", "250%", "300%", "400%", "500%"]

config.load_autoconfig(False)
