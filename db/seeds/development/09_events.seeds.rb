events = [
  {id: 1,
   title: 'Signed autographs at California',
   body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
   celebrity: Celebrity.first,
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'event1.jpg')),
   event_services_attributes: [
    {
      service_id: 1
    },
    {
      service_id: 2
    },
    {
      service_id: 3
    }
   ]
  },
  {
   id: 2,
   title: 'Opening of local at New York',
   body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
   celebrity: Celebrity.second,
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'event2.jpeg')),
   event_services_attributes: [
    {
      service_id: 4
    },
    {
      service_id: 5
    },
    {
      service_id: 6
    }
   ]
  },
  {id: 3,
   title: 'Signed autographs en Texas',
   body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis nulla nec metus venenatis, pulvinar pharetra erat volutpat. Donec sapien lectus, molestie fringilla lorem vel, interdum pulvinar tortor. Pellentesque ullamcorper urna quis hendrerit convallis. Curabitur eu consequat mi. Quisque aliquam aliquam tortor in bibendum.',
   celebrity: Celebrity.third,
   photo: File.new(Rails.root.join('db', 'seeds/development/images', 'event3.jpeg')),
   event_services_attributes: [
    {
      service_id: 2
    },
    {
      service_id: 4
    },
    {
      service_id: 6
    }
   ]
  }]

Event.create!(events)
