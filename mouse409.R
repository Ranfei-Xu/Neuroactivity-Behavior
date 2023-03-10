pacman::p_load(R.matlab)

# Import mouse 409 data
bb <- readMat("Data/Zero_Maze/608034_409/Day_1/Trial_001_0/binned_behavior.mat")
bb <- data.frame(t(bb$binned.behavior))
names(bb) <- c("open", "closed")

bz <- readMat("Data/Zero_Maze/608034_409/Day_1/Trial_001_0/binned_zscore.mat")
bz <- data.frame(bz$binned.zscore)

data <- data.frame(cbind(bb, bz))
data$time <- seq(1:nrow(data))

data_clean <- data[-which(data$open==0 & data$closed==0),]

rm(bb, bz, data)