dat <- read.csv("scatter_value.csv")
dat$Similarity[which(dat$Similarity == 0)] = 0.000000001 
St1 = 0.015528969196702956
Dt1 = 2.4949438168165483
St2 = 0.08752176628812282
Dt2 = 2.26567908457803

colors = c("red","magenta","blue","darkgreen")
pch = c(4,2,3,16)

#Print Graph with Log
pdf("scatter_log.pdf")
plot(dat$Distance,dat$Similarity,xlim=c(0.8,8),pch=16,col=NA,log="xy",xlab="Distance",ylab="Similarity",yaxt="n")
rect(0.0000001,St1,Dt1,3,col=rgb(0,0.8,0,0.3),border=NA)
rect(Dt2,0.0000000001,10,St2,col=rgb(0.8,0,0,0.3),border=NA)
axis(2,at=c(0.000000001,0.0000001,0.00001,0.001,0.1,0.5,0.8,1),labels=c(0,0.0000001,0.00001,0.001,0.1,"","","1"))
for(i in seq(0,3)){
	points(dat$Distance[which(dat$Vote == i)],dat$Similarity[which(dat$Vote == i)],pch=pch[i+1],col=colors[i+1])
}
legend("topright", title="Comments Class", legend = c("Useless (YES = 0)","Unclear (YES = 1)","Unclear (YES = 2)","Useful (YES = 3)"), pch=pch, col=colors,bg=rgb(1,1,1,0.8))

dev.off()

# pdf("scatter.pdf")
# plot(dat$Distance,dat$Similarity,xlim=c(0.8,8),pch=16,col=NA,xlab="Distance",ylab="Similarity")
# rect(0.0000001,St1,Dt1,3,col=rgb(0,0.8,0,0.3),border=NA)
# rect(Dt2,-1,10,St2,col=rgb(0.8,0,0,0.3),border=NA)
# for(i in seq(0,3)){
# 	points(dat$Distance[which(dat$Vote == i)],dat$Similarity[which(dat$Vote == i)],pch=pch[i+1],col=colors[i+1])
# }
# dev.off()