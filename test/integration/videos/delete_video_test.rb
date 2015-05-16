require 'test_helper'

feature 'deleting a video' do
  scenario 'delete if only one video' do
    create_video
    visit videos_path
    all(:link, 'Show').last.click
    click_on 'Delete'
    page.text.wont_include 'Brandon Westgate'
  end

  scenario 'delete first of multiple videos' do
    create_video
    create_second_video
    Video.count.must_equal 2
    visit videos_path
    click_on 'Show', match: :first
    click_on 'Delete'
    page.text.must_include 'Video was successfully destroyed'
    Video.count.must_equal 1
    page.text.wont_include 'Brandon Westgate'
    page.text.must_include 'Bacon Pancakes'
  end

  scenario 'deleting last of multiple videos' do
    create_video
    create_second_video
    Video.count.must_equal 2
    visit videos_path
    all(:link, 'Show').last.click
    click_on 'Delete'
    page.text.must_include 'Video was successfully destroyed'
    Video.count.must_equal 1
    page.text.wont_include 'Bacon Pancakes'
    page.text.must_include 'Brandon Westgate'
  end
end
