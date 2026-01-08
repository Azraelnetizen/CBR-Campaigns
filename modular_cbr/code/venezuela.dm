#define VENEZUELA "VENEZUELA"

/datum/job/venezuela
	faction = "Human"
	title = "Venezuela"
	rank_abbreviation = ""
	spawn_location = "JoinLateVenezuela"
	uses_squads = TRUE
	squad = 0
	additional_languages = list("Spanish" = 15)
	min_positions = 1
	max_positions = 999
	selection_color = "#cc4040"

/datum/job/venezuela/give_random_name(var/mob/living/human/H)
	H.name = H.species.get_random_spanish_name(H.gender)
	H.real_name = H.name

/datum/job/venezuela/commander
	is_commander = TRUE
	title = "FANB Comandante"
	rank_abbreviation = "CO-Cpt."
	additional_languages = list("Spanish" = 90, "English" = 10)

/datum/job/venezuela/s1/sl
	title = "FANB Squad 1 Squadleader"
	squad = 1
	is_squad_leader = TRUE
	rank_abbreviation = "1-Sgt"

/datum/job/venezuela/s1/pvt
	title = "FANB Squad 1 Private"
	squad = 1
	rank_abbreviation = "1-Pvt"
/datum/job/venezuela/s1/corpsman
	title = "FANB Squad 1 Corpsman"
	is_medic = TRUE
	squad = 1
	rank_abbreviation = "1-Corpsman"
/datum/job/venezuela/s1/machinegunner
	title = "FANB Squad 1 Machinegunner"
	squad = 1
	rank_abbreviation = "1-MG"

/datum/job/venezuela/s2/sl
	title = "FANB Squad 2 Squadleader"
	squad = 2
	is_squad_leader = TRUE
	rank_abbreviation = "2-Sgt"
/datum/job/venezuela/s2/pvt
	title = "FANB Squad 2 Private"
	squad = 2
	rank_abbreviation = "2-Pvt"
/datum/job/venezuela/s2/corpsman
	title = "FANB Squad 2 Corpsman"
	is_medic = TRUE
	squad = 2
	rank_abbreviation = "2-Corpsman"
/datum/job/venezuela/s2/machinegunner
	title = "FANB Squad 2 Machinegunner"
	squad = 2
	rank_abbreviation = "2-MG"

/datum/job/venezuela/s3/sl
	title = "FANB Squad 3 Squadleader"
	squad = 3
	is_squad_leader = TRUE
	rank_abbreviation = "3-Sgt"
/datum/job/venezuela/s3/pvt
	title = "FANB Squad 3 Private"
	squad = 3
	rank_abbreviation = "3-Pvt"
/datum/job/venezuela/s3/corpsman
	title = "FANB Squad 3 Corpsman"
	is_medic = TRUE
	squad = 3
	rank_abbreviation = "3-Corpsman"
/datum/job/venezuela/s3/machinegunner
	title = "FANB Squad 3 Machinegunner"
	squad = 3
	rank_abbreviation = "3-MG"

/datum/job/venezuela/equip(var/mob/living/human/H)
	if (!H)	return FALSE
	H.squad = squad
	H.nationality = "Venezuelan"
	if(is_squad_leader)
		map.faction1_squad_leaders[squad] = H
	var/area/A = get_area(get_turf(H))

    //shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/combat(H), slot_shoes)
	
    //clothes
	H.equip_to_slot_or_del(new/obj/item/clothing/under/us_uni/us_camo_woodland(H), slot_w_uniform)
	var/obj/item/clothing/under/uniform = H.w_uniform
	
    //armor
	var/obj/item/clothing/accessory/armor/coldwar/plates/b3 = new /obj/item/clothing/accessory/armor/coldwar/plates/b3(null)
	uniform.attackby(armor, H)
	var/obj/item/weapon/armorplates/plates1 = new /obj/item/weapon/armorplates(null)
	var/obj/item/weapon/armorplates/plates2 = new /obj/item/weapon/armorplates(null)
	uniform.attackby(plates1, H)
	uniform.attackby(plates2, H)

    //helmet
	if (findtext(title, "Squadleader"))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47/emr(H), slot_head)
	else if (findtext(title, "Commander"))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/beret_green(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47/emr(H), slot_r_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/a6b47/emr(H), slot_head)

    //equipment
	if (findtext(title, "Squadleader"))
		H.equip_to_slot_or_del(new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(H), slot_l_store)
	else if (findtext(title, "Commander"))
		H.equip_to_slot_or_del(new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(H), slot_l_store)

	if (findtext(title, "Machinegunner"))
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/browning_lmg(H), slot_shoulder)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/submachinegun/ak101/ak103, slot_l_hand)
	
	if (findtext(title, "Corpsman"))
		H.setStat("medical", STAT_VERY_HIGH)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/combat(H), slot_belt)
		var/obj/item/clothing/accessory/custom/armband/medicalarm = new /obj/item/clothing/accessory/armband/redcross(null)
		uniform.attackby(medicalarm, H)
	else if (findtext(title, "Doctor"))
		H.setStat("medical", STAT_MAX)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/doctor(H), slot_wear_suit)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/adv(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/combat(H), slot_belt)
		var/obj/item/clothing/accessory/custom/armband/medicalarm = new /obj/item/clothing/accessory/armband/redcross(null)
		uniform.attackby(medicalarm, H)
	else
		var/obj/item/clothing/accessory/custom/armband/armband = new /obj/item/clothing/accessory/armband/redfaction(null)
		uniform.attackby(armband, H)

	if (findtext(title, "Machinegunner"))
		if(A.climate == "taiga" || A.climate == "tundra")
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/largepouches/red/white/mg(H), slot_belt)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/largepouches/olive(H), slot_belt)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/smallpouches/red/full(H), slot_belt)
	
	H.equip_to_slot_or_del(new /obj/item/weapon/radio/walkietalkie/faction1(H), slot_wear_id)
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_NORMAL)

	H.make_artillery_scout()
	if(A.climate == "taiga" || A.climate == "tundra")
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/coat/fur/schneetarn(H), slot_wear_suit)
	return TRUE