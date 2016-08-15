require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TraceRoutesHelper. For example:
#
# describe TraceRoutesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe TraceRoutesHelper, type: :helper do
  it { expect(helper.google_maps_key).to eq(ENV['GOOGLE_API_BROWSER_KEY']) }
end
