require 'rails_helper'

RSpec.describe Page, type: :model do
  before(:example) do
    @page = Page.new
  end

  def content
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
  end
  
  it 'is not valid without name' do 
    @page.content = content
    expect(@page).not_to be_valid
  end
  
  it 'is not valid without content' do
    @page.name = 'aaa'
    expect(@page).not_to be_valid
  end
  
  it 'is not valid with name shorter than 2 characters' do
    @page.name = 'a'
    @page.content = content
    expect(@page).not_to be_valid
  end

  it 'is not valid with duplicative name' do
    @page.name = 'aaa'
    @another_page = Page.new
    @another_page.name = 'aaa'
    expect(@another_page).not_to be_valid
  end

  it 'is not valid with name written with special symbols' do
    @page.name = '!!!aaa'
    expect(@page).not_to be_valid
  end
end
