# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#name_or_email When you have a name' do
    assert_equal 'alice', @alice.name_or_email
  end

  test '#name_or_email When you don not have a name' do
    assert_equal 'bob@example.com', @bob.name_or_email
  end

  test '#follow　When Alice followed Bob' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#following?　When Alice followed Bob' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#followed_by?　When Alice followed Bob' do
    assert_not @alice.followed_by?(@bob)
    @alice.follow(@bob)
    assert @bob.followed_by?(@alice)
  end

  test '#unfollow　When Alice unfollowed Bob' do
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end
end
