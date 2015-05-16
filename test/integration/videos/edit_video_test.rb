require 'test_helper'

feature 'editing a video' do
  scenario 'editing the first of multiple videos' do
    create_video
    create_second_video
    visit videos_path
    all(:link, 'Show').first.click
    click_on 'Edit'
    fill_in 'Title', with: 'New Title'
    click_on 'Update'
    page.text.must_include 'Video was successfully updated'
    page.text.must_include 'New Title'
    page.text.wont_include 'Brandon Westgate'
  end
end
