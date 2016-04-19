require 'rails_helper'

feature 'Admin creating, viewing, editing and deleting clients' do
  before(:each) do
    admin = User.create(name: "admin", email: "okay@ok.com", phone: "1234567890", admin: true, password: "123456")
    login_as(admin, :scope => :user)
  end


  scenario 'when admin clicks on new client' do
    visit '/clients'
    click_link "New Client"
    expect(page).to have_content('New Client')
  end

  scenario 'when admin clicks on show' do
    client = Client.create!(business_name: 'Company', contact_email: 'Company@email.com', contact_phone: '123-456-789', street_address: 'Company st.', neighborhood: 'Company neighborhood', zip_code: '0000')
    visit '/clients'
    first(:link, "Show").click
    expect(page).to have_content('Edit | Back')
  end

    scenario 'when admin clicks on edit' do
    client = Client.create!(business_name: 'Company', contact_email: 'Company@email.com', contact_phone: '123-456-789', street_address: 'Company st.', neighborhood: 'Company neighborhood', zip_code: '0000')
    visit '/clients'
    first(:link, "Edit").click
    expect(page).to have_content('Editing Client')
  end

  #  scenario 'when admin clicks on delete' do
  #   client = Client.create!(business_name: 'Company', contact_email: 'Company@email.com', contact_phone: '123-456-789', street_address: 'Company st.', neighborhood: 'Company neighborhood', zip_code: '0000')
  #   visit '/clients'
  #    click_link 'Delete'
  #    page.driver.browser.alert.accept
  #   expect(client).to eq(nil)
  # end
end
