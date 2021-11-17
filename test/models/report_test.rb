# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:repo)
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#editable?' do
    assert @report.editable?(@alice)
  end

  test '#created_on' do
    travel_to Time.zone.local(2021, 11, 12) do
      @report.created_at = Date.new(2021, 11, 12)
      assert_equal(Date.new(2021, 11, 12), @report.created_on)
    end
  end
end
