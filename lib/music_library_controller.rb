class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts 'What do you want to do? list songs, exit?'
    input = gets.strip
    case input
    when 'list songs'
      list_songs
      which_song
    when 'list artists'
      list_artists
      call
    when 'list genres'
      list_genres
      call
    when 'exit'
      puts 'goodbye'
    end
  end

  def which_song
    puts "Which song would you like to play?"
    song_number = gets.chomp
    song_to_play = Song.all[song_number.to_i]
    puts "Playing #{song_to_play.full_name}"
  end

  def list_songs
    Song.all.each_with_index do | song, i |
      puts "#{i+1}. #{song.full_name}"
    end
  end

  def list_artists
    Artist.all.each_with_index do | artist, i |
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.each_with_index do | genre, i |
      puts "#{i+1}. #{genre.name}"
    end
  end

end
