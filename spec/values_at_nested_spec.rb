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
      filtered_one = subject.values_at_nested(:degree)
      expect(filtered_one).not_to eq(subject.values)
      expect(filtered_one).to eq(['Psychology'])
      expect(filtered_one).to include('Psychology')
      expect(filtered_one.size).to eq(1)

      filtered_two = subject.values_at_nested(:degree, :preferences)
      expect(filtered_two).not_to eq(subject)
      expect(filtered_two).not_to eq(subject.values)
      expect(filtered_two).to include('Psychology')
      expect(filtered_two).to include(['mauve', 'coffee', 'cat'])
      expect(filtered_two.size).to eq(2)
    end

    it "accepts nested keys list and filters accordingly" do
      filtered = subject.values_at_nested(preferences: [:color, :drink])

      expect(filtered).not_to eq(subject)
      expect(filtered).not_to eq(subject.values)
      expect(filtered).to eq([['mauve', 'coffee']])
      expect(filtered).to include(['mauve', 'coffee'])
      expect(filtered.size).to eq(1)
    end

    it "accepts keys list with single nested key and filters accordingly" do
      filtered = subject.values_at_nested(preferences: :pet)

      expect(filtered).not_to eq(subject)
      expect(filtered).not_to eq(subject.values)
      expect(filtered).to eq([['cat']])
      expect(filtered).to include(['cat'])
      expect(filtered.size).to eq(1)
    end

    it "returns empty array if no key arguments given" do
      vals = subject.values_at_nested
      expect(vals).to eq([])
      expect(vals).to be_empty
      expect(vals.size).to eq(0)
    end

    it "return all values if all keys are passed" do
      vals = subject.values_at_nested(:name, :preferences, :degree)

      expect(vals).not_to eq(['Zohoor', 'Psychology', ['mauve', 'coffee' 'cat']])
      expect(vals.size).to eq(3)
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
