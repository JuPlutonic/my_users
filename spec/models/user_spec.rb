require 'rails_helper'

RSpec.describe User, type: :model do
  # it 'validates presence of email' do
  #   user = User.new(name: 'Newby', email: 'mail@mail.com', password: '123456')
  #   expect(user).not_to be_valid
  #   user = User.new(name: 'Newby', email: 'mail@mail.com', password: '123456', avatar: [$filepath])
  #   expect(user).to be_valid
  # end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:avatar_file) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
