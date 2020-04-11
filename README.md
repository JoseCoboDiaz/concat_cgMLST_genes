# concat_cgMLST_genes
A ruby script to concatenate cgMLST genes obtained by fast-GeP (https://github.com/jizhang-nz/fast-GeP).

It is important that you also need R software installed, because a R-script will be used to transpose the data matrix.

To run this pipeline place the 2 scripts at the same folder where the Ge_P output folders are located (it will use scheme_* folder) and tip the next command on the terminal:
	
	ruby extract_concat_cgMLST_genes.rb
	
It will generate the "allele_calling_mod.txt" file, where only polymorphic genes were selected from Ge_P output "alle_calling.txt" file; and the "concatenated_cgMLST.fasta" file, which can be used for phylogenetic analysis.
