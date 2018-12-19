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

    it 'Can view an individual promise' do
      promise = Promise.create(
        name: "test promise",
        person: "God"
      )
      visit '/'

      click_on "#{promise.name}"
      expect(current_path).to eq("/promises/#{promise.id}")
      expect(page).to have_content("Name: #{promise.name}")
      expect(page).to have_content("Person: #{promise.person}")
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

    it 'Can edit a promise' do
      promise = Promise.create(
        name: "test promise",
        person: "God"
      )
      visit '/'
      expect(page).to have_content("Name: #{promise.name}")
      expect(page).to have_content("Person: #{promise.person}")
      expect(page).to have_content("Status: in progress")

      click_on 'Edit'
      expect(current_path).to eq("/promises/#{promise.id}/edit")
      expect(page).to have_content("Edit this promise:")

      fill_in :name, with: "A different promise name"
      fill_in :person, with: "Anybody"
      select "abandoned", from: :promise_status
      click_on "Update Promise"
      expect(current_path).to eq('/')
      expect(page).to have_content("Name: A different promise name")
      expect(page).to have_content("Person: Anybody")
      expect(page).to have_content("Status: abandoned")

      expect(page).to_not have_content("Name: #{promise.name}")
      expect(page).to_not have_content("Person: #{promise.person}")
    end

  end

end
