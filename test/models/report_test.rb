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
    assert_equal(@report.created_at.to_date, @report.created_on)
  end
end
