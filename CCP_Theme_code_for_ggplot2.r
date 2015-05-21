library(ggplot2)
library(grid)

#' CCP Theme for \code{\link[ggplot2]{ggplot}}
#' 
#' Not really some standard CCP thing, just used for standardization of graph output in R
#' @return a \code{\link[ggplot2]{theme}} object
#' @examples
#' ggplot(somedata, aes(...)) + theme_ccp()
#' @export
#' @importFrom ggplot2 theme element_rect element_line element_text rel
theme_ccp <- function( ... ) {
    theme(
        panel.background = element_rect(fill="gray98",color="gray98"), 
        plot.margin = unit(c(2.5,1.5,1.5,1), "lines"),
        plot.background = element_rect(fill="white",color="white"),
        axis.ticks = element_blank(),
        panel.grid = element_line(colour="black"),
        panel.grid.major = element_line(colour="gray87"),
        panel.grid.minor = element_line(colour="gray95"),
        axis.text = element_text(colour="gray40", size=14), 
        axis.title = element_text(size=18,colour="gray20"),
        axis.title.x = element_text(vjust=-1),
        axis.title.y = element_text(vjust=1),
        axis.line = element_line(color="gray35",size=1),
        plot.title = element_text(color="gray20",size=25,vjust=3),
        text = element_text(family="Arial"),
        legend.background=element_blank(),
        legend.text=element_text(size=14),
        legend.key = element_rect(linetype=0,fill="gray98"),
        legend.key.size=unit(1,"cm")        
    )  + theme(...)
}




#' CCP Black Theme for \code{\link[ggplot2]{ggplot}}
#' 
#' Not really some standard CCP thing, just used for standardization of graph output in R
#' @return a \code{\link[ggplot2]{theme}} object
#' @examples
#' ggplot(somedata, aes(...)) + theme_ccp_black()
#' @export
theme_ccp_black <- function( ... ) {
    theme_ccp(
        text = element_text(color="gray90"),
        plot.background=element_rect(fill="gray8",color="gray8"),
        panel.background=element_rect(fill="gray10",color="gray10"),
        panel.grid.major = element_line(colour="gray17"),
        panel.grid.minor = element_line(colour="gray12"),        
        axis.line = element_line(color = "gray50"),
        plot.title = element_text(color="gray80"),
        axis.title = element_text(color="gray70"),
        axis.text = element_text(color="gray30"),        
        legend.key = element_rect(fill="gray10")
    ) + theme(...)
}


#' Theme CCP Font 
#' 
#' Sets the "CCP" Font (DINCondensedCTT) for \code{\link[ggplot2]{ggplot}} ... fancy shit man
#' @return a \code{\link[ggplot2]{theme}} object
#' @examples
#' ggplot(somedata, aes(...)) + theme_ccp_font()
#' @export
theme_ccp_font <- function(plot.title.size=25,axis.title.size=18,axis.text.size=14) {
    theme(
        text = element_text(family="DINCondensedCTT"),
        axis.text = element_text(family="DINCondensedCTT",face="plain",size=axis.text.size),
        axis.title = element_text(family="DINCondensedCTT",face="plain", size=axis.title.size,hjust=0.5),
        plot.title = element_text(family="DINCondensedCTT",face="plain",size=plot.title.size))
}

p <- qplot(rating, data=movies, geom="line")

p + theme_ccp_black() + geom_histogram(colour="turquoise2", fill="turquoise4", alpha = 0.5)

p + theme_ccp_black() + geom_line(colour="turquoise2", fill="turquoise4", alpha = 0.5)

p <- ggplot(data=movies, aes(x=year, y=budget, group=rating))
p + geom_abline()

