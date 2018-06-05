videos = [
	{name: 'Introduction video', url: 'https://www.youtube.com/watch?v=VFK1xOBzmZg', featured: true, celebrity: Celebrity.find(1)},
	{name: 'New video', url: 'https://www.youtube.com/watch?v=-hpgftDVxfY', featured: true, celebrity: Celebrity.find(1)},
	{name: 'Open video', url: 'https://www.youtube.com/watch?v=mnJjcG5LD-A', featured: true, celebrity: Celebrity.find(1)},
	{name: 'Trailer', url: 'https://www.youtube.com/watch?v=34YOFMsM7TE', featured: true, celebrity: Celebrity.find(2)},
	{name: 'Presentation', url: 'https://www.youtube.com/watch?v=ZjC903OGbt0', featured: true, celebrity: Celebrity.find(2)},
	{name: 'Resume', url: 'https://www.youtube.com/watch?v=j9u1Uj5CPmg', featured: true, celebrity: Celebrity.find(2)}
]

Video.create(videos)
