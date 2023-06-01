# spec/models/author_spec.rb
require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'associations' do
    it { should have_many(:books) }
  end

  describe 'devise modules' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
  end
end
