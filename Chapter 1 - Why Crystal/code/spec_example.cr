require "spec"
describe "thing" do
  it "works" do
    (1 + 2).should eq(3)
  end

  it "doesn't work" do
    (6 * 7).should eq(43)
  end
end

# Failures:

#   1) thing doesn't work
#      Failure/Error: (6 * 7).should eq(43)

#       Expected: 43
#       got: 42

#      # test.cr:8

# Finished in 241 microseconds
# 2 examples, 1 failures, 0 errors, 0 pending

# Failed examples:

# crystal spec test.cr:7 # thing doesn't work
