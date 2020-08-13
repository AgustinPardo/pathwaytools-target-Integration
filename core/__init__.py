import pythoncyc
PGDB_list=pythoncyc.all_orgids()
PGDB_list

meta = pythoncyc.select_organism("META")
all_pathways_list=meta.all_pathways(selector='all', base=True)
all_pathways_list

meta = pythoncyc.select_organism("TEST_2")
all_pathways_list=meta.all_pathways(selector='all', base=True)
all_pathways_list
