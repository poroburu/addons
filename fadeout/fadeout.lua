--[[
* Fadeout - Copyright (c) 2023 Poroburu [poroburu@gmail.com]
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to
* Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
*
* By using Fadeout, you agree to the above license and its terms.
*
*      Attribution - You must give appropriate credit, provide a link to the license and indicate if changes were
*                    made. You must do so in any reasonable manner, but not in any way that suggests the licensor
*                    endorses you or your use.
*
*   Non-Commercial - You may not use the material (Fadeout) for commercial purposes.
*
*   No-Derivatives - If you remix, transform, or build upon the material (Fadeout), you may not distribute the
*                    modified material. You are, however, allowed to submit the modified works back to the original
*                    Fadeout project in attempt to have it added to the original project.
*
* You may not apply legal terms or technological measures that legally restrict others
* from doing anything the license permits.
*
* No warranties are given.
]]--



addon.author = 'Poroburu';
addon.name = 'Fadeout';
addon.version = '1.2.0';
addon.desc = 'Sozu/LoO timer PH ToD Proof of Concept'
addon.link= 'https://github.com/poroburu/addons/tree/master/fadeout'

require 'common'

-- Configurations
----------------------------------------------------------------------------------------------------
local default_config =
{
    color           = 039,
    format          = '%H:%M:%S',
    open_bracket    = '[',
    close_bracket   = ']'
};
local configs = default_config;
local timestamp = os.date(string.format('\31%c[%s]\30\01 ', configs.color, configs.format), os.time());
---------------------------------------------------------------------------------------------------



ashita.events.register('packet_in', 'packet_in_cb', function(e)
    
    if (e.id == 0x38) then
        local target = struct.unpack('H', e.data,0x10 + 1);
        local party     = AshitaCore:GetDataManager():GetParty();
        local ZoneName	= AshitaCore:GetResourceManager():GetString('areas', party:GetMemberZone(0));
        
            --print(target)
            --print(ZoneName)
        if ((target == 267 or target == 271) and ZoneName == 'Temple of Uggalepih') or ((target == 66) and ZoneName == 'Labyrinth of Onzozo') then
            local entity = GetEntity(target);
            local name = entity.Name
            local delay = 60 * 16 + 2
            local reps = 1
            print(timestamp .. name .. ' respawn')
            ashita.timer.create(delay-600, delay-600, reps, 
            function()
                print(timestamp .. '10 minutes')
            end)    
            ashita.timer.create(delay-60 * 5, delay-60 * 5, reps, 
            function()
                print(timestamp .. '5 minutes')
            end)    
            ashita.timer.create(delay-60 * 4, delay-60 * 4, reps, 
            function()
                print(timestamp .. '4 minutes')
            end)    
            ashita.timer.create(delay-60 * 3, delay-60 * 3, reps, 
            function()
                print(timestamp .. '3 minutes')
            end)    
            ashita.timer.create(delay-60 * 2, delay-60 * 2, reps, 
            function()
                print(timestamp .. '2 minutes')
            end)    
            ashita.timer.create(delay-60 * 1, delay-60 * 1, reps, 
            function()
                print(timestamp .. '1 minutes')
            end)
            ashita.timer.create(delay-45, delay-45, reps, 
            function()
                print(timestamp .. '45 seconds')
            end)    
            ashita.timer.create(delay-30, delay-30, reps, 
            function()
                print(timestamp .. '30 seconds')
            end)    
            ashita.timer.create(delay-15, delay-15, reps, 
            function()
                print(timestamp .. '15 seconds')
            end)
            ashita.timer.create(delay-10, delay-10, reps, 
            function()
                print(timestamp .. '10 seconds')
            end)    
            ashita.timer.create(delay-5, delay-5, reps, 
            function()
                print(timestamp .. '5 seconds')
            end)
            ashita.timer.create(delay, delay, reps, 
            function()
                print(timestamp .. 'Pop')
            end)    
        end
    end    
    return false;
end);
