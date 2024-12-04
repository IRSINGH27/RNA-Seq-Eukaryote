library(edgeR)

nameCorrection<-function(x){
    val<-unlist(strsplit(x=x,'_'))
    val<-val[2:length(val)]
    return(paste(val,sep=' ',collapse = ' '))
}
fileName<-'' # CPM File
pathwayFile<-'' # gsea pathway file
df<-read.csv(fileName,sep=',',row.names=1)
df2$gene<-unlist(lapply(row.names(df),FUN=function(x){unlist(stringi::stri_split_fixed(x,'|',n=2))[[2]]}))
df<-df[df$FDR<=0.1,]

rankDF<-dplyr::mutate(df,rank=-log10(FDR)*sign(df$logFC))
rankDF<-rankDF[,c(6,7)]
rankDF<-dplyr::arrange(rankDF,rank)
gseaDF<-tibble::deframe(rankDF)
pathwayDF<-fgsea::gmtPathways(pathwayFile)

OurPathway<-fgsea::fgsea(pathways=pathwayDF,stats=gseaDF)
OurPathway<-dplyr::arrange(OurPathway,desc(NES))
OurPathway$pathway<-unlist(lapply(OurPathway$pathway,FUN=nameCorrection))
