class Alfabet
  attr_reader :lang, :order
  LETTERS = {
    ru: ('А'..'Я').to_a - %w[Ъ Ь] + %w[Ё],
    en: ('A'..'Z').to_a
  }
  
  def initialize(options = {})
    @lang  = options.fetch(:lang) { :en }
    @order = options.fetch(:order){ :ordered }
  end
  
  def list
    res = (LETTERS[lang] * 2)[0, 40]
    res = res.sample(res.size) if order.to_sym == :random
    res
  end
end
