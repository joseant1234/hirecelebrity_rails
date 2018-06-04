celebrities = [
  {id: 1,
   name: 'Cristiano',
   last_name: 'Ronaldo',
   mini_description:  'Lorem ipsum dolor sit amet',
   biography:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
   disclaimer: 'Lorem ipsum dolor sit amet, consecteutr adidpcikod elit, sed do eituiodas',
   popular: false,
   featured: true,
   state_id: 1,
   organization: Organization.second,
   fee_range: Celebrity::FEE_RANGES[1],
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'ronaldo.jpg')),
   celebrity_categories_attributes: [
    {
      category_id: 1
    }
   ]
  },
  {id: 2,
   name: 'Lionel',
   last_name: 'Messi',
   mini_description:  'Lorem ipsum dolor sit amet',
   biography:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
   disclaimer: 'Lorem ipsum dolor sit amet, consecteutr adidpcikod elit, sed do eituiodas',
   popular: true,
   featured: true,
   state_id: 2,
   organization: Organization.first,
   fee_range: Celebrity::FEE_RANGES[2],
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'messi.jpg')),
   celebrity_categories_attributes: [
    {
      category_id: 1
    }
   ]
  },
  {id: 3,
   name: 'Jim',
   last_name: 'Carrey',
   mini_description:  'Lorem ipsum dolor sit amet',
   biography:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
   disclaimer: 'Lorem ipsum dolor sit amet, consecteutr adidpcikod elit, sed do eituiodas',
   popular: true,
   featured: true,
   state_id: 3,
   organization: Organization.third,
   fee_range: Celebrity::FEE_RANGES[3],
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'jim.jpeg')),
   celebrity_categories_attributes: [
    {
      category_id: 3
    }
   ]
  }
]

Celebrity.create!(celebrities)
