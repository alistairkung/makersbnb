feature 'listing management' do
  before(:each) do
    sign_up
    sign_in(email: "johnsmith@aol.com", password: "password")
    new_listing
    click_button 'Sign out'
    sign_up(email: "booker@book.com", username: "booker")
    sign_in(email: "booker@book.com", password: "password")
    go_to_booking
    request_booking
    click_button 'Sign out'
    sign_in(email: "johnsmith@aol.com", password: "password")
  end

  scenario 'User can see all active booking requests' do
    visit '/requests'
    expect(page).to have_content('batcave')
  end

  scenario 'User can confirm requests for listings' do
    visit '/requests'
    click_button 'confirm booking'
    user = User.first(email: "booker@book.com")
    booking = Booking.first(user_id: user.id)
    expect(current_path).to eq "/bookings/#{booking.id}"
  end

end
