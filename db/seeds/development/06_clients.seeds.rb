clients = [
  {id: 1,
   name: 'Adidas',
   featured: true,
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'adidas.png')),
   client_categories_attributes: [
    {
      category_id: 1
    },
    {
      category_id: 2
    },
    {
      category_id: 3
    }
   ]
  },
  {id: 2,
   name: 'Aeropostale',
   featured: true,
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'aeropostale.png')),
   client_categories_attributes: [
    {
      category_id: 1
    },
    {
      category_id: 2
    },
    {
      category_id: 4
    }
   ]
  },
  {id: 3,
   name: 'Bose',
   featured: true,
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'bose.png')),
   client_categories_attributes: [
    {
      category_id: 1
    },
    {
      category_id: 2
    },
    {
      category_id: 3
    }
   ]
  },
  {id: 4,
   name: 'Diesel',
   featured: false,
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'diesel.png')),
   client_categories_attributes: [
    {
      category_id: 3
    }
   ]
  }
]

Client.create!(clients)
