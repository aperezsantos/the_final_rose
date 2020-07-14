require 'rails_helper'

RSpec.describe "Bachelorette Show Page", type: :feature do
  describe "when I visit /bachelorettes/:id" do
    it "I can see her information" do

      lena = Bachelorette.create(name: "Lena", season_number: 8, description: "Best season yet!")

      visit "/bachelorettes/#{lena.id}"

      expect(page).to have_content("Lena")
      
      expect(page).to have_content("Season #{lena.season_number} - Best season yet!")
    end
  end
end
