/obj/structure/man_crystal
	name = "strange crystal"
	desc = "I hope that isn't a person in there..."
	anchored = TRUE
	density = TRUE
	max_integrity = 400

/obj/structure/man_crystal
/obj/structure/man_crystal/atom_destruction(damage_flag)
	new /obj/effect/mob_spawn/human/corpse/damaged/legioninfested/permafrost(loc)
