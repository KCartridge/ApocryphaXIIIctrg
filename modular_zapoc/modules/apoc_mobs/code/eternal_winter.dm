/mob/living/simple_animal/hostile/megafauna/demonic_frost_miner/eternal_winter
	name = "Eternal Winter"
	desc = "A terrifying monster that chills you to your very bones."
	health = 3000
	maxHealth = 3000
	icon_state = "eternal_winter"
	icon_living = "eternal_winter"
	icon = 'modular_zapoc/modules/apoc_mobs/icons/eternal_winter.dmi'
	attack_sound = 'sound/weapons/sonic_jackhammer.ogg'
	death_sound = 'sound/magic/demon_dies.ogg'
	light_color = COLOR_CYAN
	pixel_x = -32
	base_pixel_x = -32
	crusher_loot = list(/obj/effect/decal/remains/vomitnebula, /obj/item/resurrection_crystal)
	loot = list(/obj/effect/decal/remains/vomitnebula, /obj/item/resurrection_crystal = 3)
	achievement_type = /datum/award/achievement/boss/demonic_miner_kill/eternal_winter
	crusher_achievement_type = /datum/award/achievement/boss/demonic_miner_crusher/eternal_winter
	score_achievement_type = /datum/award/score/demonic_miner_score/eternal_winter
	deathmessage = "falls to the ground, decaying into... something."
	projectile_speed_multiplier = 2

/obj/effect/decal/vomitnebula
	name = "celestial ejecta"
	desc = "It'll definitely leave a stain. You might not want to touch it."
	icon_state = "vomitnebula_1"

/obj/effect/decal/remains/vomitnebula/Initialize()
	. = ..()
	icon_state = "vomitnebula_[rand(1, 4)]"

/obj/effect/spawner/random/ice_guy
	icon = 'icons/effects/random_spawners.dmi'
	icon_state = "costume"
	loot = list(/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow, /mob/living/simple_animal/hostile/asteroid/ice_demon, /mob/living/simple_animal/hostile/asteroid/lobstrosity)
