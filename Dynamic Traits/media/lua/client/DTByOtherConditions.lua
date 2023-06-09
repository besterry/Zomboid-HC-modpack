require "TimedActions/ISBaseTimedAction"

-- DEXTROUS/ALL THUMBS AND ORGANIZED/DISORGANIZED TRAITS
function ISInventoryTransferAction:update()
    local player = self.character;
    if not player:HasTrait("Dextrous") or not player:HasTrait("Organized") then
        -- CHECK IF THE PLAYER IS OBESE OR VERY UNDERWEIGHT
        if player:HasTrait("Obese") or player:HasTrait("Very Underweight") or player:HasTrait("Emaciated") then
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.1;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.09;
                elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.08;
                else
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.07;
                end
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.1;
                elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.09;
                else
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.08;
                end
            end
        -- CHECK IF THE PLAYER IS OVERWEIGHT OR UNDERWEIGHT
        elseif player:HasTrait("Overweight") or player:HasTrait("Underweight") then
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.3;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.2;
                elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.1;
                else
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.09;
                end
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.3;
                elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.2;
                else
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.1;
                end
            end
        -- THE PLAYER DOESN'T HAVE WEIGHT PROBLEMS
        else
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.5;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.4;
                elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.3;
                else
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.2;
                end
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.5;
                elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.4;
                else
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.3;
                end
            end
        end
    end
    -- reopen the correct container
	if self.selectedContainer then
		if self.selectedContainer:getParent() then
			self.character:faceThisObject(self.selectedContainer:getParent())
		end
		if self.character:shouldBeTurning() then
			getPlayerLoot(self.character:getPlayerNum()):setForceSelectedContainer(self.selectedContainer)
		end
		getPlayerLoot(self.character:getPlayerNum()):selectButtonForContainer(self.selectedContainer)
	end
    --    if self.updateDestCont then
    --        self.destContainer:setSourceGrid(self.character:getCurrentSquare());
    --    end
    --
    --    if self.updateSrcCont then
    --        self.srcContainer:setSourceGrid(self.character:getCurrentSquare());
    --    end
	self.item:setJobDelta(self.action:getJobDelta());

    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function ISGrabItemAction:update()
    local player = self.character;
    if not player:HasTrait("Dextrous") or not player:HasTrait("Organized") then
        -- CHECK IF THE PLAYER IS OBESE OR VERY UNDERWEIGHT
        if player:HasTrait("Obese") or player:HasTrait("Very Underweight") or player:HasTrait("Emaciated") then
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.1;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.09;
                elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.08;
                else
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.07;
                end
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.1;
                elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.09;
                else
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.08;
                end
            end
        -- CHECK IF THE PLAYER IS OVERWEIGHT OR UNDERWEIGHT
        elseif player:HasTrait("Overweight") or player:HasTrait("Underweight") then
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.3;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.2;
                elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.1;
                else
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.09;
                end
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.3;
                elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.2;
                else
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.1;
                end
            end
        -- THE PLAYER DOESN'T HAVE WEIGHT PROBLEMS
        else
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.5;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.4;
                elseif player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" then
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.3;
                else
                    player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.2;
                end
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                if player:getDescriptor():getProfession() == "nurse" or player:getDescriptor():getProfession() == "doctor" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.5;
                elseif player:getDescriptor():getProfession() == "carpenter" or player:getDescriptor():getProfession() == "chef" or player:getDescriptor():getProfession() == "electrician" or player:getDescriptor():getProfession() == "engineer" or player:getDescriptor():getProfession() == "metalworker" or player:getDescriptor():getProfession() == "mechanics" then
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.4;
                else
                    player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.3;
                end
            end
        end
    end
    self.item:getItem():setJobDelta(self:getJobDelta());
end

function traitsByMovingObjects(player)
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE/GAIN THE TRAITS
    -- ALL THUMBS/DEXTROUS
    if player:getModData().DTatdTraits >= 0 and player:HasTrait("AllThumbs") then
        player:getTraits():remove("AllThumbs");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AllThumbs"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTatdTraits >= 200000 and not player:HasTrait("Dextrous") then
        player:getTraits():add("Dextrous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Dexterous"), true, HaloTextHelper.getColorGreen());
    -- ORGANIZED/DISORGANIZED
    elseif player:getModData().DTdoTraits >= 0 and player:HasTrait("Disorganized") then
        player:getTraits():remove("Disorganized");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Disorganized"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTdoTraits >= 300000 and not player:HasTrait("Organized") then
        player:getTraits():add("Organized");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Packmule"), true, HaloTextHelper.getColorGreen());
    end
end

-- OUTDOORSMAN TRAIT
function outdoorsmanTrait(player)
    local climateManager = getClimateManager();
    local rainIntensity = climateManager:getRainIntensity();
    local snowIntensity = climateManager:getSnowIntensity();
    local windIntensity = climateManager:getWindIntensity();
    local fogIntensity = climateManager:getFogIntensity();
    local isThunderstorming = climateManager:getIsThunderStorming();
    if player:isOutside() and player:getVehicle() == nil then -- THE PLAYER IS OUTSIDE AND NOT IN A VEHICLE SO IS GETTING THE OUTDOORSMAN TRAIT
        -- RAIN WEATHER
        if rainIntensity > 0.90 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 10;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 10;
            end
        elseif rainIntensity > 0.80 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 9;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 9;
            end
        elseif rainIntensity > 0.70 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 8;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 8;
            end
        elseif rainIntensity > 0.60 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 7;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 7;
            end
        elseif rainIntensity > 0.50 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 6;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 6;
            end
        elseif rainIntensity > 0.40 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 5;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 5;
            end
        elseif rainIntensity > 0.30 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 4;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 4;
            end
        elseif rainIntensity > 0.20 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 3;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 3;
            end
        elseif rainIntensity > 0.10 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 2;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 2;
            end
        elseif rainIntensity > 0 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
            if player:HasTrait("Pluviophile") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
            end
        end

        -- IS THUNDERSTORMING
        if isThunderstorming then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 10;
        end

        -- SNOW WEATHER
        if snowIntensity > 0.90 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 10;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 10;
            end
        elseif snowIntensity > 0.80 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 9;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 9;
            end
        elseif snowIntensity > 0.70 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 8;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 8;
            end
        elseif snowIntensity > 0.60 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 7;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 7;
            end
        elseif snowIntensity > 0.50 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 6;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 6;
            end
        elseif snowIntensity > 0.40 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 5;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 5;
            end
        elseif snowIntensity > 0.30 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 4;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 4;
            end
        elseif snowIntensity > 0.20 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 3;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 3;
            end
        elseif snowIntensity > 0.10 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 2;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 2;
            end
        elseif snowIntensity > 0 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
            end
        end

        -- WINDY WEATHER
        if windIntensity > 0.80 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 5;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 5;
            end
        elseif windIntensity > 0.60 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 4;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter +4;
            end
        elseif windIntensity > 0.40 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 3;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 3;
            end
        elseif windIntensity > 0.20 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 2;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 2;
            end
        elseif windIntensity > 0 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
            if player:HasTrait("Hiker") then
                player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
            end
        end

        -- FOG
        if fogIntensity > 0.80 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 5;
        elseif fogIntensity > 0.60 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 4;
        elseif fogIntensity > 0.40 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 3;
        elseif fogIntensity > 0.20 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 2;
        elseif fogIntensity > 0 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
        end

        if player:HasTrait("Formerscout") then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
        end

        -- EXTRA POINTS WHEN BEING OUTSIDE AND HAVING ONE OF THE NEXT PROFESSIONS
        if player:getDescriptor():getProfession() == "parkranger" then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 3;
        elseif player:getDescriptor():getProfession() == "farmer" or player:getDescriptor():getProfession() == "fisherman" then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 2;
        elseif player:getDescriptor():getProfession() == "lumberjack" then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 1;
        end
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO WIN OUTDOORSMAN
    if player:getModData().DTOutdoorsCounter >= 500000 then
        player:getTraits():add("Outdoorsman");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_outdoorsman"), true, HaloTextHelper.getColorGreen());
    end
end

-- CATS EYES TRAIT
function catsEyes(player)
    local gameTime = getGameTime();
    local currentHour = gameTime:getHour();
    if not player:isAsleep() then
        if currentHour == 22 or currentHour == 23 or currentHour == 4 or currentHour == 5 then
            if player:isOutside() then
                if player:getDescriptor():getProfession() == "securityguard" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 20;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 18.5;
                elseif player:getDescriptor():getProfession() == "fireofficer" or player:getDescriptor():getProfession() == "policeofficer" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 16.5;
                else
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 15;
                end
            else
                if player:getDescriptor():getProfession() == "securityguard" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 15;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 13.5;
                elseif player:getDescriptor():getProfession() == "fireofficer" or player:getDescriptor():getProfession() == "policeofficer" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 11.5;
                else
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 10;
                end
            end
        elseif currentHour == 0 or currentHour == 1 or currentHour == 2 or currentHour == 3 then
            if player:isOutside() then
                if player:getDescriptor():getProfession() == "securityguard" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 30;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 28.5;
                elseif player:getDescriptor():getProfession() == "fireofficer" or player:getDescriptor():getProfession() == "policeofficer" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 26.5;
                else
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 25;
                end
            else
                if player:getDescriptor():getProfession() == "securityguard" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 25;
                elseif player:getDescriptor():getProfession() == "burglar" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 23.5;
                elseif player:getDescriptor():getProfession() == "fireofficer" or player:getDescriptor():getProfession() == "policeofficer" then
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 21.5;
                else
                    player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 20;
                end
            end
        end
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO WIN CATS EYES
    if player:getModData().DTCatsEyesCounter >= 150000 then
        player:getTraits():add("NightVision");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NightVision"), true, HaloTextHelper.getColorGreen());
    end
end

-- RAIN TRAITS
function rainTraits(player)
    local climateManager = getClimateManager();
    local rainIntensity = climateManager:getRainIntensity();

    if player:isOutside() and player:getVehicle() == nil and rainIntensity > 0 then -- THE PLAYER NEEDS TO BE OUTSIDE, NOT IN A VEHICLE AND IT MUST BE RAINING
        
        -- Intensity 10
        if rainIntensity > 0.90 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.033, 3.33);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.033, 3.33);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2.8;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2.8;
            end
        -- Intensity 9    
        elseif rainIntensity > 0.80 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.031, 3.1);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.031, 3.1);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2.6;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2.6;
            end
        -- Intensity 8    
        elseif rainIntensity > 0.70 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.029, 2.9);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.029, 2.9);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2.4;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2.4;
            end
        -- Intensity 7    
        elseif rainIntensity > 0.60 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.027, 2.7);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.027, 2.7);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2.2;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2.2;
            end
        -- Intensity 6    
        elseif rainIntensity > 0.50 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.025, 2.5);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.025, 2.5);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 2;
            end
        -- Intensity 5    
        elseif rainIntensity > 0.40 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.019, 1.9);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.019, 1.9);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1.8;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1.8;
            end
        -- Intensity 4    
        elseif rainIntensity > 0.30 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.017, 1.7);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.017, 1.7);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1.6;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1.6;
            end
        -- Intensity 3    
        elseif rainIntensity > 0.20 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.015, 1.5);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.015, 1.5);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1.4;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1.4;
            end
        -- Intensity 2    
        elseif rainIntensity > 0.10 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.013, 1.3);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.013, 1.3);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1.2;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1.2;
            end
        -- Intensity 1
        elseif rainIntensity > 0 then
            if player:HasTrait("Pluviophile") then
                pluviophileTrait(player, 0.011, 1.11);
            elseif player:HasTrait("Pluviophobia") then
                pluviophobiaTrait(player, 0.011, 1.11);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 1;
            end
        end

        -- IF THE PLAYER HAVEN'T OBTAINED PLUVIOPHILE, THEN SOME EXTRA POINTS ARE ADDED IF "Outdoorsman", "Former Scout" AND/OR "Hiker" ARE PRESENT
        if not player:HasTrait("Pluviophile") then
            if player:HasTrait("Outdoorsman") then
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 3;
            end
            if player:HasTrait("Formerscout") then
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 3;
            end
            if player:HasTrait("Hiker") then
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 3;
            end
        end
    end

    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE/GAIN THE TRAITS
    if player:getModData().DTRainTraits >= 0 and player:HasTrait("Pluviophobia") then
        player:getTraits():remove("Pluviophobia");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pluviophobia"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTRainTraits >= 40000 and not player:HasTrait("Pluviophile") then
        player:getTraits():add("Pluviophile");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pluviophile"), true, HaloTextHelper.getColorGreen());
    end
end

function pluviophileTrait(player, stress, unhappyness)
    local wornItems = player:getWornItems();
    local wearingPoncho = false;
    local primaryItem = player:getPrimaryHandItem();
	local secondaryItem = player:getSecondaryHandItem();
	local umbrellaPrimary = primaryItem and primaryItem:isProtectFromRainWhileEquipped();
	local umbrellaSecondary = secondaryItem and secondaryItem:isProtectFromRainWhileEquipped();

    -- FIRST FOR
    for i = 0, wornItems:size() - 1 do
        local item = wornItems:get(i):getItem();
        if string.find(item:getClothingItemName(), "Poncho") then
            wearingPoncho = true;
        end
    end

    if umbrellaPrimary or umbrellaSecondary then
        if wearingPoncho == true then
            -- Very high protection.
        else
            -- High protection.
            DTdecreaseStress(player, stress / 3);
            DTdecreaseStressFromCigarettes(player, 1);
            DTdecreaseUnhappyness(player, unhappyness / 3);
        end
    else
        if wearingPoncho == true then
            -- Medium protection. 
            DTdecreaseStress(player, stress / 2);
            DTdecreaseStressFromCigarettes(player, 1);
            DTdecreaseUnhappyness(player, unhappyness / 2);
        else
            -- Low protection.
            DTdecreaseStress(player, stress);
            DTdecreaseStressFromCigarettes(player, 1);
            DTdecreaseUnhappyness(player, unhappyness);
        end
    end
end

function pluviophobiaTrait(player, stress, unhappyness)
    local wornItems = player:getWornItems();
    local wearingPoncho = false;
    local primaryItem = player:getPrimaryHandItem();
	local secondaryItem = player:getSecondaryHandItem();
	local umbrellaPrimary = primaryItem and primaryItem:isProtectFromRainWhileEquipped();
	local umbrellaSecondary = secondaryItem and secondaryItem:isProtectFromRainWhileEquipped();

    -- FIRST FOR
    for i = 0, wornItems:size() - 1 do
        local item = wornItems:get(i):getItem();
        if string.find(item:getClothingItemName(), "Poncho") then
            wearingPoncho = true;
        end
    end

    if umbrellaPrimary or umbrellaSecondary then
        if wearingPoncho == true then
            -- Very high protection.
        else
            -- High protection.
            DTincreaseStress(player, stress / 3);
            DTincreaseUnhappyness(player, unhappyness / 3);
        end
    else
        if wearingPoncho == true then
            -- Medium protection. 
            DTincreaseStress(player, stress / 2);
            DTincreaseUnhappyness(player, unhappyness / 2);
        else
            -- Low protection.
            DTincreaseStress(player, stress);
            DTincreaseUnhappyness(player, unhappyness);
        end
    end
end

-- CLAUSTROPHOBIC AND AGORAPHOBIC TRAITS
function agoraphobicClaustrophobicTraits(player)
    if player:isOutside() and player:HasTrait("Agoraphobic") then
        player:getModData().DTagoraClaustroCounter = player:getModData().DTagoraClaustroCounter + 1;
    elseif not player:isOutside() and player:HasTrait("Claustophobic") then
        player:getModData().DTagoraClaustroCounter = player:getModData().DTagoraClaustroCounter + 1;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO REMOVE CLAUSTROPHOBIC OR AGORAPHOBIC TRAITS
    if player:getModData().DTagoraClaustroCounter >= 175000 then
        if player:HasTrait("Agoraphobic") then
            player:getTraits():remove("Agoraphobic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_agoraphobic"), false, HaloTextHelper.getColorGreen());
        elseif player:HasTrait("Claustophobic") then
            player:getTraits():remove("Claustophobic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_claustro"), false, HaloTextHelper.getColorGreen());
        end
    end
end
function luckyUnluckyEffectsForAgoraClaustroTraits(player)
    if ZombRand(15) == 0 then
        player:getModData().DTagoraClaustroCounter = player:getModData().DTagoraClaustroCounter + DTluckyUnluckyModifier(player, 10);
    end
end

-- SMOKER TRAIT
function smokerTrait(player)
    local currentTimeSinceLastSmoke = player:getTimeSinceLastSmoke();
    if currentTimeSinceLastSmoke == 10 then
        player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + 1;
        if ZombRand(25) == 0 then
            player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + DTluckyUnluckyModifier(player, 7);
        end
    else
        player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke - 5;
        if ZombRand(25) == 0 then
            player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + DTluckyUnluckyModifier(player, 7);
        end
    end
    -- CHECK THE VALUE TO KEEP IT INTO THE LIMITS
    if player:getModData().DTdaysSinceLastSmoke < 0 then
        player:getModData().DTdaysSinceLastSmoke = 0;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE SMOKER
    if player:getModData().DTdaysSinceLastSmoke >= 1080 then
        player:setTimeSinceLastSmoke(0);
        player:getStats():setStressFromCigarettes(0);
        player:getTraits():remove("Smoker");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Smoker"), false, HaloTextHelper.getColorGreen());
    end
end

function smokerCough(player)
    local currentTimeSinceLastSmoke = player:getTimeSinceLastSmoke();
    local currentEndurance = player:getStats():getEndurance();
    if (currentEndurance < 0.5 or currentTimeSinceLastSmoke < 2) and ZombRand(10) == 0 then
        player:Say(getText("IGUI_PlayerText_Cough"));   
        player:playEmote("dtsmokercough");   
        addSound(player, player:getX(), player:getY(), player:getZ(), 10, 10);
    end
end

-- ALCOHOLIC TRAIT
function alcoholicTrait(player)
    local currentDrunkenness = player:getStats():getDrunkenness();
    -- Drunkenness is greater than 0 which means the player recently had a drink.
    if currentDrunkenness > 0 then
        player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink - 72;
        player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic + 72;
        if ZombRand(25) == 0 then
            player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink + DTluckyUnluckyModifier(player, 20);
            player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic + DTluckyUnluckyModifier(player, 12);
        end
    -- Drunkenness is equal to 0 which means the player recently haven't had a drink.
    else
        player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink + 1;
        player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic - 1;
        if ZombRand(25) == 0 then
            player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink + DTluckyUnluckyModifier(player, 7);
            player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic - DTluckyUnluckyModifier(player, 7);
        end
        -- If the player has the Alcoholic trait and haven't drinked for the latest 48 hours the effects starts.
        if player:HasTrait("Alcoholic") and player:getModData().DThoursSinceLastDrink >= 48 then
            -- STRESS
            DTincreaseStress(player, 0.15);
            -- UNHAPPYNESS
            DTincreaseUnhappyness(player, 7);
            -- FATIGUE
            DTincreaseFatigue(player, ZombRand(3), 0.05);
            -- HEADACHE
            DTapplyPain(player, ZombRand(5), "Head", ZombRand(75));
            -- POISON
            DTincreasePoison(player, ZombRand(7), ZombRand(40));
        end
    end
    -- CHECK BOTH VALUES TO KEEP THEM INTO THE LIMITS
    if player:getModData().DThoursSinceLastDrink > 720 then
        player:getModData().DThoursSinceLastDrink = 720;
    elseif player:getModData().DThoursSinceLastDrink < 0 then
        player:getModData().DThoursSinceLastDrink = 0;
    end
    if player:getModData().DTthresholdToObtainAlcoholic > 750 then
        player:getModData().DTthresholdToObtainAlcoholic = 750;
    elseif player:getModData().DTthresholdToObtainAlcoholic < 0 then
        player:getModData().DTthresholdToObtainAlcoholic = 0;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE/GAIN ALCOHOLIC
    if player:getModData().DThoursSinceLastDrink >= 720 and player:HasTrait("Alcoholic") then
        player:getTraits():remove("Alcoholic");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Alcoholic"), false, HaloTextHelper.getColorGreen());
        player:getModData().DTthresholdToObtainAlcoholic = 0;
    end
    if player:getModData().DTthresholdToObtainAlcoholic >= 750 and not player:HasTrait("Alcoholic") then
        player:getTraits():add("Alcoholic");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Alcoholic"), true, HaloTextHelper.getColorRed());
    end
end

-- ANOREXY TRAIT
function anorexyTrait(player)
    local currentWeight = player:getNutrition():getWeight();
    if currentWeight < 65 then
        -- Based on the Unhapyness the rate to obtain Anorexy is lower/higher.
        if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 1 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 2;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 2 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 3;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 3 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 4;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 4 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 5;
        else
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 1;
        end
        -- Based on the Stress the rate to obtain Anorexy is lower/higher.
        if player:getMoodles():getMoodleLevel(MoodleType.Stress) == 1 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 2;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Stress) == 2 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 3;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Stress) == 3 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 4;
        elseif player:getMoodles():getMoodleLevel(MoodleType.Stress) == 4 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 5;
        else
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 1;
        end
        -- Being Lucky or Unlucky may increase/decrease the counter to obtain/remove Anorexy.
        if ZombRand(10) == 0 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + DTluckyUnluckyModifier(player, 7);
        end
    else
        if currentWeight >= 65 and currentWeight < 75 then
            if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 0 and player:getMoodles():getMoodleLevel(MoodleType.Stress) == 0 then
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + 2;
            else
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + 1;
            end
        elseif currentWeight >= 75 then
            if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 0 and player:getMoodles():getMoodleLevel(MoodleType.Stress) == 0 then
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + 3;
            else
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + 2;
            end
        end
        -- Being Lucky or Unlucky may increase/decrease the counter to obtain/remove Anorexy.
        if ZombRand(10) == 0 then
            player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + DTluckyUnluckyModifier(player, 7);
        end
    end
    -- CHECK THE VALUE TO KEEP IT INTO THE LIMITS
    if player:getModData().DTthresholdToObtainLoseAnorexy < -1080 then
        player:getModData().DTthresholdToObtainLoseAnorexy = -1080;
    elseif player:getModData().DTthresholdToObtainLoseAnorexy > 1080 then
        player:getModData().DTthresholdToObtainLoseAnorexy = 1080;
    end 
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO OBTAIN OR REMOVE ANOREXY TRAIT
    if player:getModData().DTthresholdToObtainLoseAnorexy >= 720 and player:HasTrait("Anorexy") then
        player:getTraits():remove("Anorexy");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Anorexy"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTthresholdToObtainLoseAnorexy <= -720 and not player:HasTrait("Anorexy") then
        player:getTraits():add("Anorexy");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Anorexy"), true, HaloTextHelper.getColorRed());
    end
end

function anorexyTraitHungerSymptoms(player)
    if player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 1 then
        -- UNHAPPYNESS
        DTincreaseUnhappyness(player, 0.5);
        -- STRESS
        DTincreaseStress(player, 0.05);
        -- POISON
        DTincreasePoison(player, ZombRand(8), ZombRand(10));
    elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 2 then
        -- UNHAPPYNESS
        DTincreaseUnhappyness(player, 0.6);
        -- STRESS
        DTincreaseStress(player, 0.06);
        -- POISON
        DTincreasePoison(player, ZombRand(7), ZombRand(15));
    elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 3 then
        -- UNHAPPYNESS
        DTincreaseUnhappyness(player, 0.7);
        -- STRESS
        DTincreaseStress(player, 0.07);
        -- POISON
        DTincreasePoison(player, ZombRand(6), ZombRand(20));
    elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 4 then
        -- UNHAPPYNESS
        DTincreaseUnhappyness(player, 0.8);
        -- STRESS
        DTincreaseStress(player, 0.08);
        -- POISON
        DTincreasePoison(player, ZombRand(5), ZombRand(25));
    end
end

function anorexyTraitPassiveSymptoms(player)
    if not player:isAsleep() then
        -- FATIGUE
        DTincreaseFatigue(player, 0, 0.07);
        -- ENDURANCE
        DTdecreaseEndurance(player, 0, 0.07);
        local currentWeight = player:getNutrition():getWeight();
        -- IF ANOREXY AND MORE THAN 65KG's
        if currentWeight >= 65 then
            -- UNHAPPYNESS
            DTincreaseUnhappyness(player, 7);
            -- STRESS
            DTincreaseStress(player, 0.15);
        end
    end
end

-- PHYSICALLY ACTIVE AND SEDENTARY TRAITS
function activeSedentaryTraits(player)
    player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary - 0.5;
    if player:getModData().DTObtainLoseActiveSedentary < -70000 then
        player:getModData().DTObtainLoseActiveSedentary = -70000;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO OBTAIN/REMOVE THE TRAITS
    if player:getModData().DTObtainLoseActiveSedentary <= -20000 and not player:HasTrait("Sedentary") then
        player:getTraits():add("Sedentary");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Sedentary"), true, HaloTextHelper.getColorRed());
    elseif player:getModData().DTObtainLoseActiveSedentary > -20000 and player:getModData().DTObtainLoseActiveSedentary < 40000 and (player:HasTrait("PhysicallyActive") or player:HasTrait("Sedentary")) then
        if player:HasTrait("PhysicallyActive") then
            player:getTraits():remove("PhysicallyActive");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PhysicallyActive"), false, HaloTextHelper.getColorRed());
        elseif player:HasTrait("Sedentary") then
            player:getTraits():remove("Sedentary");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Sedentary"), false, HaloTextHelper.getColorGreen());
        end
    elseif player:getModData().DTObtainLoseActiveSedentary >= 40000 and not player:HasTrait("PhysicallyActive") then
        player:getTraits():add("PhysicallyActive");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PhysicallyActive"), true, HaloTextHelper.getColorGreen());
    end
end

-- NERVOUS WRECK AND MELANCHOLIC TRAITS
function ISTakePillAction:perform()
    local player = self.character;
    local pill = self.item;
    self.item:getContainer():setDrawDirty(true);
    self.item:setJobDelta(0.0);
	self.character:getBodyDamage():JustTookPill(self.item);
    -- ANTIDEPRESSANTS
    if pill:getType() == "PillsAntiDep" and player:getModData().DTisMelancholic == true then
        player:getModData().DTPillsAntiDep = player:getModData().DTPillsAntiDep - 24;
        if player:getModData().DTPillsAntiDep < 0 then
            player:getModData().DTPillsAntiDep = 0;
        end
        if player:getModData().DTPillsAntiDep <= 24 and player:HasTrait("Melancholic") then
            player:getTraits():remove("Melancholic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Melancholic"), false, HaloTextHelper.getColorGreen());
        end
    -- BETABLOCKERS
    elseif pill:getType() == "PillsBeta" and player:getModData().DTisNervousWreck == true then
        player:getModData().DTPillsBeta = player:getModData().DTPillsBeta - 24;
        if player:getModData().DTPillsBeta < 0 then
            player:getModData().DTPillsBeta = 0;
        end
        if player:getModData().DTPillsBeta <= 24 and player:HasTrait("NervousWreck") then
            player:getTraits():remove("NervousWreck");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NervousWreck"), false, HaloTextHelper.getColorGreen());
        end
    --elseif pill:getType() == "Pills" then
    end
    -- If too many pills are taken together an overdose can occur
    player:getModData().DTPillsOverdose = player:getModData().DTPillsOverdose + 8;
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function nervousWreckTrait(player)
    player:getModData().DTPillsBeta = player:getModData().DTPillsBeta + 1;
    if player:getModData().DTPillsBeta > 240 then
        player:getModData().DTPillsBeta = 240;
    end
    if player:getModData().DTPillsBeta > 24 and not player:HasTrait("NervousWreck") then
        player:getTraits():add("NervousWreck");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NervousWreck"), true, HaloTextHelper.getColorRed());
    end
    if player:HasTrait("NervousWreck") then
        DTincreaseStress(player, 0.1);
    end
end

function melancholicTrait(player)
    player:getModData().DTPillsAntiDep = player:getModData().DTPillsAntiDep + 1;
    if player:getModData().DTPillsAntiDep > 240 then
        player:getModData().DTPillsAntiDep = 240;
    end
    if player:getModData().DTPillsAntiDep > 24 and not player:HasTrait("Melancholic") then
        player:getTraits():add("Melancholic");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Melancholic"), true, HaloTextHelper.getColorRed());
    end
    if player:HasTrait("Melancholic") then
        DTincreaseUnhappyness(player, 3);
    end
end

function pillsOverdoseDecrease(player)
    player:getModData().DTPillsOverdose = player:getModData().DTPillsOverdose -1.6;
    if player:getModData().DTPillsOverdose < 0 then
        player:getModData().DTPillsOverdose = 0;
    end
end

function poisonByOverdose(player)
    if player:getModData().DTPillsOverdose > 40 then
        DTincreasePoison(player, ZombRand(7), ZombRand(player:getModData().DTPillsOverdose));
    end
end