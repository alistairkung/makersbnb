class Bnb < Sinatra::Base
  get '/requests' do
    @listings = Listing.all(user_id: current_user.id)

    @relevant_bookings = []

    @listings.each do |listing|
      @relevant_bookings << Booking.all(listing_id: listing.id)
    end

    erb :'/requests/manage'
  end
end
