require 'test_helper'

feature 'video comments' do
  before :each do
    create_video
    visit videos_path
    click_on 'Show'
    fill_in 'Content', with: 'This video rules!'
    click_on 'Create Comment'
    page.text.must_include 'Comment was successfully created'
    page.text.must_include 'This video rules!'
  end

  scenario 'adding a comment to a video' do
    page.text.must_include 'Comment was successfully created'
    page.text.must_include 'This video rules!'
    Comment.count.must_equal 1
  end

  scenario 'editing a comment' do
    all(:link, 'Edit').first.click
    fill_in 'Content', with: 'This video sucks!'
    click_on 'Update'
    page.text.must_include 'Comment was successfully updated'
    page.text.must_include 'Brandon Westgate'
    page.text.must_include 'This video sucks!'
  end

  scenario 'deleting a comment' do
    all(:link, 'Destroy').first.click
    page.text.must_include 'Comment was successfully destroyed'
    page.text.wont_include 'This video rules!'
  end
end
