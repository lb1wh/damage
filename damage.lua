-- Scanning for pattern: You ([\w\s]+) on (.*) and replacing
-- the first pattern group, e.g. "smash", with "smash(5)",
-- given that 5 is descriptive of smashing damage.

-- With all the elements being true, we can check if they
-- are defined, using t.elementname.
function setTrue(t)
    local result = {}
    for _, e in pairs(t) do
        result[e] = true
    end
    return result
end

-- Damage types, ascending. Min. damage is 1, max is 8.
local one = setTrue({
    "grazed", "prodded", "distressed",
    "brushed", "punished", "licked with flames", "cooled",
    "jolted", "swayed", "stung", "sprinkled",
    "bashed", "ruffled", "somewhat puzzled", "scorched with acid",
    "nick", "poke", "nudge", "nearly evaded",
    "nearly manages to evade"
})

local two = setTrue({
    "hit", "lacerated", "punctured", "somewhat harmed",
    "injured", "punished hard", "scorched", "chilled",
    "jolted badly", "shook", "tainted", "wet",
    "crushed", "pushed", "puzzled", "burned with acid",
    "prick", "prod", "slightly injure", "wound slightly",
    "scorches"
})

local three = setTrue({
    "hit hard", "cut", "punctured hard", "harmed",
    "injured seriously", "purged", "scorched badly",
    "chilled causing major shivering",
    "shocked", "shook seriously", "contaminated", "wet thoroughly",
    "crushed breaking bones", "buffeted", "baffled",
    "burned badly with acid",
    "cut deeply", "stab", "whack", "hit hard",
    "painfully hammer", "wound", "screams out loud as flames engulf"
})

local four = setTrue({
    "hit very hard", "sliced", "pierced", "harmed badly",
    "churned", "smote", "burned", "froze lightly",
    "shocked savagely", "pounded", "intoxicated", "splashed",
    "buried", "buffeted hard", "seriously baffled", "corroded",
    "shred", "stab deeply", "bash", "wound greatly",
    "looks overwhelmed with fear as the flames burn"
})

local five = setTrue({
    "smashed", "smashed with a bonecrushing sound", "slashed",
    "thrust into completely", "tortured", "butchered", "agonized",
    "burned horribly", "froze", "shocked completely",
    "pounded very hard", "corrupted", "splashed hard",
    "buried completely", "slammed", "bewildered", "disfigured",
    "painfully cleave", "perforate", "bash very hard",
    "mercilessly smash", "wound terribly",
    "eyes gleam with terror as your fireshield roasts"
})

local six = setTrue({
    "massacred", "tortured deviously", "butchered badly", "vanquished",
    "burned to a crisp", "froze badly", "stunned", "blasted violently",
    "poisoned", "soaked", "crushed into pieces", "slammed very hard",
    "stupified", "disfigured horribly", "run-through", "bludgeon",
    "awfully massacre", "totally massacre"
})

local seven = setTrue({
    "annihilated", "tormented", "pulverized", "exorcised",
    "incinerated", "froze horribly causing frostbite",
    "electrocuted", "blasted explosively", "injected turning blood to poison",
    "drenched", "bashed massively", "slammed massively",
    "mindfroze", "mutilated", "impale", "shattered",
    "annihilate with a god-like force", "totally annihilate",
    "awfully massacre to small fragments"
})

local eight = setTrue({
    "mortally wound", "impale horribly", "obliterated", "totally annihilate",
    "devastatingly decimate"
})

-- Remove trailing and leading whitespace from string.
function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- Regex captures the bit between 'You' and 'on', but we
-- only need the part leading up to the monster name.
-- You slashed Judy very hard on her x with your y.
-- You somewhat harmed Judy on her x with your y.
function extractDamage(s)
    local dmg = s:gsub("%f[%w]%u%l.+", "")
    return trim(dmg)
end

local firstMatch = extractDamage(matches[2])

local damageLevels = {
    one, two, three, four, five, six, seven, eight
}

for i, level in pairs(damageLevels) do
    if level[firstMatch] then
        -- Select the first instance of the match.
        selectString(firstMatch, 1)
        -- Replace it with its damage value.
        replace(firstMatch .. "(" .. i .. ")")
    end
end
