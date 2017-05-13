-- Damage types, ascending. Min. damage is 1, max is 8.
local one = {
    "grazed", "prodded", "distressed",
    "brushed", "punished", "licked with flames", "cooled",
    "jolted", "swayed", "stung", "sprinkled",
    "bashed", "ruffled", "somewhat puzzled", "scorched with acid",
    "nick", "poke", "nudge", "nearly evaded",
    "nearly manages to evade"
}

local two = {
    "hit", "lacerated", "punctured", "somewhat harmed",
    "injured", "punished hard", "scorched", "chilled",
    "jolted badly", "shook", "tainted", "wet",
    "crushed", "pushed", "puzzled", "burned with acid",
    "prick", "prod", "slightly injure", "wound slightly",
    "scorches"
}

local three = {
    "hit hard", "cut", "punctured hard", "harmed",
    "injured seriously", "purged", "scorched badly",
    "chilled causing major shivering",
    "shocked", "shook seriously", "contaminated", "wet thoroughly",
    "crushed breaking bones", "buffeted", "baffled",
    "burned badly with acid",
    "cut deeply", "stab", "whack", "hit hard",
    "painfully hammer", "wound", "screams out loud as flames engulf"
}

local four = {
    "hit very hard", "sliced", "pierced", "harmed badly",
    "churned", "smote", "burned", "froze lightly",
    "shocked savagely", "pounded", "intoxicated", "splashed",
    "buried", "buffeted hard", "seriously baffled", "corroded",
    "shred", "stab deeply", "bash", "wound greatly",
    "looks overwhelmed with fear as the flames burn"
}

local five = {
    "smashed", "(smashed) .* (with a bone crushing sound)",
    "(slashed) .* (very hard)",
    "(thrust into) .* (completely)", "tortured", "butchered", "agonized",
    "burned horribly", "froze", "shocked completely",
    "pounded very hard", "corrupted", "splashed hard",
    "buried completely", "slammed", "bewildered", "disfigured",
    "painfully cleave", "perforate", "bash very hard",
    "mercilessly smash", "wound terribly",
    "eyes gleam with terror as your fireshield roasts"
}

local six = {
    "massacred", "tortured deviously", "butchered badly", "vanquished",
    "burned to a crisp", "froze badly", "stunned", "blasted violently",
    "poisoned", "soaked", "crushed into pieces", "slammed very hard",
    "stupified", "disfigured horribly", "run-through", "bludgeon",
    "awfully massacre", "totally massacre"
}

local seven = {
    "annihilated", "tormented", "pulverized", "exorcised",
    "incinerated", "froze horribly causing frostbite",
    "electrocuted", "blasted explosively", "injected turning blood to poison",
    "drenched", "bashed massively", "slammed massively",
    "mindfroze", "mutilated", "impale", "shattered",
    "annihilate with a god-like force", "totally annihilate",
    "awfully massacre to small fragments"
}

local eight = {
    "mortally wound", "impale horribly", "obliterated", "totally annihilate",
    "devastatingly decimate"
}

local damageLevels = {
    one, two, three, four, five, six, seven, eight
}

function nominalColor(level)
    local color = {0, 0, 0} -- r, g, b
    if level >= 1 and level <= 2 then
        color = {79, 143, 77}  -- Green
    elseif level >= 3 and level <= 4 then
        color = {232, 232, 77} -- Yellow
    elseif level >= 5 and level <= 6 then
        color = {255, 139, 15} -- Orange
    elseif level >= 7 and level <= 8 then
        color = {255, 15, 15}  -- Red
    end
    return color
end

function extractDamage(s, damageLevels)
    -- Capture the part between "You" and "on"
    s = s:gsub("You (.*) on .*", "%1")

    local count = 0
    local result = nil

    -- O(n^2)
    for i, level in pairs(damageLevels) do
        for _, dmg in pairs(level) do
            if s:find(dmg) then
                -- Color
                selectString(s, 1)
                rgb = nominalColor(i)
                setFgColor(rgb[1], rgb[2], rgb[3])
                replace(s .. "(" .. i .. ")")
                resetFormat()
            end
        end
    end
end

capture = matches[1] -- You hit Orc warrior on his chest with your Ice Blade.
extractDamage(capture, damageLevels)
