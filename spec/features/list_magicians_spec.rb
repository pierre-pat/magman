require 'spec_helper'

describe 'Viewing the list of magicians' do

  it 'shows the magicians' do
    magician1 = Magician.create(firstname: 'Mag1', lastname: 'Mag11')
    magician2 = Magician.create(firstname: 'Mag2', lastname: 'Mag22')
    magician3 = Magician.create(firstname: 'Mag3', lastname: 'Mag33')

    visit magicians_path

    expect(page).to have_text('magicians')
    expect(page).to have_text(magician1.firstname)
    expect(page).to have_text(magician2.lastname)

  end

  it 'should have link to add a new magician' do
    visit magicians_path

    expect(page).to have_link('Add a new magician')
  end

end
