require 'test_helper'

feature 'post comments' do
  before :each do
    create_post
    visit posts_path
    click_on 'Show'
    fill_in 'Content', with: 'This post rules!'
    click_on 'Create Comment'
    page.text.must_include 'Comment was successfully created'
    page.text.must_include 'This post rules!'
  end

  scenario 'adding a comment to a post' do
    page.text.must_include 'Comment was successfully created'
    page.text.must_include 'This post rules!'
    Comment.count.must_equal 1
  end

  scenario 'editing a comment' do
    all(:link, 'Edit').first.click
    fill_in 'Content', with: 'This post sucks!'
    click_on 'Update'
    page.text.must_include 'Comment was successfully updated'
    page.text.must_include 'Testing'
    page.text.must_include 'This post sucks!'
  end

  scenario 'deleting a comment' do
    all(:link, 'Destroy').first.click
    page.text.must_include 'Comment was successfully destroyed'
    page.text.wont_include 'This post rules!'
  end
end
