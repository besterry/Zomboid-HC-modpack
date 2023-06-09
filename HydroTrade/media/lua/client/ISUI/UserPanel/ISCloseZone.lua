FDSE = FDSE or {}

-------------------------------------------------
--Зоны запрета создания приватов
-------------------------------------------------
-- townZones = {
--     { -- Луисвиль
--         x1 = 11700 / 100,    -- X минимальное
--         x2 = 14400 / 100,    -- X макс
--         y1 = 900 / 100,      -- Y мин
--         y2 = 3900 / 100      -- Y макс
--     },
--     { --Риверсайд
--         x1 = 5700/100,
--         x2 = 6800/100,
--         y1 = 5100/100,
--         y2 = 5600/100
--     },
--     { --Вест-поинт
--         x1 = 10800/100,
--         x2 = 12200/100,
--         y1 = 6600/100,
--         y2 = 7100/100
--     },
--     { --Малдро
--         x1 = 10500/100,
--         x2 = 11000/100,
--         y1 = 9200/100,
--         y2 = 10600/100
--     },
--     { --Марч-ридж
--         x1 = 9700/100,
--         x2 = 10500/100,
--         y1 = 12600/100,
--         y2 = 13100/100
--     },
--     { --Роузвуд
--         x1 = 7900/100,
--         x2 = 8400/100,
--         y1 = 11200/100,
--         y2 = 11800/100
--     },
--     { -- Doe Valley
--         x1 = 7000/100,
--         x2 = 7400/100,
--         y1 = 8100/100,
--         y2 = 8500/100
--     },
--     { -- Doe Valley (риверсайд)
--         x1 = 5200/100,
--         x2 = 5600/100,
--         y1 = 5800/100,
--         y2 = 6100/100
--     },
--     { -- Дикси
--         x1 = 5400/100,
--         x2 = 5700/100,
--         y1 = 9500/100,
--         y2 = 9700/100
--     },
--     { -- Военка
--         x1 = 5500/100,
--         x2 = 5900/100,
--         y1 = 12400/100,
--         y2 = 12500/100
--     },
--     { -- Тюрьма
--         x1 = 7500/100,
--         x2 = 7800/100,
--         y1 = 11700/100,
--         y2 = 12000/100
--     },
--     { -- Склады близ малдро
--         x1 = 9900/100,
--         x2 = 10200/100,
--         y1 = 10800/100,
--         y2 = 11200/100
--     },
--     { -- Склады близ малдро2
--         x1 = 10000/100,
--         x2 = 10500/100,
--         y1 = 9200/100,
--         y2 = 9700/100
--     },
--     { -- ЖД малдро
--         x1 = 11500/100,
--         x2 = 11900/100,
--         y1 = 9500/100,
--         y2 = 10200/100
--     },
--     { --поселок ниже малдро (большая дорога)
--         x1 = 11400/100,
--         x2 = 11800/100,
--         y1 = 8700/100,
--         y2 = 8900/100
--     },
--     { --заправка мадро-вестпоинт (большая дорога)
--         x1 = 11500/100,
--         x2 = 11700/100,
--         y1 = 8300/100,
--         y2 = 8900/100
--     },
--     { --Торгаш
--         x1 = 13500/100,
--         x2 = 14000/100,
--         y1 = 5600/100,
--         y2 = 5900/100
--     }
-- }
-------------------------------------------------
--Проверка пересечения местоположения игрока с списком запрещенных городов
-------------------------------------------------
-- function FDSE.checkTownZones(x, y)
--     for _, zone in ipairs(townZones) do
--         if x >= zone.x1 and x < zone.x2 and y >= zone.y1 and y < zone.y2 then
--             return true
--         end
--     end
--     return false
-- end

function FDSE.checkTownZones(x, y)
    local townZones = {}
    
    for _, zoneString in ipairs(sandboxZones) do
        local zoneValues = luautils.split(zoneString, "/")
        
        local zone = {
            x1 = tonumber(zoneValues[1]),
            x2 = tonumber(zoneValues[2]),
            y1 = tonumber(zoneValues[3]),
            y2 = tonumber(zoneValues[4])
        }
        
        table.insert(townZones, zone)
    end
    
    for _, zone in ipairs(townZones) do
        if x >= zone.x1 and x < zone.x2 and y >= zone.y1 and y < zone.y2 then
            return true
        end
    end
    
    return false
end