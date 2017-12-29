
-- Mudlet trigger should be ([Yy]ou .* on .*) and its type "perl regexp".

-- Add items to our table such that we can iterate over them
-- in order.
function addNewItem(keyTable, myTable, key, value)
    table.insert(keyTable, key)
    myTable[key] = value
end

-- Maintain the order of our pairs.
local keyTable = {}

-- Damage text and damage class pairs.
local damageClasses = {}

-- Missed hits are 0, min. damage is 1 and max is 8.
-- The most specific expressions must appear before the
-- least specific ones. E.g. "hit very hard" should be defined before
-- "hit hard".
addNewItem(keyTable, damageClasses, "almost", 0)
addNewItem(keyTable, damageClasses, "grazed", 1)
addNewItem(keyTable, damageClasses, "prodded", 1)
addNewItem(keyTable, damageClasses, "distressed", 1)
addNewItem(keyTable, damageClasses, "brushed", 1)
addNewItem(keyTable, damageClasses, "punished .* hard", 2)
addNewItem(keyTable, damageClasses, "punished", 1)
addNewItem(keyTable, damageClasses, "licked .* with flames", 1)
addNewItem(keyTable, damageClasses, "cooled", 1)
addNewItem(keyTable, damageClasses, "jolted .* badly", 2)
addNewItem(keyTable, damageClasses, "jolted", 1)
addNewItem(keyTable, damageClasses, "swayed", 1)
addNewItem(keyTable, damageClasses, "stung", 1)
addNewItem(keyTable, damageClasses, "sprinkled", 1)
addNewItem(keyTable, damageClasses, "bashed .* massively", 7)
addNewItem(keyTable, damageClasses, "bash .* very hard", 5)
addNewItem(keyTable, damageClasses, "bashed", 1)
addNewItem(keyTable, damageClasses, "bash", 4)
addNewItem(keyTable, damageClasses, "ruffled", 1)
addNewItem(keyTable, damageClasses, "somewhat puzzled", 1)
addNewItem(keyTable, damageClasses, "puzzled", 2)
addNewItem(keyTable, damageClasses, "scorched .* with acid", 1)
addNewItem(keyTable, damageClasses, "scorched .*  badly", 3)
addNewItem(keyTable, damageClasses, "scorched", 2)
addNewItem(keyTable, damageClasses, "nick", 1)
addNewItem(keyTable, damageClasses, "poke", 1)
addNewItem(keyTable, damageClasses, "nudge", 1)
addNewItem(keyTable, damageClasses, "nearly evaded", 1)
addNewItem(keyTable, damageClasses, "nearly manages to evade", 1)
addNewItem(keyTable, damageClasses, "hit .* very hard",4)
addNewItem(keyTable, damageClasses, "hit .* hard", 3)
addNewItem(keyTable, damageClasses, "hit", 2)
addNewItem(keyTable, damageClasses, "lacerated", 2)
addNewItem(keyTable, damageClasses, "punctured", 2)
addNewItem(keyTable, damageClasses, "somewhat harmed", 2)
addNewItem(keyTable, damageClasses, "harmed .* badly", 4)
addNewItem(keyTable, damageClasses, "harmed", 3)
addNewItem(keyTable, damageClasses, "slightly injure", 2)
addNewItem(keyTable, damageClasses, "injured .* seriously", 3)
addNewItem(keyTable, damageClasses, "injured", 2)
addNewItem(keyTable, damageClasses, "chilled .* causing major shivering", 3)
addNewItem(keyTable, damageClasses, "chilled", 2)
addNewItem(keyTable, damageClasses, "shook .* seriously", 3)
addNewItem(keyTable, damageClasses, "shook", 2)
addNewItem(keyTable, damageClasses, "tainted", 2)
addNewItem(keyTable, damageClasses, "wet .* thoroughly", 3)
addNewItem(keyTable, damageClasses, "wet", 2)
addNewItem(keyTable, damageClasses, "crushed .* into pieces", 6)
addNewItem(keyTable, damageClasses, "crushed .* breaking bones", 3)
addNewItem(keyTable, damageClasses, "crushed", 2)
addNewItem(keyTable, damageClasses, "pushed", 2)
addNewItem(keyTable, damageClasses, "burned .* with acid", 2)
addNewItem(keyTable, damageClasses, "prick", 2)
addNewItem(keyTable, damageClasses, "prod", 2)
addNewItem(keyTable, damageClasses, "mortally wound", 8)
addNewItem(keyTable, damageClasses, "wound .* terribly", 5)
addNewItem(keyTable, damageClasses, "wound .* greatly", 4)
addNewItem(keyTable, damageClasses, "wound .* slightly", 2)
addNewItem(keyTable, damageClasses, "wound", 3)
addNewItem(keyTable, damageClasses, "scorched", 2)
addNewItem(keyTable, damageClasses, "cut .* deeply", 3)
addNewItem(keyTable, damageClasses, "cut", 3)
addNewItem(keyTable, damageClasses, "punctured .* hard", 3)
addNewItem(keyTable, damageClasses, "purged", 3)
addNewItem(keyTable, damageClasses, "shocked .* completely", 5)
addNewItem(keyTable, damageClasses, "shocked .* savagely", 4)
addNewItem(keyTable, damageClasses, "shocked", 3)
addNewItem(keyTable, damageClasses, "contaminated", 3)
addNewItem(keyTable, damageClasses, "buffeted", 3)
addNewItem(keyTable, damageClasses, "baffled", 3)
addNewItem(keyTable, damageClasses, "burned .* badly with acid", 3)
addNewItem(keyTable, damageClasses, "stab .* deeply", 4)
addNewItem(keyTable, damageClasses, "stab", 3)
addNewItem(keyTable, damageClasses, "whack", 3)
addNewItem(keyTable, damageClasses, "painfully hammer", 3)
addNewItem(keyTable, damageClasses, "screams out loud as flames engulf", 3)
addNewItem(keyTable, damageClasses, "sliced", 4)
addNewItem(keyTable, damageClasses, "pierced", 4)
addNewItem(keyTable, damageClasses, "churned", 4)
addNewItem(keyTable, damageClasses, "smote", 4)
addNewItem(keyTable, damageClasses, "burned .* horribly", 5)
addNewItem(keyTable, damageClasses, "burned .* to a crisp", 6)
addNewItem(keyTable, damageClasses, "burned", 4)
addNewItem(keyTable, damageClasses, "froze .* lightly", 4)
addNewItem(keyTable, damageClasses, "pounded", 4)
addNewItem(keyTable, damageClasses, "intoxicated", 4)
addNewItem(keyTable, damageClasses, "splashed", 4)
addNewItem(keyTable, damageClasses, "buried", 4)
addNewItem(keyTable, damageClasses, "buffeted .* hard", 4)
addNewItem(keyTable, damageClasses, "seriously baffled", 4)
addNewItem(keyTable, damageClasses, "corroded", 4)
addNewItem(keyTable, damageClasses, "shred", 4)
addNewItem(keyTable, damageClasses, "looks overwhelmed with fear as the flames burn", 4)
addNewItem(keyTable, damageClasses, "smashed .* with a bone crushing sound", 5)
addNewItem(keyTable, damageClasses, "mercilessly smash", 5)
addNewItem(keyTable, damageClasses, "smashed", 5)
addNewItem(keyTable, damageClasses, "slashed .* very hard", 5)
addNewItem(keyTable, damageClasses, "thrust into .* completely", 5)
addNewItem(keyTable, damageClasses, "tortured .* deviously", 6)
addNewItem(keyTable, damageClasses, "tortured", 5)
addNewItem(keyTable, damageClasses, "butchered", 5)
addNewItem(keyTable, damageClasses, "agonized", 5)
addNewItem(keyTable, damageClasses, "mindfroze", 7)
addNewItem(keyTable, damageClasses, "froze .* horribly causing frostbite", 7)
addNewItem(keyTable, damageClasses, "froze .* badly", 6)
addNewItem(keyTable, damageClasses, "froze", 5)
addNewItem(keyTable, damageClasses, "pounded .* very hard", 5)
addNewItem(keyTable, damageClasses, "corrupted", 5)
addNewItem(keyTable, damageClasses, "splashed .* hard", 5)
addNewItem(keyTable, damageClasses, "buried .* completely", 5)
addNewItem(keyTable, damageClasses, "slammed .* massively", 7)
addNewItem(keyTable, damageClasses, "slammed .* very hard", 6)
addNewItem(keyTable, damageClasses, "slammed", 5)
addNewItem(keyTable, damageClasses, "bewildered", 5)
addNewItem(keyTable, damageClasses, "disfigured", 5)
addNewItem(keyTable, damageClasses, "painfully cleave", 5)
addNewItem(keyTable, damageClasses, "perforate", 5)
addNewItem(keyTable, damageClasses, "eyes gleam with terror as your fireshield roasts", 5)
addNewItem(keyTable, damageClasses, "awfully massacre .* to small fragments", 7)
addNewItem(keyTable, damageClasses, "awfully massacre", 6)
addNewItem(keyTable, damageClasses, "totally massacre", 6)
addNewItem(keyTable, damageClasses, "massacred", 6)
addNewItem(keyTable, damageClasses, "butchered .* badly", 6)
addNewItem(keyTable, damageClasses, "vanquished", 6)
addNewItem(keyTable, damageClasses, "stunned", 6)
addNewItem(keyTable, damageClasses, "blasted .* violently", 6)
addNewItem(keyTable, damageClasses, "poisoned", 6)
addNewItem(keyTable, damageClasses, "soaked", 6)
addNewItem(keyTable, damageClasses, "stupified", 6)
addNewItem(keyTable, damageClasses, "disfigured .* horribly", 6)
addNewItem(keyTable, damageClasses, "run-through", 6)
addNewItem(keyTable, damageClasses, "bludgeon", 6)
addNewItem(keyTable, damageClasses, "totally annihilate", 8)
addNewItem(keyTable, damageClasses, "annihilate .* with a god-like force", 7)
addNewItem(keyTable, damageClasses, "totally annihilate", 7)
addNewItem(keyTable, damageClasses, "annihilated", 7)
addNewItem(keyTable, damageClasses, "tormented", 7)
addNewItem(keyTable, damageClasses, "pulverized", 7)
addNewItem(keyTable, damageClasses, "exorcised", 7)
addNewItem(keyTable, damageClasses, "incinerated", 7)
addNewItem(keyTable, damageClasses, "electrocuted", 7)
addNewItem(keyTable, damageClasses, "blasted .* explosively", 7)
addNewItem(keyTable, damageClasses, "injected .* turning blood to poison", 7)
addNewItem(keyTable, damageClasses, "drenched", 7)
addNewItem(keyTable, damageClasses, "mutilated", 7)
addNewItem(keyTable, damageClasses, "impale .* horribly", 8)
addNewItem(keyTable, damageClasses, "impale", 7)
addNewItem(keyTable, damageClasses, "shattered", 7)
addNewItem(keyTable, damageClasses, "obliterated", 8)
addNewItem(keyTable, damageClasses, "devastatingly decimate", 8)

function nominalColor(level)
    local color = {0, 0, 0} -- r, g, b

    if level == 0 then
        color = {161, 161, 161} -- Light gray
    elseif level == 1 then
        color = {51, 204, 51} --  Light green
    elseif level == 2 then
        color = {0, 153, 51} -- Dark green
    elseif level == 3 then
        color = {255, 255, 153} -- Light yellow
    elseif level == 4 then
        color = {255, 255, 0} -- Dark yellow
    elseif level == 5 then
        color = {255, 204, 0} -- Light orange
    elseif level == 6 then
        color = {255, 153, 0} -- Dark orange
    elseif level == 7 then
        color = {255, 80, 80} -- Light red
    elseif level == 8 then
        color = {255, 0, 0} -- Dark red
    end

    return color
end

function extractDamage(s, damageClasses)
    -- Capture the part between "You" and "on"
    s = s:gsub("[Yy]ou (.*) on .*", "%1")

    local count = 0
    local result = nil
    local earlyReturn = false

    -- O(n^2)
    --for damage, class in pairs(damageClasses) do
    for _, damage in ipairs(keyTable) do
        class = damageClasses[damage]
        if s:find(damage) then
            echo("*" .. damage .. "=" .. class .. "* ")
            -- Color
            selectString(s, 1)
            rgb = nominalColor(class)
            echo("color=" .. rgb[1] .. "," .. rgb[2] .. "," .. rgb[3])
            setFgColor(rgb[1], rgb[2], rgb[3])
            replace(s .. "(" .. class .. ")")
            resetFormat()
            earlyReturn = true
            break
        end

        -- Stop searching once we've found our damage type.
        if earlyReturn then
            break
        end
    end
end

capture = matches[1] -- You hit Orc warrior on his chest with your Ice Blade.
extractDamage(capture, damageClasses)
