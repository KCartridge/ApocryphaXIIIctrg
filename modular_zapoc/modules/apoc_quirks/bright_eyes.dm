/datum/quirk/brighteyes
	name = "Bright Eyes"
	desc = "Your eyes are a startling color or bear some other characteristic that is odd to observers. Contacts? Weird Genes? Born a wolf? Who can say. Maybe wear some sunglasses."
	value = 0
	allowed_species = list("Ghoul","Human","Imbued","Vampire","Kuei-Jin")

/datum/quirk/brighteyes/fera
	name = "Bright Eyes (Fera)"
	desc = "To those who know, your eyes betray your true nature. Your eyes are a startling color or characteristically canine in apperance."
	value = -1
	mob_trait = TRAIT_BRIGHTEYES
	allowed_species = list("Werewolf")

/datum/quirk/brighteyes/add()
	var/mob/living/carbon/H = quirk_holder

	H.become_brighteyes(ROUNDSTART_TRAIT)







var/mutable_appearance/bright_eyes
		var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
		if((!skipface && !bright_eyes))
			bright_eyes = mutable_appearance('icons/mob/human_face.dmi', "eyes")
			bright_eyes.plane = ABOVE_LIGHTING_PLANE
			bright_eyes.layer = ABOVE_LIGHTING_LAYER
		add_overlay(bright_eyes)















/*
	icon = 'icons/mob/human_face.dmi'
	icon_state "eyes"
   /icons/mob/human_face.dmi // place where I can find eye sprite

	proc/mutable_appearance(icon, icon_state = "", layer = FLOAT_LAYER, plane = FLOAT_PLANE)


	var/mutable_appearance/eye_overlay = mutable_appearance(icon, "eyes[laid_down ? "_rest" : ""]")
	eye_overlay.color = sprite_eye_color
	eye_overlay.plane = ABOVE_LIGHTING_PLANE
	eye_overlay.layer = ABOVE_LIGHTING_LAYER
	add_overlay(eye_overlay)


	/datum/controller/subsystem/vis_overlays/proc/add_vis_overlay(atom/movable/thing, icon, iconstate, layer, plane, dir, alpha = 255, add_appearance_flags = NONE, unique = FALSE)
	var/obj/effect/overlay/vis/overlay
	if(!unique)
		. = "[icon]|[iconstate]|[layer]|[plane]|[dir]|[alpha]|[add_appearance_flags]"
		overlay = vis_overlay_cache[.]
		if(!overlay)
			overlay = _create_new_vis_overlay(icon, iconstate, layer, plane, dir, alpha, add_appearance_flags)
			vis_overlay_cache[.] = overlay
		else
			overlay.unused = 0
	else
		overlay = _create_new_vis_overlay(icon, iconstate, layer, plane, dir, alpha, add_appearance_flags)
		overlay.cache_expiration = -1
		var/cache_id = "[FAST_REF(overlay)]@{[world.time]}"
		unique_vis_overlays += overlay
		vis_overlay_cache[cache_id] = overlay
		. = overlay
	thing.vis_contents += overlay

	if(!isatom(thing)) // Automatic rotation is not supported on non atoms
		return overlay

	if(!thing.managed_vis_overlays)
		thing.managed_vis_overlays = list(overlay)
	else
		thing.managed_vis_overlays += overlay
	return overlay

*/
