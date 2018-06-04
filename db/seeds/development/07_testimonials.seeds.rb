testimonials = [
	{id: 1,
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 resource: Client.first
	 },
	 {id: 2,
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 resource:  Celebrity.first
	 },
	 {id: 3,
	 description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
	 featured: true,
	 resource: Celebrity.second
	 }]


Testimonial.create(testimonials)
