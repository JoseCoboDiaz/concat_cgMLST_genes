# concat_cgMLST_genes
A ruby script to concatenate cgMLST genes obtained by fast-GeP (https://github.com/jizhang-nz/fast-GeP)

To run this pipeline place the 2 scripts at the same folder where the Ge_P output folders are located (it will use scheme_* folder) and make the next steps:

1- To prepare the allele_calling.txt file (located within output_* folder) and keep only polymorphic genes you need to open this file as excel table and:

	- keep the header line 

	- keep the lines with "polymorphic" at the last column (remove those genes without polymorphic)
	
	- transpose the entire matrix, so that genes are located by columns and genomes by rows
	
	- save it as "allele_calling_mod.txt" at the same directory as "extract_concat_cgMLST_genes.rb"

2- Finally, run the ruby script to obtain the concatenated cgMLST fasta file:
	
	ruby extract_concat_cgMLST_genes.rb
