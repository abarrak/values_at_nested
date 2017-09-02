require "spec_helper"

RSpec.describe ValuesAtNested do
  it "has a version number" do
    expect(ValuesAtNested::VERSION).not_to be nil
    expect(ValuesAtNested::VERSION).to be_kind_of(String)
  end
end
