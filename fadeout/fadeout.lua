_addon.author = 'Poroburu';
_addon.name = 'Fadeout';
_addon.version = '1.0';

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
local timestamp = os.date(string.format('\31\%c[%s]\30\01 ', configs.color, configs.format), os.time());
---------------------------------------------------------------------------------------------------
-- func: command
-- desc: Event called when a command was entered.
---------------------------------------------------------------------------------------------------
ashita.register_event('command', function(command, ntype)
    -- Get the command arguments..
    local args = command:args();
    if (args[1] ~= '/fadeout') then
        return false;
    end

    -- Print test message
    if (#args == 1) then
        print('Hello');
        local party     = AshitaCore:GetDataManager():GetParty();
        local ZoneName	= AshitaCore:GetResourceManager():GetString('areas', party:GetMemberZone(0));
        print(ZoneName)
        local timestamp = os.date(string.format('\31\%c[%s]\30\01 ', configs.color, configs.format));
        print(timestamp)
        return true;
    end
    -- Prints the addon help..
    print_help('/sexchange', {
        { '/sexchange',                 '- Toggles SexChange on and off.' },
        { '/sexchange on',              '- Turns SexChange on.' },
        { '/sexchange off',             '- Turns SexChange off.' },
        { '/sexchange race [raceid]',   '- Sets the race type to apply to the player.' },
        { '/sexchange hair [hairid]',   '- Sets the hair type to apply to the player.' },
    });
    return true;
end);

ashita.register_event('incoming_packet', function(id, size, packet, packet_modified, blocked)
    
    if (id == 0x38) then
        local target = struct.unpack('H', packet,0x10 + 1);
        local party     = AshitaCore:GetDataManager():GetParty();
        local ZoneName	= AshitaCore:GetResourceManager():GetString('areas', party:GetMemberZone(0));
        
        if ((target == 267 or target == 271) and ZoneName == 'Temple of Uggalepih') then
            --print(target)
            --print(ZoneName)
            local entity = GetEntity(target);
            local name = entity.Name
            local delay = 60 * 16 + 2
            local reps = 1
            timestamp = os.date(string.format('\31\%c[%s]\30\01 ', configs.color, configs.format), os.time() + delay);
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

