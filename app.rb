require 'bundler'
Bundler.require

require 'sinatra/base'

class Music < Sinatra::Base

    def music_data(title, release_year, artist)
    {:title => title.to_s, :release_year => release_year.to_s, :artist => artist.to_s}.to_json
    end 

    get '/api/:name' do 
        cross_origin 
        @name = params[:name]
        get_music(@name)
    end 

    def get_music(music)
        case music 
        when 'oblivion'
          movie_data('Oblivion', '2012', 
            'Grimes')
        when 'boring-angel'
          movie_data('Boring Angel', '2013',
           "Oneohtrix Point Never") 
        when 'loud-places'
            movie_data('Loud Places', '2015',
           "Jamie XX") 
        else 
          'music not found'
        end 
    end 

end #end class 