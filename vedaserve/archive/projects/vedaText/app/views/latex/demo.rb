#!/usr/bin/env ruby
# encoding: utf-8
require 'erb'

# Address data from fakenamegenerator.com
sender_name = 'Tobias Berg'
sender_address = 'Schaarsteinweg 12\\\92409 Schwandorf'
title = ''
recipient = 'Brigitte Ebersbacher\\\Schönhauser Allee 9\\\79856 Hinterzarten'
opening = 'Liebe Brigitte'
content = 'Mit VedaText kann ich schöne Briefe schreiben.'
closing = 'Alles Liebe,\\\Dein Tobi'

template = ERB.new(File.read(File.expand_path('../letter.tex.erb', __FILE__)))
puts template.result(binding)
