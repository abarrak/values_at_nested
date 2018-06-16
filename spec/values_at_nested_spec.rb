require "spec_helper"

RSpec.describe ValuesAtNested do
  it "has a version number" do
    expect(ValuesAtNested::VERSION).not_to be nil
    expect(ValuesAtNested::VERSION).to be_kind_of(String)
  end

  describe "#values_at_nested hash extention" do
    subject do
      { name: 'Zohoor', degree: 'Psychology',
        preferences: { color: 'mauve', drink: 'coffee', pet: 'cat' } }
    end

    it "accepts normal keys list like #values_at and filters accordingly" do
    end

    it "accepts nested keys list and filters accordingly" do
    end

    it "accepts keys list with single nested key and filters accordingly" do
    end

    it "returns empty array if no key arguments given" do
    end

    it "return all values if all keys are passed" do
    end

    context "3-level nested" do
      subject { { a: 1, b: { b1: true, b2: false }, c: { d: { x: 100, y: 200 }, e: true } } }

      it "accepts nested keys list in and filters accordingly" do
        val = subject.values_at_nested(c: { d: :x })

        expect(val).not_to eq(subject)
        expect(val).not_to eq(subject.values)
        expect(val).to eq(subject[:c][:d][:x])
      end
    end
  end
end
