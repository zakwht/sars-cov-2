one_letter = {'VAL':'V', 'ILE':'I', 'LEU':'L', 'GLU':'E', 'GLN':'Q', 'ASP':'D', 'ASN':'N', 'HIS':'H', 'TRP':'W', 'PHE':'F', 'TYR':'Y', 'ARG':'R', 'LYS':'K', 'SER':'S', 'THR':'T', 'MET':'M', 'ALA':'A', 'GLY':'G', 'PRO':'P', 'CYS':'C'}
indices = [31,41,66,82,113,353,426,679]

# looking at differences in structure
# import PDBs
show_as licorice

p1 = Q9BYF1 # human protein
p2 = Q5EGZ1 # rat protein
p3 = Q8R0I0 # mouse protein

super p1, p2, cycles=0
dist all_polar_conts, p1, p1, mode=2
dist all_polar_conts, p2, p2, mode=2
hide labels, all_polar_conts


# looking at spike protein
fetch 6VW1
create ACE2-1, (A//)
create ACE2-2, (B//)
create SPIKE-1, (C,E//)
create SPIKE-2, (D,F//)
color yellow, SPIKE-1 SPIKE-2
color cyan, ACE2-1 ACE2-2


# for each index 
zoom i. 31
label i. 31, "%s%s" %(one_letter[resn],resi)
