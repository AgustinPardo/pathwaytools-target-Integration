import Bio.SeqIO as bpio

genetic_elements_file=open("genetic-elements.dat","w")

contigs = list(bpio.parse("Kp13_Genome_pruebas.gbk", "gb"))

for contig in contigs:
	bpio.write(contig, contig.id+".gbk", "gb")
	genetic_elements_file.write(("""ID	{}
TYPE	:CONTIG
CIRCULAR?	N
ANNOT-FILE	{}.gbk
//
""").format(contig.id,contig.id))

genetic_elements_file.close()
