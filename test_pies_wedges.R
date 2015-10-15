# use graphviz wedges
library(DiagrammeR)
nodes <- create_nodes(nodes = c("a", "b"),
                      style = "wedged",
                      shape = "circle",
                      fillcolor = c("yellow;0.3:blue", "blue;0.3:yellow"))

render_graph(create_graph(nodes_df = nodes), output = "graph")


# use svg images

# try locally hosted first
library(Cairo)
pie_area <- rep(0.5, 2)
names(pie_area) <- rep("", 2)

f_1 <- file.path(getwd(), "f_1.svg")
Cairo(width = 640, height = 640, file = f_1, type = "svg", bg = "transparent", dpi = 72)
pie(pie_area, col = c("yellow", "blue"))
dev.off()

f_2 <- file.path(getwd(), "f_2.svg")
Cairo(width = 640, height = 640, file = f_2, type = "svg", bg = "transparent", dpi = 72)
pie(pie_area, col = c("blue", "yellow"))
dev.off()


nodes_2 <- create_nodes(nodes = c("a", "b"),
                      shape = "image",
                      image = paste("file:///", c(f_1, f_2), sep = ""))
render_graph(create_graph(nodes_df = nodes_2), output = "visNetwork")
