require 'faye'

class PdfCreateHandler < Wurzelzwerg::Handler

  def process
    puts "Creating document #{message}"

    @document = Document.find_by_hashtag(message)

    cmd = "#{Rails.root}/vendor/gems/wurzelzwerg/script/create_pdf.sh /tmp/#{@document.title}.pdf"
    puts "opening process"
    IO.popen(cmd, 'w+') do |subprocess|
      subprocess.write(@document.to_tex)

      subprocess.close_write
      subprocess.read.split("\n").each do |l|
        puts "[parent] output #{l}"
      end
    end

    client = Faye::Client.new('http://localhost:3000/bayeux')
    client.publish("/pdf/#{@document.hashtag}", :message => 'bla')
  end

end
