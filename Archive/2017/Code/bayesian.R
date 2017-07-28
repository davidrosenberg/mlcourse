require(ggplot2)
jobFolder = "~/Dropbox/repos/mlcourse/Code"

x <- seq(0, 1, len = 100)
p <- qplot(x, geom = "blank")
stat <- stat_function(aes(x = x, y = ..y..), fun = dbeta, colour="red", n = 100, args = list(shape1 = 2, shape2 = 2))
p = p + stat + labs(title="Prior: Beta(2,2)") +xlab(expression(theta)) + ylab(expression(p(theta)))
p
fname = path.expand(paste0(jobFolder,"/beta2-2.png"))
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)



x <- seq(0, 1, len = 1000)
p <- qplot(x, geom = "blank")
stat <- stat_function(aes(x = x, y = ..y..), fun = dbeta, colour="red", n = 1000, args = list(shape1 = 77, shape2 = 62))
p = p + stat + labs(title="Posterior: Beta(77,62)") +xlab(expression(theta)) + ylab(expression(p(theta)))
fname = path.expand(paste0(jobFolder,"/beta77-62.png"))
ggsave(filename=fname,plot=p, units="in", width=6, height = 4)

