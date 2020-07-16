require 'rails_helper'

RSpec.describe "Bachelorette Show Page", type: :feature do
  describe "when I visit /bachelorettes/:id" do
    it "I can see her information" do

      lena = Bachelorette.create(name: "Lena", season_number: 8, description: "Best season yet!")

      visit "/bachelorettes/#{lena.id}"

      expect(page).to have_content("Lena")

      expect(page).to have_content("Season #{lena.season_number} - Best season yet!")
    end

    it "I can see a contestants link" do
      lena = Bachelorette.create(name: "Lena", season_number: 8, description: "Best season yet!")
      tom = lena.contestants.create(name: "Tom")
      bob = Contestant.create(name: 'Bob', bachelorette: lena)
      jim = Contestant.create(name: 'Jim', bachelorette_id: lena.id)

      visit "/bachelorettes/#{lena.id}"

      expect(page).to have_link("Contestants")
      click_on("Contestants")
      expect(current_path).to eq("/bachelorettes/#{lena.id}/contestants")
      save_and_open_page
      expect(page).to have_content(tom.name)
      expect(page).to have_content(bob.name)
      expect(page).to have_content(jim.name)
    end
  end
end
