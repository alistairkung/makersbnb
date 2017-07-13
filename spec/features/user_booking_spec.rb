# feature "Booking" do
#   scenario "User can select a check-in date" do
#     sign_up(email: "johnsmith@aol.com", first_name: "John", last_name: "Smith", username: "jsmith", password: "password", password_confirmation: "password")
#     new_listing
#     fill_in 'location', with: 'London'
#     expect(page).to have_content('Check-in')
#   end
# end


# feature "Booking" do
#   scenario "User can select a check-out date" do
#     sign_up(email: "johnsmith@aol.com", first_name: "John", last_name: "Smith", username: "jsmith", password: "password", password_confirmation: "password")
#     new_listing
#     fill_in 'location', with: 'London'
#     expect(page).to have_content('Check-out')
#     expect(page).to have_button('Confirm Booking')
#   end
# end
