require 'rails_helper'

describe 'User' do

  context 'Goes to home page' do

    it 'Sees a form to add a promise' do
      visit '/'
      expect(page).to have_content("Add a promise:")
      expect(page).to have_css('input#name')
      expect(page).to have_css('input#person')
      expect(page).to have_button('Create Promise')
    end

    it 'Can add a promise' do
      visit '/'

      fill_in :name, with: "Fix my car"
      fill_in :person, with: "Roger"
      click_on "Create Promise"
      expect(current_path).to eq('/')
      expect(page).to have_content('Name: Fix my car')
      expect(page).to have_content('Person: Roger')
    end

    it 'Can delete a promise' do
      promise = Promise.create(
        name: "test promise",
        person: "God"
      )
      visit '/'
      expect(page).to have_content("Name: #{promise.name}")
      expect(page).to have_content("Person: #{promise.person}")

      click_on 'Delete'
      expect(current_path).to eq('/')
      expect(page).to_not have_content("Name: #{promise.name}")
      expect(page).to_not have_content("Person: #{promise.person}")
    end

  end

end