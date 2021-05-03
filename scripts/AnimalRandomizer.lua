include "scenario/scripts/entity.lua"
include "scenario/scripts/token.lua"
include "scenario/scripts/ui.lua"
include "scenario/scripts/misc.lua"

function randomizeSpecies(args)
    local gameMgr = queryObject("BFGManager")
    if gameMgr ~= nil then
        local animalList = findType("animal")
        if animalList ~= nil and type(animalList) == "table" then
            local numAnimal = table.getn(animalList)
            for i = 1, numAnimal, 1 do
                local animal = resolveTable(animalList[i].value)
                if animal ~= nil then
                    local name = animal:BFG_GET_ATTR_STRING("s_name")

                    if (name == "random") or (name == "keeprolling") then
                        local isAdult = animal:BFG_GET_ATTR_BOOLEAN("b_Adult")
                        local isMale = animal:BFG_GET_ATTR_BOOLEAN("b_Male")
                        local randomAnimalType = getRandomAnimalType()
                        local species = getSpeciesFromType(randomAnimalType)

                        local age = "Young"
                        if (isAdult == true) then
                            age = "Adult"
                        end

                        local gender = "F"
                        if (isAdult == true) then
                            gender = "M"
                        end

                        if (name == "random") then
                            animal:BFG_SET_ATTR_STRING("s_name", species .. " the random animal")
                        end
                        
                        local female = animal:BFG_ENTITY_MORPH_TO_NEW_ENTITY(species .. "_" .. age .. "_" .. gender, false, 0, false, 1)
                    end
                end
            end
        end
    end
end