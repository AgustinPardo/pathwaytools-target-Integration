import pythoncyc

def All_PGDB():
    PGDB_list=pythoncyc.all_orgids()
    PGDB_list=[x.encode('ascii')[1:-1] for x in PGDB_list]
    return (PGDB_list)
	
def PGDB_select(name):
	meta = pythoncyc.select_organism(name)
	return(meta)

def All_pathways(PGDB):
	all_pathways_list=PGDB.all_pathways(selector='all', base=True)
	all_pathways_list=[x[1:-1] for x in all_pathways_list]
	return(all_pathways_list)

def All_reactions(PGDB):
	all_reactions_list=PGDB.all_reactions()
	all_reactions_list=[x[1:-1] for x in all_reactions_list]
	return(all_reactions_list)

# def ... pathways_of_gene(gene, include_super_pwys=None)
# def ... genes_of_reaction(rxn)



