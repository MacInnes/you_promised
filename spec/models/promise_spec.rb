require 'rails_helper'

describe Promise do

  it 'exists' do
    promise = Promise.create(
      name: "I'll buy you ice cream",
      person: "Bob"
    )
    expect(promise).to be_a(Promise)
  end

  it { should validate_presence_of :name}
  it { should validate_presence_of :person}
  it { should validate_presence_of :status}


end
