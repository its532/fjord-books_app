# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @bob = users(:bob)
    @marry = users(:marry)
    @jin = users(:jin)
  end

  test '#name_or_email nameの値を持っている時' do
    assert_equal 'alice', @alice.name_or_email
  end

  test '#name_or_email nameの値を持っていない時' do
    assert_equal 'bob@example.com', @bob.name_or_email
  end

  test '#follow　AliceがBobをフォローした時' do
    @alice.follow(@bob)
    assert @alice.active_relationships.present?
  end

  test '#following?　AliceはBobをフォローしていない' do
    assert_not @alice.following?(@bob)
  end

  test '#following?　MarryはJinをフォローしている' do
    assert @marry.following?(@jin)
  end

  test '#followed_by?　AliceのフォロワーにBobはいない' do
    assert_not @alice.followed_by?(@bob)
  end

  test '#followed_by?　JinのフォロワーにMarryがいる' do
    assert @jin.followed_by?(@marry)
  end

  test '#unfollow　MarryがJinのフォローを解除した時' do
    @marry.unfollow(@jin)
    assert_not @marry.active_relationships.present?
  end
end
