sites = [
  {id: 1,
   name: 'celebrity official',
   url: 'celebrity.com',
   phone: '12345678',
   facebook_url: 'facebook.com/celebrityofficial',
   twitter_url: 'twitter.com/celebrityofficial',
   banner_option: "featured_celebrities",
   who_we_are: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
   general_service: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
   header_info: 'Lorem ipsum',
   logo: File.new(Rails.root.join('db', 'seeds/development/images', 'logo.png')),
   terms_and_conditions: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
   admin: Admin.first,
   footer: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
   primary_color: "#5900D0",
   accent_color: "#FF003E",
   gradient_accent_color: "#F00000",
   footer_color: "#3A3A3A",
   site_categories_attributes: [
     {
       category_id: 1,
       show_in_footer: true
     },
     {
       category_id: 2,
       show_in_footer: true
     },
     {
       category_id: 3,
       show_in_footer: true
     }
   ]
   },
   {id: 2,
    name: 'sports celebrities',
    url: 'sportscelebrities.com',
    phone: '12345678',
    facebook_url: 'facebook.com/sportscelebrities',
    twitter_url: 'twitter.com/sportscelebrities',
    banner_option: "featured_celebrities",
    who_we_are: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    general_service: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    header_info: 'Lorem ipsum',
    logo: File.new(Rails.root.join('db', 'seeds/development/images', 'logo.png')),
    terms_and_conditions: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    admin: Admin.first,
    footer: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    primary_color: "#5900D0",
    accent_color: "#FF003E",
    gradient_accent_color: "#F00000",
    footer_color: "#3A3A3A",
    site_categories_attributes: [
      {
        category_id: 1,
        show_in_footer: true
      }
    ]
   },
   {id: 3,
    name: 'technology celebrities',
    url: 'technologycelebrities.com',
    phone: '12345678',
    facebook_url: 'facebook.com/technologycelebrities',
    twitter_url: 'twitter.com/technologycelebrities',
    banner_option: "featured_celebrities",
    who_we_are: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    general_service: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    header_info: 'Lorem ipsum',
    logo: File.new(Rails.root.join('db', 'seeds/development/images', 'logo.png')),
    terms_and_conditions: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    admin: Admin.last,
    footer: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    primary_color: "#5900D0",
    accent_color: "#FF003E",
    gradient_accent_color: "#F00000",
    footer_color: "#3A3A3A",
    site_categories_attributes: [
      {
        category_id: 4,
        show_in_footer: true
      }
    ]
   }]
Site.create!(sites)
Site.first.feature!

photographs = [
  {
    site: Site.first,
    photo: File.new(Rails.root.join('db', 'seeds/development/images', 'gallery1.jpeg')),
    section: "who_we_are",
    title: "Example of basketball"
  },
  {
    site: Site.first,
    photo: File.new(Rails.root.join('db', 'seeds/development/images', 'gallery2.jpeg')),
    section: "who_we_are",
    title: "Example of basketball"
  },
  {
    site: Site.first,
    photo: File.new(Rails.root.join('db', 'seeds/development/images', 'gallery3.jpg')),
    section: "who_we_are",
    title: "Example of baseball"
  },
  {
    site: Site.second,
    photo: File.new(Rails.root.join('db', 'seeds/development/images', 'gallery4.jpeg')),
    section: "who_we_are",
    title: "Example of baseball"
  },
  {
    site: Site.second,
    photo: File.new(Rails.root.join('db', 'seeds/development/images', 'gallery5.jpg')),
    section: "who_we_are",
    title: "Example of baseball"
  },
  {
    site: Site.second,
    photo: File.new(Rails.root.join('db', 'seeds/development/images', 'gallery6.jpg')),
    section: "who_we_are",
    title: "Example of sport"
  }

]
Photograph.create!(photographs)
