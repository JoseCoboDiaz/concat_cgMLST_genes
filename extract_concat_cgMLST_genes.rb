gene=''
ngenes=''
hgene={}
selected=[]
samples=[]
`ls scheme_*/* > scheme_list.txt`

ngenes << `grep -c 'polymorphic' output_*/allele_calling.txt`
ngenes=ngenes.chomp!.to_i

puts ngenes

out=File.new("concatenated_cgMLST.fasta","w")

aa=File.open("scheme_list.txt").each_line do |file|
file.chomp!
	bb=File.open("#{file}").each_line do |line|
	line.chomp!
	#>gene1614_102_1
	if line =~ /^>(gene\d+\_)\d+\_(\d+)/
	gene="#{$1}#{$2}"
puts gene	
	else hgene[gene]=line
	end
	end
	bb.close
end
aa.close

genes=[]
code=''
dd=File.open("allele_calling_mod.txt").each_line do |line|
line.chomp!
#7618_Egypt27	2	12	...
	if line =~ /gene/ 
	genes=line.split("\t")
	elsif line =~ /summary/ # dirty way to not write the last row (summary row)
	else
	out.puts ">#{line.split("\t")[0]}\_#{ngenes}genes_cgMLST"
[*1..ngenes].each {|x| 		
	code="#{genes[x]}\_#{line.split("\t")[x]}"	# asterisc to create an array from 1 to ngenes (the column 0 is the genome name)
	out.print hgene[code]
	}
	out.print "\n"
	end
end
dd.close
