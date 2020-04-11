data<-read.table("allele_calling_temp.txt")
write.table(t(data),file="allele_calling_mod.txt", quote=FALSE, sep="\t")
