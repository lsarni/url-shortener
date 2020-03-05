module ShortenHelpers
  def submit_form(url)
    within("#shorten-form") do
      fill_in 'url_url', with: url
    end
    click_button 'Shorten'
  end
end

RSpec.configure do |config|
  config.include ShortenHelpers, type: :feature
end