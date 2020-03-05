feature "Shorten url" do

  scenario "Shorten valid url", js: true do
    url = 'https://gapfish.com/home/'

    visit '/'
    submit_form(url)

    expect(page).to have_field('url_url', with: '')

    expect(page).to have_selector '#generated-url'
    expect(page).to have_text 'Old url'
    expect(page).to have_text 'New url'
    expect(page).to have_text url
  end

  scenario "Empty url", js: true do
    visit '/'
    click_button 'Shorten'

    expect(page).to have_selector '.notice'
    expect(page).to have_text 'Url is invalid'
    expect(page).to have_text "Url can't be blank"
  end

  scenario "Invalid url", js: true do
    url = 'invalid'

    visit '/'
    submit_form(url)

    expect(page).to have_field('url_url', with: url)

    expect(page).to have_selector '.notice'
    expect(page).to have_text 'Url is invalid'
  end

  scenario "Clear previous errors", js: true do
    url = 'invalid'

    visit '/'
    submit_form(url)

    expect(page).to have_selector '.notice'
    
    url = 'https://gapfish.com/home/'

    submit_form(url)

    expect(page).to have_selector '#generated-url'
    expect(page).to have_no_selector '.notice'
  end

  scenario "Clear previous success", js: true do
    url = 'https://gapfish.com/home/'

    visit '/'
    submit_form(url)

    expect(page).to have_selector '#generated-url'
    
    url = 'invalid'

    submit_form(url)

    expect(page).to have_selector '.notice'
    expect(page).to have_no_selector '#generated-url'
  end
end