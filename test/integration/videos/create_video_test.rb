require 'test_helper'

feature 'creating a video' do
  before do
    create_video
  end

  scenario 'create a new video' do
    page.text.must_include 'Video was successfully created'
    page.text.must_include 'Brandon Westgate'
    page.html.must_include '<iframe'
  end
end
