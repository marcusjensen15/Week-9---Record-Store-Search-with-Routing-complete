require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('pry')
also_reload('lib/**/*.rb')

get('/test/') do
   @something = "this is a variable"
  erb(:whatever)
end

get('/') do
  @sort = Album.sort
  @albums = Album.all
  @sold = Album.sold_albums

  erb(:albums)
end

get('/albums') do
  if params['name']
    @album = Album.search(params[:name])
    erb(:album)
else
  @sort = Album.sort
  @albums = Album.all
  @sold = Album.sold_albums
  erb(:albums)
  end
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

##this is new




#this is new ^


get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

post('/albums') do
  name = params[:album_name]
  year = params[:year]
  artist = params[:artist]
  genre = params[:genre]
  album = Album.new(name, nil, year, genre, artist)
  album.save()
  @albums = Album.all()
  @sort = Album.sort
  @sold = Album.sold_albums

  erb(:albums)
end

patch('/update/:id')do
@album = Album.find(params[:id].to_i())
@album.sold

@albums = Album.all
@sort = Album.sort
@sold = Album.sold_albums

erb(:albums)
end

get('/update/:id')do


@albums = Album.all
@sort = Album.sort
@sold = Album.sold_albums

erb(:albums)
end


patch('/albums/:id') do

  # if params["sold"]
    # @album = Album.find(params[:id].to_i())
    # @album.sold
    # @albums = Album.all
    # @sort = Album.sort
    # @sold = Album.sold_albums


    # erb(:albums)



# else
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @album.sold

  @albums = Album.all
  @sort = Album.sort
  @sold = Album.sold_albums

  erb(:albums)
# end
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  @sort = Album.sort
  @sold = Album.sold_albums

  erb(:albums)
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end
