
# Exact Sampling Distribution ---------------------------------------------
# If X is a normal RV, X.bar will be a normal RV regardless of sample size
# Distribution of X ~ N(0,1)
set.seed(108838) # set seed so that I can replicate the results
x <- runif(100000)
hist(x, xlim = c(0,1), ylim = c(0,1.1), breaks = 30, freq = FALSE)
lines(density(x), col = "red")
legend("topright", legend = "Distribution of X", lty = 1, col = "red", text.col = "red", bty = "n")
# Use ggplot to create the same or similar figure as the above figure
library(tidyverse)
ggplot(data = tibble(x = x),
       mapping = aes(x = x)) +
  geom_histogram(mapping = aes(y = after_stat(density)),
                 bins = 20,
                 fill = "lightblue",
                 color = "black") +
  geom_density(color = "red") +
  theme_minimal() +
  labs(x = "X", y = "Density") +
  ggtitle("Distribution of X") +
  scale_x_continuous(breaks = c(0.0, 0.2, 0.4, 0.6, 0.8, 1.0))

# Let's see the distribution of the sample mean from a normal distribution
# when the sample size is as small as 2 (n.small = 2)
set.seed(45275) # set seed so that I can replicate the results
n.small <- 2
x.bars <- sapply(X = 1:2000, FUN = function(a){ mean(runif(n.small)) })
hist(x.bars, xlim = c(0,1), ylim = c(0,2.5), breaks = 30, freq = FALSE)
lines(density(x.bars), col = "blue")
lines(density(x), col = "red")
legend("topright",
       legend = c("Distribution of X", "Distribution of sample mean (n = 2)"),
       lty = 1,
       col = c("red","blue"), text.col = c("red","blue"), bty = "n")

# Repeat for iteration #1~#2000 for n.large = 20
set.seed(975) # set seed so that I can replicate the results
n.large <- 20
x.bars.n.large <- sapply(X = 1:2000, FUN = function(a){ mean(runif(n.large)) })
hist(x.bars.n.large, xlim = c(0,1), ylim = c(0,6.5), breaks = 30, freq = FALSE)
lines(density(x.bars.n.large), col = "darkgreen")
lines(density(x), col = "red")
lines(density(x.bars), col = "blue")
legend("topright",
       legend = c("Distribution of X",
                  paste0("Distribution of sample mean (n = ",n.small,")"),
                  paste0("Distribution of sample mean (n = ",n.large,")")),
       lty = 1,
       col = c("red","blue","darkgreen"),
       text.col = c("red","blue","darkgreen"), bty = "n")
