# frozen_string_literal: true

require_relative '../lib/freshmind/alfabet'

RSpec.describe Alfabet, :aggregate_failure do
  let(:ru_alfabet) { Alfabet.new(lang: :ru) }
  context 'ru' do
    it 'return russian letters' do
      expect(ru_alfabet.list).to eq((('А'..'Я').to_a * 2)[0, 40])
    end
  end
  
  let(:en_alfabet) { Alfabet.new(lang: :en) }
  context 'en' do
    it 'return english letters' do
      expect(en_alfabet.list).to eq((('A'..'Z').to_a * 2)[0, 40])
    end
  end

  let(:unknown_alfabet) { Alfabet.new(lang: :en) }
  context 'unknown' do
    it 'return english letters' do
      expect(en_alfabet.list).to eq((('A'..'Z').to_a * 2)[0, 40])
    end
  end
end
