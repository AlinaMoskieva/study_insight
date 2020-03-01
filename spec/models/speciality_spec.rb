require 'rails_helper'

RSpec.describe Speciality, type: :model do
  it { is_expected.to validate_presence_of :full_name }
end
