require 'bundler'
Bundler.require

require 'sinatra/base'

class Music < Sinatra::Base

    register Sinatra::CrossOrigin 

    def music_data(title, release_year, artist)
      {:title => title.to_s, :release_year => release_year.to_s, :artist => artist.to_s}.to_json
    end 

    get '/' do 
      'Welcome to the music API! To find a song type: /api/song-name' 
    end 

    get '/api/:name' do 
        cross_origin 
        @name = params[:name]
        get_music(@name)
    end 

    def get_music(music)
        case music 
        when 'oblivion'
          music_data('Oblivion', '2012', 
            'Grimes')
        when 'boring-angel'
          music_data('Boring Angel', '2013',
           "Oneohtrix Point Never") 
        when 'loud-places'
          music_data('Loud Places', '2015',
           "Jamie XX") 
        else 
          'music not found'
        end 
    end 

end #end class 