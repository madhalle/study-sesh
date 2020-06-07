require 'rails_helper'
RSpec.describe "when visiting bachelorettes show page" do
  before :each do
    @bachelorette1 = Bachelorette.create!(name: "Hannah Brown",
                                          season_number: 15, description: "Absolutely wild!!")

    @peter = @bachelorette1.contestants.create!(name: "Pilot pete", age: 28, hometown: "Los Angeles")
    @gregg = @bachelorette1.contestants.create!(name: "Old Gregg", age: 39, hometown: "Over there")
    visit "/bachelorettes/#{@bachelorette1.id}"
  end

  it "can see the bachelorettes info and link to contestants" do

    expect(page).to have_content(@bachelorette1.name)
    expect(page).to have_content(@bachelorette1.season_number)
    expect(page).to have_content(@bachelorette1.description)
  end

  it "can click through to bachelorettes contestants" do
    click_link "Contestants"

    expect(current_path).to eq("/bachelorettes/#{@bachelorette1.id}/contestants")
    expect(page).to have_content(@bachelorette1.contestants.first.name)
    expect(page).to have_content(@bachelorette1.contestants.last.name)
  end

  it "can click through to bachelorettes contestants" do
    click_link "Contestants"

    expect(page).to have_content(@bachelorette1.contestants.first.age)
    expect(page).to have_content(@bachelorette1.contestants.first.hometown)
    expect(page).to have_content(@bachelorette1.contestants.last.age)
    expect(page).to have_content(@bachelorette1.contestants.last.hometown)
  end

  it "can click through to bachelorettes contestants" do
    click_link "Contestants"

    click_on "#{@bachelorette1.contestants.first.name}"
    expect(current_path).to eq("/contestants/#{@bachelorette1.contestants.first.id}")
  end
end
