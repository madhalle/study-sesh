require 'rails_helper'
RSpec.describe "when I visit the contestants show page" do
  before :each do
    @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                          season_number: 15, description: "Absolutely wild!!")

    @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
    @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 39, hometown: "Over there")

    @greggsswamp = @gregg.outings.create!(name: "Greggs swamp")
  end

  it "I see the contestants info" do
    visit "/contestants/#{@gregg.id}"

    expect(page).to have_content(@gregg.name)
    expect(page).to have_content(@gregg.age)
    expect(page).to have_content(@gregg.hometown)
    expect(page).to have_content(@bachelorette1.season_number)
  end

  it "I see the contestants outings" do
    visit "/contestants/#{@gregg.id}"
    expect(page).to have_content(@gregg.outings.first.name)
    expect(page).to have_content(@gregg.outings.last.name)
  end

  it "A contestants outings are links to each outings show page" do
    visit "/contestants/#{@gregg.id}"
    click_link @gregg.outings.first.name

    expect(current_path).to eq("/contestants/#{@gregg.id}/outings/#{@gregg.outings.first.id}")
  end
end
