require 'test_helper'

feature 'deleting a post' do
  scenario 'delete if only one post' do
    create_post
    visit posts_path
    all(:link, 'Show').last.click
    click_on 'Delete'
    page.text.wont_include 'Hello World'
  end

  scenario 'delete first of multiple posts' do
    create_post
    create_second_post
    Post.count.must_equal 2
    visit posts_path
    click_on 'Show', match: :first
    click_on 'Delete'
    page.text.must_include 'Post was successfully destroyed'
    Post.count.must_equal 1
    page.text.wont_include 'Hello World'
    page.text.must_include 'Tyler Pottle'
  end

  scenario 'deleting last of multiple posts' do
    create_post
    create_second_post
    Post.count.must_equal 2
    visit posts_path
    all(:link, 'Show').last.click
    click_on 'Delete'
    page.text.must_include 'Post was successfully destroyed'
    Post.count.must_equal 1
    page.text.wont_include 'Tyler Pottle'
    page.text.must_include 'Hello World'
  end
end
