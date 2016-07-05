# encoding: UTF-8
if Rails.env.development?
  hans = User.new(email: 'hans@vedaserve.de', name: 'Hans')
  hans.password     = 'hello'
  hans.confirmed_at = Time.now
  hans.save

  research = Research.new(title: 'My revenue projection')
  research.user_id = hans.id
  research.save

  # This should not be needed anymore, while there are topics and questions created with a research now
  #topic = research.topics.create(title: 'Revenue stream')
  #topic.questions.create(title: 'Sample question: How much should I charge for a cup of coffee')
end

# Initial configuration of sources
sources = {
  'WebSearch' => [
    { 'title' => 'Google', 'url' => 'http://www.google.de' },
    { 'title' => 'Bing',   'url' => 'http://www.bing.com'  }
  ],
  'DatabaseSearch' => [
    { 'title' => 'Genios', 'url' => 'https://www.genios.de' },
    { 'title' => 'OPAC',   'url' => 'http://www.OPAC.de'    }
  ],
  'Interview' => [
    { 'title' => 'XING',         'url' => 'https://www.xing.com'       },
    { 'title' => 'Facebook',     'url' => 'http://www.facebook.com'    },
    { 'title' => 'LinkedIn',     'url' => 'https://de.linkedin.com'    },
    { 'title' => 'Surveymonkey', 'url' => 'http://de.surveymonkey.com' }
  ]
}

sources.each do |source_type, sources_by_type|
  sources_by_type.each do |source|
    config = {
      'WebSearch'      => false,
      'DatabaseSearch' => false,
      'LibrarySearch'  => false,
      'Interview'      => false
    }.merge(source_type => true)

    Source.find_or_create_by_title(source.merge(config))
  end
end

# Initial configuration of helptexts
hints = [
  { 'tag'          => 'research_new',
    'note'         => 'Wird auf der Karte für eine neue Recherche angezeigt',
    'show_title'   => false,
    'show_disable' => false,
    'title'        => 'Neue Recherche',
    'text'         => 'Kurze Motivationsrede für eine Recherche'
  },
  { 'tag'          => 'describe_it_thoughts',
    'note'         => 'Einleitung, warum man die eigenen Gedanken sammeln soll',
    'show_title'   => true,
    'show_disable' => true,
    'title'        => 'Quellen',
    'text'         => 'Was weißt Du schon zu dieser Frage? Hintergrund: Manchmal hat man ja schon eine Ahnung und
                       will diese nur bestätigen. Die eigenen Gedanken vorher zu sammeln kann oft helfen.'
  },
  { 'tag'          => 'gather_it_sources',
    'note'         => 'Wird auf der Gather it Seite unten links angezeigt',
    'show_title'   => true,
    'show_disable' => true,
    'title'        => 'Quellen',
    'text'         => 'Eine Einleitung über den Umgang mit Quellen'
  },
  { 'tag'          => 'gather_it_data',
    'note'         => 'Wird auf der Gather it Seite unten recht angezeigt',
    'show_title'   => true,
    'show_disable' => true,
    'title'        => 'Daten sammeln',
    'text'         => 'Eine Einleitung über das Sammeln von Daten'
  },
]

hints.each do |hint|
  Hint.find_or_create_by_tag(hint)
end
