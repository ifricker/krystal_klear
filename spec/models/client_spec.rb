require 'rails_helper'

describe Client do
let(:client) { Client.new(business_name: 'Company', contact_email: 'Company@email.com', contact_phone: '123-456-789', street_address: 'Company st.', neighborhood: 'Company neighborhood', zip_code: '0000') }

  it 'has a business name' do
    expect(client.business_name).to eq('Company')
  end

  it 'has a an contact email' do
    expect(client.contact_email).to eq('Company@email.com')
  end

  it 'has a contact phone' do
    expect(client.contact_phone).to eq('123-456-789')
  end

  it 'has a street address' do
    expect(client.street_address).to eq('Company st.')
  end

  it 'has a neighborhood' do
    expect(client.neighborhood).to eq('Company neighborhood')
  end

  it 'has a zip code' do
    expect(client.zip_code).to eq('0000')
  end
end
