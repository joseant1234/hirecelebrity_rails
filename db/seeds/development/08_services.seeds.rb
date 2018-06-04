services = [
	{id: 1,
	 name: 'Corporate apperances',
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 photo: File.new(Rails.root.join('db', 'seeds/development/images', 'service1.jpg'))
	 },
	{id: 2,
	 name: 'VIP Meet & Greets',
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 photo: File.new(Rails.root.join('db', 'seeds/development/images', 'service2.jpg'))
	 },
	{id: 3,
	 name: 'Store grand openings',
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 photo: File.new(Rails.root.join('db', 'seeds/development/images', 'service3.jpg')),
	 },
	{id: 4,
	 name: 'Edorsements',
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 photo: File.new(Rails.root.join('db', 'seeds/development/images', 'service4.jpg'))
	 },
	{id: 5,
	 name: 'Speaking egagements',
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 photo: File.new(Rails.root.join('db', 'seeds/development/images', 'service5.jpg'))
	 },
	{id: 6,
	 name: 'Autograph signing',
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 photo: File.new(Rails.root.join('db', 'seeds/development/images', 'service6.jpg')),
	 },
	 {id: 7,
	 name: 'Other'
	 }]
Service.create!(services)

services_categories = [
	{service_id: 1, category_id: 1},
	{service_id: 1, category_id: 2},
	{service_id: 1, category_id: 3},
	{service_id: 2, category_id: 1},
	{service_id: 2, category_id: 2},
	{service_id: 2, category_id: 3},
	{service_id: 3, category_id: 1},
	{service_id: 3, category_id: 2},
	{service_id: 3, category_id: 3},
	{service_id: 4, category_id: 1},
	{service_id: 4, category_id: 2},
	{service_id: 4, category_id: 3},
	{service_id: 5, category_id: 1},
	{service_id: 5, category_id: 2},
	{service_id: 5, category_id: 4},
	{service_id: 6, category_id: 1},
	{service_id: 6, category_id: 2},
	{service_id: 6, category_id: 4}]
ServiceCategory.create!(services_categories)
