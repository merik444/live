jawa_greenwhite = Creature:new {
    customName = "A festive Jawa",
	socialGroup = "townsperson",
	faction = "",
	level = 230,
	chanceHit = 2.75,
	damageMin = 790,
	damageMax = 1150,
	baseXp = 3921,
	baseHAM = 80300,
	baseHAMmax = 123012,
	armor = 1,
	-- {kinetic,energy,blast,heat,cold,electricity,acid,stun,ls}
	resists = {15,15,15,15,15,15,15,15,15},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
  scale = 1.8,

	templates = {
		"object/swgemu/christmas/mobile/jawa_greenwhite.iff"},

    lootGroups = {
  		{
  			groups = {
  				{group = "robes_light", chance = 3500000},
  				{group = "power_crystals", chance = 3500000},
  				{group = "holocron_dark", chance = 250000},
  				{group = "named_crystals", chance = 250000},
  				{group = "clothing_attachments", chance = 2500000}
  			},
  				lootChance = 8500000
  			},
      {
        groups = {
  				{group = "robes_dark", chance = 3500000},
  				{group = "power_crystals", chance = 3500000},
  				{group = "named_crystals", chance = 250000},
  				{group = "holocron_light", chance = 250000},
  				{group = "clothing_attachments", chance = 2500000}
  			},
          lootChance = 8500000
          },
		{ -- Jedi Specific Loot Group
			groups =
			{
				{group = "jedi_clothing_attachments", chance = 4000000},
				{group = "named_crystals", chance = 6000000},
			},
			lootChance = 2000000,
		},
    { -- Veteran Rewards
      groups =
      {
        {group = "veteran_rewards_90_days", chance = 6000000},
        {group = "veteran_rewards_180_days", chance = 3000000},
        {group = "veteran_rewards_360_days", chance = 100000},
        {group = "veteran_rewards_450_days", chance = 900000},
      },
      lootChance = 3500000,
    },
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
  attacks = {
		{"intimidationattack","intimidationChance=80"},
    {"forcethrow2",""},
		{"knockdownfire",""},
		{"forceweaken2",""},
		{"forcechoke",""}
	}
}
CreatureTemplates:addCreatureTemplate(jawa_greenwhite, "jawa_greenwhite")
