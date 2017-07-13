feature 'Select listing' do

  before(:each) do
    Listing.create(title: 'Nice room',
    location: 'London',
    beds: 3,
    price: '£200',
    max_guests: 3,
    )
  end

  scenario 'User can select a specific listing' do
    visit '/listings'
    fill_in 'location', with: 'London'
    # fill_in 'max_guests', with: 3
    click_button 'Search'
    expect(page).to have_content('Nice room')
    click_button 'Book me'
    visit '/search/chosen'
    expect(page).to have_content('Nice room')
  end
end
