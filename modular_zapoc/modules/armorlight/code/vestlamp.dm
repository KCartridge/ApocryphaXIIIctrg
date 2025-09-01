//Bunch of vests that have attached shoulder lamps

/obj/item/clothing/suit/vampire/vest/lamp
	name = "bulletproof vest"
	desc = "Durable, lightweight vest designed to protect against most threats efficiently. Has a shoulder-mounted lamp."
	icon_state = "vest_lamp"
	icon = 'modular_zapoc/modules/armorlight/icons/vestlamp.dmi'
	worn_icon = 'modular_zapoc/modules/armorlight/icons/vestlampworn.dmi'
	onflooricon = 'modular_zapoc/modules/armorlight/icons/vestlamp.dmi'
	armor = list(MELEE = 55, BULLET = 55, LASER = 10, ENERGY = 10, BOMB = 55, BIO = 0, RAD = 0, FIRE = 45, ACID = 10, WOUND = 25)
	allowed = list(
		/obj/item/card/id,
		/obj/item/flashlight,
		/obj/item/melee/classic_baton/vampire,
		/obj/item/restraints/handcuffs
	)
	actions_types = list(/datum/action/item_action/toggle_light)
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_range = 5
	light_power = 1
	light_on = FALSE
	var/on = FALSE

/obj/item/clothing/suit/vampire/vest/lamp/police
	name = "police duty vest"
	icon_state = "pdvest_lamp"
	desc = "Lightweight, bulletproof vest with SFPD markings, tailored for active duty. Has a shoulder-mounted lamp."

/obj/item/clothing/suit/vampire/vest/lamp/police/sergeant
	name = "police sergeant vest"
	icon_state = "sgtvest_lamp"
	desc = "Lightweight, bulletproof vest with SFPD markings, tailored for active duty. This one has sergeant insignia on it. Has a shoulder-mounted lamp."

/obj/item/clothing/suit/vampire/vest/lamp/police/chief
	name = "police chief duty vest"
	icon_state = "chiefvest_lamp"
	desc = "Composite bulletproof vest with SFPD markings, tailored for improved protection. This one has captain insignia on it. Has a shoulder-mounted lamp."
	armor = list(MELEE = 70, BULLET = 70, LASER = 10, ENERGY = 10, BOMB = 60, BIO = 0, RAD = 0, FIRE = 50, ACID = 10, WOUND = 30)

/obj/item/clothing/suit/vampire/vest/lamp/police/fbivest
	name = "FBI duty vest"
	icon_state = "fbivest_lamp"
	desc = "Lightweight, bulletproof vest with yellow FBI markings, tailored for active duty. This one has special agent insignia on it. Has a shoulder-mounted lamp."
	armor = list(MELEE = 25, BULLET = 25, LASER = 10, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 25, ACID = 10, WOUND = 25)

/obj/item/clothing/suit/vampire/vest/lamp/army
	name = "army vest"
	desc = "Army equipment. Provides great protection against blunt force. Has a shoulder-mounted lamp."
	icon_state = "armyvest_lamp"
	w_class = WEIGHT_CLASS_BULKY
	armor = list(MELEE = 70, BULLET = 70, LASER = 10, ENERGY = 10, BOMB = 55, BIO = 0, RAD = 0, FIRE = 45, ACID = 10, WOUND = 25)
	masquerade_violating = TRUE

// Lighting system copyover from flashlights so that they actually emit light
/obj/item/clothing/suit/vampire/vest/lamp/Initialize()
	. = ..()
	if(icon_state == "[initial(icon_state)]_on")
		on = TRUE
	update_brightness()

/obj/item/clothing/suit/vampire/vest/lamp/proc/update_brightness(mob/user)
	if(on)
		icon_state = "[initial(icon_state)]_on"
	else
		icon_state = initial(icon_state)
	set_light_on(on)
	if(light_system == STATIC_LIGHT)
		update_light()

/obj/item/clothing/suit/vampire/vest/lamp/attack_self(mob/user)
	if(iskindred(user))
		var/mob/living/carbon/human/H = user
		if(H.clan)
			if(H.clan.name == CLAN_LASOMBRA)
				return
	..()
	on = !on
	playsound(user, on ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)
	update_brightness(user)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
	return 1

// Crafting BABY
/datum/crafting_recipe/vestlamp
	name = "Vest with flashlight"
	reqs = list(/obj/item/clothing/suit/vampire/vest = 1,
				/obj/item/flashlight = 1)
	tools = list(TOOL_SCREWDRIVER)
	result = /obj/item/clothing/suit/vampire/vest/lamp
	blacklist = list(/obj/item/clothing/suit/vampire/vest/medieval,
					/obj/item/clothing/suit/vampire/vest/police,
					/obj/item/clothing/suit/vampire/vest/police/sergeant,
					/obj/item/clothing/suit/vampire/vest/police/chief,
					/obj/item/clothing/suit/vampire/vest/police/fbivest,
					/obj/item/clothing/suit/vampire/vest/army,
					/obj/item/clothing/suit/vampire/vest/lamp,
					/obj/item/clothing/suit/vampire/vest/lamp/police,
					/obj/item/clothing/suit/vampire/vest/lamp/police/sergeant,
					/obj/item/clothing/suit/vampire/vest/lamp/police/chief,
					/obj/item/clothing/suit/vampire/vest/lamp/police/fbivest,
					/obj/item/clothing/suit/vampire/vest/lamp/army)
	time = 2 SECONDS
	category = CAT_CLOTHING
	always_available = TRUE

/datum/crafting_recipe/vestlamp_police
	name = "Officer's vest with flashlight"
	reqs = list(/obj/item/clothing/suit/vampire/vest/police = 1,
				/obj/item/flashlight = 1)
	tools = list(TOOL_SCREWDRIVER)
	result = /obj/item/clothing/suit/vampire/vest/lamp/police
	blacklist = list(/obj/item/clothing/suit/vampire/vest,
					/obj/item/clothing/suit/vampire/vest/police/sergeant,
					/obj/item/clothing/suit/vampire/vest/police/chief,
					/obj/item/clothing/suit/vampire/vest/police/fbivest)
	time = 2 SECONDS
	category = CAT_CLOTHING
	always_available = TRUE

/datum/crafting_recipe/vestlamp_sergeant
	name = "Sergeant's vest with flashlight"
	reqs = list(/obj/item/clothing/suit/vampire/vest/police/sergeant = 1,
				/obj/item/flashlight = 1)
	tools = list(TOOL_SCREWDRIVER)
	result = /obj/item/clothing/suit/vampire/vest/lamp/police/sergeant
	blacklist = list(/obj/item/clothing/suit/vampire/vest,
					/obj/item/clothing/suit/vampire/vest/police)
	time = 2 SECONDS
	category = CAT_CLOTHING
	always_available = TRUE

/datum/crafting_recipe/vestlamp_chief
	name = "Chief's vest with flashlight"
	reqs = list(/obj/item/clothing/suit/vampire/vest/police/chief = 1,
				/obj/item/flashlight = 1)
	tools = list(TOOL_SCREWDRIVER)
	result = /obj/item/clothing/suit/vampire/vest/lamp/police/chief
	blacklist = list(/obj/item/clothing/suit/vampire/vest,
					/obj/item/clothing/suit/vampire/vest/police)
	time = 2 SECONDS
	category = CAT_CLOTHING
	always_available = TRUE

/datum/crafting_recipe/vestlamp_fbi
	name = "FBI vest with flashlight"
	reqs = list(/obj/item/clothing/suit/vampire/vest/police/fbivest = 1,
				/obj/item/flashlight = 1)
	tools = list(TOOL_SCREWDRIVER)
	result = /obj/item/clothing/suit/vampire/vest/lamp/police/fbivest
	blacklist = list(/obj/item/clothing/suit/vampire/vest,
					/obj/item/clothing/suit/vampire/vest/police)
	time = 2 SECONDS
	category = CAT_CLOTHING
	always_available = TRUE

/datum/crafting_recipe/vestlamp_army
	name = "Army vest with flashlight"
	reqs = list(/obj/item/clothing/suit/vampire/vest/army = 1,
				/obj/item/flashlight = 1)
	tools = list(TOOL_SCREWDRIVER)
	result = /obj/item/clothing/suit/vampire/vest/lamp/army
	blacklist = list(/obj/item/clothing/suit/vampire/vest)
	time = 2 SECONDS
	category = CAT_CLOTHING
	always_available = TRUE
