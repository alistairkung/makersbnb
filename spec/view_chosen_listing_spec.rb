feature 'Select listing' do
  scenario 'User can select a specific listing' do
    visit '/listings'
    fill_in 'location', with: 'London'
    # fill_in 'max_guests', with: 3
    click_button 'Search'
    expect(page).to have_content('Nice room')
    click_button 'Book me'
    visit '/listings/chosen'
    expect(page).to have_content('Nice room')
  end
end
