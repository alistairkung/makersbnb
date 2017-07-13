class Bnb < Sinatra::Base

  get '/listings' do
    @listings = Listing.all
    erb :'/listings/index'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    if current_user
      Listing.first_or_create(title: params[:title],
      location: params[:location],
      beds: params[:beds],
      price: params[:price],
      max_guests: params[:max_guests])
      redirect '/listings'
    else
      flash[:notice] = 'Sign in to create a listing'
      redirect '/listings'
    end
  end

  post '/search' do
    redirect "/search/#{params[:location]}"
  end

  get "/search/:location" do
    @listings = Listing.all(location: params[:location])
    erb :'listings/index'
  end

  # post '/search/chosen' do
  #   p params[:title]
  #   session[:title] = params[:title]
  #   p session[:title]
  #   # p Listing.first(title: params[:title])
  #   # session[:title] = Listing.first(title: params[:title])
  #   # p session[:title]
  #   # # session[:listing] = Listing.first(:id.gte => 1)
  #   # redirect "/search/#{params[:title]}"
  # end

  get "/search/individual_listing" do
    @listing = params[:id]
    erb :'listings/chosen'
  end
end
