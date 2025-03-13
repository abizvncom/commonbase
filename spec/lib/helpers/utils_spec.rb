require 'rails_helper'
# require_relative '../../../lib/commonbase/helpers/utils'

RSpec.describe Commonbase::Utils do
  describe ".boolean_to_yes_no" do
    it 'converts true to "Yes"' do
      expect(Commonbase::Utils.boolean_to_yes_no(true)).to eq("YES")
    end
    it 'converts false to "No"' do
      expect(Commonbase::Utils.boolean_to_yes_no(false)).to eq("NO")
    end
    it 'converts nil to ""' do
      expect(Commonbase::Utils.boolean_to_yes_no(nil)).to eq("")
    end
  end

  describe ".yes_no_to_boolean" do
    it 'converts "Yes" to true' do
      ['yes', 'y', 'YES', 'Y'].each do |value|
        expect(Commonbase::Utils.yes_no_to_boolean(value)).to be true
      end
    end
    it 'converts "No" to false' do
      ['no', 'n', 'NO', 'N'].each do |value|
        expect(Commonbase::Utils.yes_no_to_boolean(value)).to be false
      end
    end
  end
end
