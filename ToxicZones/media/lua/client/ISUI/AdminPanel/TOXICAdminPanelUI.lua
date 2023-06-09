require "ISUI/AdminPanel/ISAdminPanelUI"

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local vanilla_ISAdminPanelUI_create = ISAdminPanelUI.create
function ISAdminPanelUI:create()
    vanilla_ISAdminPanelUI_create(self)

    local btnWid = 150
    local btnHgt = math.max(25, FONT_HGT_SMALL + 3 * 2)
    local btnGapY = 5

    local last_btn = self.children[self.IDMax - 1]
    if last_btn.internal == "CANCEL" then
        last_btn = self.children[self.IDMax - 2]
    end
    local x = last_btn.x
    local y = last_btn.y + btnHgt + btnGapY

    if getAccessLevel() == "admin" then
        self.toxiczoneBtn = ISButton:new(x, y, btnWid, btnHgt, getText("IGUI_AdminPanel_ToxicZone"), self, ISAdminPanelUI.onToxicMouseDown);
        self.toxiczoneBtn.internal = "TOXICZONE";
        self.toxiczoneBtn:initialise();
        self.toxiczoneBtn:instantiate();
        self.toxiczoneBtn.borderColor = self.buttonBorderColor;
        self:addChild(self.toxiczoneBtn);
    	y = y + btnHgt + btnGapY
    end
end

function ISAdminPanelUI:onToxicMouseDown(button)
        if ToxicZonePanel.instance then
            ToxicZonePanel.instance:close()
        end
        local ui = ToxicZonePanel:new(50,50,600,600, getPlayer());
        ui:initialise();
        ui:addToUIManager();
end