class Album
  attr_reader :id, :name, :year, :artist, :genre

  @@albums = {}
  @@total_rows = 0
  @@sold_albums = {}

  def initialize(name, id, year, genre, artist)
    @name = name
    @id = id || @@total_rows += 1
    @year = year
    @genre = genre
    @artist = artist
    @sold = false
  end

  def self.all
    @@albums.values()
  end


  def self.sold_albums
    @@sold_albums.values()
  end


  def self.sort
    @@albums.values.sort_by { | val| val.name}

  end

  def sold

      @@sold_albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)


  
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
  end

  def ==(album_to_compare)
    self.name == album_to_compare.name()
  end


  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def update(name)
    @name = name
  end

  def self.find(id)
   @@albums[id]
 end

 def self.search(name)
   @@albums.each do |album|
     if album[1].name == name
      return album[1]
     else
       "There is no album with this name"
     end
   end
end

def delete
  @@albums.delete(self.id)
  end
end
