class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts 'What do you want to do? list songs, exit?'
    input = gets.strip
    case input
    when 'list songs'
      Song.list_all
      which_song
    when 'list artists'
      Artist.list_all
      call
    when 'list artist'
      which_artist
    when 'list genres'
      Genre.list_all
      call
    when 'list genre'
      which_genre
    when 'play song'
      which_song
    when 'exit'
      puts 'goodbye'
    end
  end

  def which_song
    puts "Which song would you like to play?"
    song_number = gets.strip
    if song_number != 'exit'
      song_to_play = Song.all[song_number.to_i-1]
      puts "Playing #{song_to_play.full_name}"
      call
    end
  end

  def which_artist
    puts "Whos songs would you like to see?"
    artist_name = gets.chomp
    if artist_name != 'exit'
      found_artist = Artist.find_by_name(artist_name)
      found_artist.songs.each do | song |
        puts song.full_name
      end
      call
    end
  end

  def which_genre
    puts "Which genres songs would you like to seE?"
    genre_name = gets.chomp
    if genre_name != 'exit'
      found_genre = Genre.find_by_name(genre_name)
      found_genre.songs.each do | song |
        puts song.full_name
      end
      call
    end
  end

end
