require 'test_helper'

class RailsPhoneTest < ActiveSupport::TestCase
  setup do
    @jim = Person.new name: "Jim"
    @corp = Company.new name: "Acme Entertainment"
    @outcast = Outcast.new name: "Jon Snow", phone: "ABC-123-456"
  end

  test "does not affect classes without has_phone_number" do
    assert @outcast.valid?
  end

  test "custom phone attributes must be valid" do
    @corp.customer_support_phone = "123-123-1233"
    assert @corp.valid?
    @corp.customer_support_phone = "A23-123-1233"
    assert !@corp.valid?
  end

  test "uses :phone by default" do
    assert_equal [:phone], Person.phone_number_attributes
  end

  test "accepts phone attributes as arguments" do
    assert_equal [:customer_support_phone, :phone], Company.phone_number_attributes
  end

  test "unformatted phone is ok" do
    @jim.phone = 1123456789
    assert @jim.valid?, "1123456789 should be valid"
  end

  test "blank phone is ok" do
    assert @jim.valid?
  end

  %w{0123456789 012-345-6789 (012)-345-6789}.each do |valid_phone|
    define_method "test_#{valid_phone}" do
      @jim.phone = valid_phone
      assert @jim.valid?, "#{valid_phone} should be valid"
    end
  end

  %w{123456789 1234 012-A45-6789 (B12)-345-6789}.each do |valid_phone|
    define_method "test_#{valid_phone}" do
      @jim.phone = valid_phone
      assert !@jim.valid?, "#{valid_phone} should be invalid"
    end
  end
end
