local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('depot:depositItem')
AddEventHandler('depot:depositItem', function(job, item, amount)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)

    -- Yetki kontrolü
    if xPlayer ~= nil and xPlayer.PlayerData.job.name == job and xPlayer.PlayerData.job.grade >= Config.JobPermissions[job] then
        local itemInfo = Config[job .. 'Depot'].items[item]

        if itemInfo then
            if amount > 0 then
                -- Eşya ekleme işlemi
                xPlayer.Functions.AddItem(item, amount)
                -- Loglama (isteğe bağlı olarak)
                print(('Depo: %s deposuna %sx %s ekledi'):format(Config[job .. 'Depot'].label, amount, itemInfo.label))
            else
                print(('Geçersiz miktar (%s)'):format(amount))
            end
        else
            print(('Geçersiz eşya (%s)'):format(item))
        end
    else
        print(('Yetkisiz erişim - Meslek: %s, İsim: %s, Yetki Seviyesi: %s'):format(job, xPlayer.PlayerData.job.label, xPlayer.PlayerData.job.grade))
    end
end)
