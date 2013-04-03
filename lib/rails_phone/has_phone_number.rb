# Adds validation and cleaning to permit phone numbers to be entered
# in nice formats, e.g.:
#
#  (112)-123-1231 => 1121231231
#
# Strips non-numeric characters and then validates there are 10 digits
#
module RailsPhone
  module HasPhoneNumber
    extend ActiveSupport::Concern
    module ClassMethods
      # Takes an array of attributes (defaults to just :phone) and
      # sets them up as phone numbers. Phone numbers can be assigned
      # in any format but have all non-digits stripped out before validation.
      #
      # "Legal phone number" in this context means very simply "10
      # digits long"
      #
      #     has_phone_number # defaults to :phone
      #
      # or
      #
      #     has_phone_number :phone, :custom_phone
      #
      #
      def has_phone_number(*args)
        cattr_accessor :phone_number_attributes
        self.phone_number_attributes = *args
        self.phone_number_attributes = [:phone] if phone_number_attributes.empty?

        phone_number_attributes.each do |attr|
          validates attr, length: { is: 10 }, allow_blank: true
        end

        before_validation :format_phone_numbers
      end
    end

    private
    def format_phone_numbers
      self.class.phone_number_attributes.each do |attr|
        number = read_attribute(attr)
        if number.present? && number =~ /\d/
          write_attribute(attr, number.to_s.gsub(/\D/, ''))
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, RailsPhone::HasPhoneNumber
