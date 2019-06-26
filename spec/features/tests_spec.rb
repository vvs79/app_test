require 'rails_helper'

describe "Tests:" do
  before :each do
    visit '/'
  end

  it "test 1 is correct", js: true do
    fill_in "test-1", with: 'abcdab987612'

    click_button 'GO test 1'

    expect(page).to have_content('a-dab9-612')
  end

  it "test 1 is not correct", js: true do
    fill_in "test-1", with: 'abbcdab987612'

    click_button 'GO test 1'

    expect(page).to have_no_content('a-dab9-612')
  end

  it "test 2 is correct", js: true do
    fill_in "test-2", with: 'To be or not to be that is the question'

    click_button 'GO test 2'

    expect(page).to have_content("To be\nor\nnot\nto be\nthat\nis\nthe\nquest\nion")
  end

  it "test 2 is not correct", js: true do
    fill_in "test-2", with: 'To be or not to be that is the question'

    click_button 'GO test 2'

    expect(page).to have_no_content("bla\nbla\nbla")
  end
end
