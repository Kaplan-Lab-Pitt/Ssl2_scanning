# Syntax: Rscript spread_THRESHOLDED_counts.R <count table.csv>
# Calculates spread, positions of 10th and 90th percentile reads in count table and position with median reads in count table from a csv TSS reads file.


args=(commandArgs(TRUE))
f=args[1]
f=gsub('\\',"",f,fixed=TRUE)

x=read.table(f,sep=",",header=FALSE,stringsAsFactors=FALSE)

n=dim(x)[1]
J=dim(x)[2]
dists=rep(0,n)
aboveThresh=rep(0,n)
expr=rep(0,n)
nonZeros=rep(0,n)
totalCnt=rep(0,n)
spread_up=rep(0,n)
spread_down=rep(0,n)
medp=rep(0,n)

for(i in 1:n)
{ cat("loop",i,"\n")
	exprCnt=sum(x[i,])
	expr[i]=exprCnt
	if(!is.na(exprCnt)&!(exprCnt==0))
	{
		crPrcnt=0;ten=0;nin=0;meds=0;
		for(j in 1:J)
		{
			crPrcnt=crPrcnt+(x[i,j])/exprCnt
			if(ten==0&crPrcnt>=.10){ten=j}
			totalCnt[i]=totalCnt[i]+(0!=x[i,j])
			if(crPrcnt>=.10&nin==0){
				aboveThresh[i]=aboveThresh[i]+(x[i,j]/exprCnt>.02)
				nonZeros[i]=nonZeros[i]+(0!=x[i,j])
			}
			if(meds==0&crPrcnt>=.50){meds=j}
			if(nin==0&crPrcnt>=.90){nin=j}
		}
		dists[i]=nin-ten+1
		spread_up[i]=ten
		spread_down[i]=nin
		medp[i]=meds
	}
}
everything <- data.frame(expr,dists,spread_up,spread_down,medp)
heads <- c("expression","spread","spread_up","spread_down","median_position_in_matrix")
final <- data.frame(rbind(heads,everything),stringsAsFactors = FALSE)
write.table(final,paste(f,"expression_spread_median.txt",sep=""),sep="\t",row.names=FALSE,col.names=FALSE,quote=FALSE)
