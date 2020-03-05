require 'rails_helper'

RSpec.describe Url, type: :model do
  subject { 
    described_class.new(url: 'https://hola.com')  
  }

  describe 'A url' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a url' do
      subject.url = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with an invalid url' do
      subject.url = 'a'
      expect(subject).to_not be_valid
    end

    it 'has a slug before validation' do
      subject.valid?
      expect(subject.slug).to_not be_empty
    end

    it "doesn't modify the slug if it already exists" do
      subject.slug = 'slug'
      expect(subject).to be_valid
      expect(subject.slug).to eq('slug')
    end

    it 'is not valid if slug is too short' do
      subject.slug = 's'
      expect(subject).to_not be_valid
    end

    it 'has a valid short url' do
      subject.valid?
      expect(subject.short_url).to eq("#{ENV['ROOT_URL']}/#{subject.slug}")
    end
  end
end