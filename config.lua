Config = {}

-- Polis Depo Ayarları
Config.PoliceDepot = {
    label = 'Polis Depo',
    job = 'police',
    coords = vector3(450.0, -976.0, 30.7), -- Depo konumu
    items = {
        { itemName = 'pistol', label = 'Tabanca', maxQuantity = 10 },
        { itemName = 'ammo', label = 'Mermi', maxQuantity = 100 },
    }
}

-- Diğer meslekli depoları buraya ekleyebilirsiniz

-- Meslek isimleri ve araçları
Config.Jobs = {
    police = 'Polis',
    -- Diğer meslekler buraya eklenebilir
}

-- Meslek için gerekli yetki seviyeleri
Config.JobPermissions = {
    police = 3, -- Örnek: Polisler için yetki seviyesi 3
    -- Diğer meslekler için yetki seviyeleri buraya eklenebilir
}
