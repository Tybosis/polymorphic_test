require 'test_helper'

feature 'creating a post' do
  before do
    create_post
  end

  scenario 'create a new post' do
    page.text.must_include 'Post was successfully created'
    page.text.must_include 'Hello World'
    page.html.must_include 'Testing'
  end
end
