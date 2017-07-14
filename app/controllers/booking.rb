class Bnb < Sinatra::Base

  get '/bookings/bookingtrial' do
    erb :'bookings/bookingtrial'
  end

  get '/bookings/new/:listing_id' do
    @listing_id = params[:listing_id]
    erb :'bookings/booking'
  end

  post '/bookings' do
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @listing_id = params[:listing_id]
    p current_user
    booking = Booking.new
    p booking.date_validation(@start_date, @end_date, @listing_id)
    if booking.date_validation(@start_date, @end_date, @listing_id)
      Booking.create(user_id: current_user.id, start_date: @start_date, end_date: @end_date, listing_id: @listing_id)
      redirect ('/bookings/request')
    else
      flash.now[:errors] = ['Dates are unavailable']
      erb :'bookings/bookingtrial'
    end
  end

  get '/bookings/request' do
    erb :'bookings/request'
  end

  get "/bookings/:booking_id" do
    @booking_id = params[:booking_id]
    erb :'bookings/new'
  end

  post "/bookings/confirm/:booking_id" do
    booking = Booking.first(id: params[:booking_id])
    booking.update(:confirmation => true)
    erb :'/bookings/success'
  end

end
