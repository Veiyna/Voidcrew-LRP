/datum/admins/proc/togglepurchasing()
	set category = "Server"
	set desc="People can't purchase ships"
	set name="Toggle Ship Purchasing"
	GLOB.ship_buying = !( GLOB.ship_buying )
	if (!( GLOB.ship_buying ))
		to_chat(world, "<B>New players may no longer purchase new ships.</B>", confidential = TRUE)
	else
		to_chat(world, "<B>New players may now purchase new ships.</B>", confidential = TRUE)
	log_admin("[key_name(usr)] toggled ship purchasing.")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] toggled ship purchasing.</span>")
	world.update_status()
	SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Toggle Ship Purchasing", "[GLOB.ship_buying ? "Enabled" : "Disabled"]")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


/datum/admins/proc/togglepasswordcost()
	set category = "Server"
	set desc="Toggles the password cost"
	set name="Toggle Password Cost"
	var/newpasswordcost = !CONFIG_GET(flag/free_ship_passwords)
	CONFIG_SET(flag/free_ship_passwords, newpasswordcost)

	log_admin("[key_name(usr)] [!newpasswordcost ? "enabled" : "disabled"] ship password costs.")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] [!newpasswordcost ? "enabled" : "disabled"] ship password costs.</span>")
	SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Toggle Ship Password Cost", "[!newpasswordcost ? "Enabled" : "Disabled"]")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
