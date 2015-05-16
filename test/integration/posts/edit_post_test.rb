require 'test_helper'

feature 'editing a post' do
  scenario 'editing the first of multiple posts' do
    create_post
    create_second_post
    visit posts_path
    all(:link, 'Show').first.click
    click_on 'Edit'
    fill_in 'Title', with: 'New Title'
    click_on 'Update'
    page.text.must_include 'Post was successfully updated'
    page.text.must_include 'New Title'
    page.text.wont_include 'Testing'
  end
end
