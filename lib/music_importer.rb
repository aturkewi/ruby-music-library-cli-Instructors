class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[path+"/*"].collect do | file_path |
      file_path.split("/").last
    end
  end

  def import
    files.each { | file_name | Song.create_from_filename(file_name) }
  end

end
