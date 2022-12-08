setwd("~/Desktop/")
library(tidyverse)


#load raw data
variants = read_csv("var_vcf.csv")
glimpse(variants)
head(variants)


#scatter plot between Depth and Position.
ggplot(variants, aes(POS, DP, color = sample_id)) + 
  geom_point(alpha = 0.6,size = 0.8) +
  labs(x = "Base Pair Position",
       y = "Read Depth (DP)") +
  ggtitle("Read Depth vs. Position") +
  theme_minimal()


#scatter plot between Mapping quality and Position.
ggplot(variants, aes(POS, MQ, color = sample_id)) + 
  geom_point(alpha = 0.6,size = 0.8) +
  labs(x = "Base Pair Position",
       y = "Read Depth (DP)") +
  ggtitle("Read Depth vs. Position") +
  theme_minimal()


#Faceting each sample_id scatter plot between Mapping quality and Position by vertically.
ggplot(variants, aes(POS, MQ, color = sample_id)) +
  geom_point(alpha = 0.6,size = 0.8) +
  labs(x = "Base Pair Position",
       y = "Mapping Quality (MQ)") +
  facet_grid(. ~ sample_id) +
  theme_bw() +
  theme(panel.grid = element_blank())


#Faceting each sample_id scatter plot between Mapping quality and Position by horizontally.
ggplot(variants, aes(POS, MQ, color = sample_id)) +
  geom_point(alpha = 0.6,size = 0.8) +
  labs(x = "Base Pair Position",
       y = "Mapping Quality (MQ)") +
  facet_grid(sample_id ~ .) +
  theme_bw() +
  theme(panel.grid = element_blank())

#Faceting each sample_id scatter plot between Quality and Position by horizontally.
ggplot(variants, aes(POS, QUAL, color = sample_id)) +
  geom_point() +
  labs(x = "Base Pair Position",
       y = "PHRED-sacled Quality (QUAL)") +
  facet_grid(sample_id ~ .) +
  theme_bw() +
  theme(panel.grid = element_blank())


#Faceting each sample_id scatter plot between frequency of INDEL and not INDEL variant.
ggplot(data = variants, aes(x = INDEL, fill = sample_id)) +
  geom_bar() +
  facet_grid(sample_id ~ .)


