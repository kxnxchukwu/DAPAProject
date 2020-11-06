library(C50)
library(printr)
library(data.table)
library(tree)

students.df <- read.csv(file.choose())
students.df$Final.Grade = as.factor(students.df$Final.Grade)

#Split data into train and test
train.indices <- sample(1:nrow(students.df), 100)
students.df.train <- students.df[train.indices, ]
students.df.test <- students.df[-train.indices, ]

#Train decision tree
model <- C5.0(Final.Grade ~., data=students.df.train)

#Test
results <- predict(object=model, newdata=students.df.test, type="class")

#Look at confusion matrix
table(results, students.df.test$Final.Grade)

#Plot the tree
plot(model)
