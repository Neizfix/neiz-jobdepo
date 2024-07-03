-- Meslekli depo etkileşim işlevi
function OpenJobDepotMenu(job)
    local elements = {}

    for _, item in ipairs(Config[job .. 'Depot'].items) do
        table.insert(elements, {
            label = item.label,
            value = item.itemName
        })
    end

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'job_depot_menu', {
        title = Config[job .. 'Depot'].label,
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        local amount = tonumber(data.current.value)

        if amount and amount > 0 then
            TriggerServerEvent('depot:depositItem', job, data.current.value, amount)
        else
            QBCore.Functions.Notify('Geçersiz miktar girdiniz.', 'error')
        end
    end, function(data, menu)
        menu.close()
    end)
end

-- Meslek menüsü oluşturma
Citizen.CreateThread(function()
    for job, _ in pairs(Config.Jobs) do
        local jobLabel = Config.Jobs[job]
        local jobPermission = Config.JobPermissions[job]

        QBCore.UI.Menu.RegisterType('job_' .. job, function(data, callback)
            callback({ label = jobLabel, value = job })
        end, function(data, menu)
            menu.close()

            OpenJobDepotMenu(data.current.value)
        end)
    end
end)
