
input <- commandArgs(trailingOnly = TRUE)

dats=read.table(input[1],header=FALSE,sep="\t",stringsAsFactors=FALSE)
dats[,2]=dats[,2]+1
gff=read.table(input[2],header=FALSE,sep="\t",stringsAsFactors=FALSE)

a=dim(gff)[1]
b=gff[1,3]-gff[1,2]+1
output_file=matrix(0,a,b)

for(w in 1:dim(gff)[1])
{ cat("loop",w,"\n")

  dataOverlappingWindow=(dats[,1]==gff[w,1])&(dats[,5]==gff[w,4])&((dats[,2]>=gff[w,2])&(dats[,2]<=gff[w,3]))

  dataInWindow=dats[dataOverlappingWindow,]

  if(gff[w,4]=="+"){WindowCoordsStart2End=gff[w,2]:gff[w,3]}
  else{WindowCoordsStart2End=gff[w,3]:gff[w,2]}

  q=1  
  for(p in WindowCoordsStart2End)    
{if(q>b) break
 score=dataInWindow[p==dataInWindow[,2],4]
 if(length(score)==0){score=0}
 output_file[w,q]=score
 q=q+1
}
}

write.table(output_file,"temp5.txt",row.names=FALSE,col.names=FALSE,sep=",")
