require 'rails_helper'

describe 'User' do

  context 'Goes to home page' do

    it 'Sees a form to add a promise' do
      visit '/'
      expect(page).to have_content("Add a promise:")
      expect(page).to have_css('input#name')
      expect(page).to have_css('input#person')
      expect(page).to have_button('Add Promise')
    end

  end

end
