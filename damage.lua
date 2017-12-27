-- Mudlet trigger should be ([Yy]ou .* on .*) and its type "perl regexp".

-- Damage types. Min. damage is 1, max is 8.
-- The most specific expressions must appear before the
-- less specific ones. E.g. "hit very hard" should be defined before
-- "hit hard".
local damageClasses = {
    grazed = 1, prodded = 1, distressed = 1, brushed = 1,
    punished = 1, ["licked with flames"] = 1, cooled = 1,
    jolted = 1, swayed = 1, stung = 1, sprinkled = 1,
    bashed = 1, ruffled = 1, ["somewhat puzzled"] = 1,
    ["scorched with acid"] = 1, nick = 1, poke = 1,
    nudge = 1, ["nearly evaded"] = 1, ["nearly manages to evade"] = 1,
    ["hit .* very hard"] = 4,
    ["hit .* hard"] = 3,
    ["hit"] = 2, lacerated = 2, punctured = 2,
    ["somewhat harmed"] = 2, injured = 2, ["punished hard"] = 2,
    scorched = 2, chilled = 2, ["jolted badly"] = 2,
    shook = 2, tainted = 2, wet = 2, crushed = 2, pushed = 2,
    puzzled = 2, ["burned with acid"] = 2, prick = 2, prod = 2,
    ["slightly injure"] = 2, ["wound slightly"] = 2, scorches = 2,
    cut = 3, ["punctured .* hard"] = 3,
    harmed = 3, ["injured seriously"] = 3, purged = 3,
    ["scorched badly"] = 3, ["chilled causing major shivering"] = 3,
    shocked = 3, ["shook seriously"] = 3, contaminated = 3,
    ["wet thoroughly"] = 3, ["crushed breaking bones"] = 3,
    buffeted = 3, baffled = 3, ["burned badly with acid"] = 3,
    ["cut deeply"] = 3, stab = 3, whack = 3,
    ["painfully hammer"] = 3, wound = 3, ["screams out loud as flames engulf"] = 3,
    sliced = 4, pierced = 4,
    ["harmed badly"] = 4, churned = 4, smote = 4, burned = 4,
    ["froze lightly"] = 4, ["shocked savagely"] = 4, pounded = 4,
    intoxicated = 4, splashed = 4, buried = 4, ["buffeted hard"] = 4,
    ["seriously baffled"] = 4, corroded = 4, shred = 4, ["stab deeply"] = 4,
    bash = 4, ["wound greatly"] = 4,
    ["looks overwhelmed with fear as the flames burn"] = 4,
    smashed = 5, ["smashed .* with a bone crushing sound"] = 5,
    ["slashed .* very hard"] = 5, ["thrust into .* completely"] = 5,
    tortured = 5, butchered = 5, agonized = 5, ["burned horribly"] = 5,
    froze = 5, ["shocked completely"] = 5, ["pounded very hard"] = 5,
    corrupted = 5, ["splashed hard"] = 5, ["buried completely"] = 5,
    slammed = 5, bewildered = 5, disfigured = 5, ["painfully cleave"] = 5,
    perforate = 5, ["bash very hard"] = 5, ["mercilessly smash"] = 5,
    ["wound terribly"] = 5,
    ["eyes gleam with terror as your fireshield roasts"] = 5,
    massacred = 6, ["tortured deviously"] = 6, ["butchered badly"] = 6,
    vanquished = 6, ["burned to a crisp"] = 6, ["froze badly"] = 6,
    stunned = 6, ["blasted violently"] = 6, poisoned = 6, soaked = 6,
    ["crushed into pieces"] = 6, ["slammed very hard"] = 6, stupified = 6,
    ["disfigured horribly"] = 6, ["run-through"] = 6, bludgeon = 6,
    ["awfully massacre"] = 6, ["totally massacre"] = 6,
    annihilated = 7, tormented = 7, pulverized = 7, exorcised = 7,
    incinerated = 7, ["froze horribly causing frostbite"] = 7,
    electrocuted = 7, ["blasted explosively"] = 7,
    ["injected turning blood to poison"] = 7, drenched = 7,
    ["bashed massively"] = 7, ["slammed massively"] = 7,
    mindfroze = 7, mutilated = 7, impale = 7, shattered = 7,
    ["annihilate with a god-like force"] = 7, ["totally annihilate"] = 7,
    ["awfully massacre .* to small fragments"] = 7,
    ["mortally wound"] = 8, ["impale horribly"] = 8, obliterated = 8,
    ["totally annihilate"] = 8, ["devastatingly decimate"] = 8
}

function nominalColor(level)
    local color = {0, 0, 0} -- r, g, b

    if level == 1 then
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
    for damage, class in pairs(damageClasses) do
        if s:find(damage) then
            -- Color
            selectString(s, 1)
            rgb = nominalColor(class)
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
