# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:repo)
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#editable?　Aliceが投稿した日報かを確認' do
    assert @report.editable?(@alice)
  end

  test '#created_on　reportが2011年11月12に作成されたことを確認' do
    travel_to Time.zone.local(2021, 11, 12) do
      @report.created_at = Date.new(2021, 11, 12)
      assert_equal(Date.new(2021, 11, 12), @report.created_on)
    end
  end
end
