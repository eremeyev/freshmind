require "colorize"

class Command
  attr_reader :lang
  def initialize(lang=:en)
    @lang = lang
  end
  
  def list
    (commands*100).split("").sample(300)
  end
  
  def commands
    return "оплопл" if lang == :ru
    return "brlbrl" if lang == :en
  end
end

class Alfabet
  attr_reader :lang, :order
  def initialize(lang=:en, order=:ordered)
    @lang = lang
    @order = order
  end
  
  def list
    letters = "АБВГДЕЁЖЗИКЛМНОПРСТУФХЧЦШЩЫЭЮЯ" if lang == :ru
    letters = "ABCDEFHHIJKLMNOPQRSTUVWZYZABCD" if lang == :en
    res = letters.split('')
    res = res.sample(letters.size) if order.to_sym == :random
    res
  end
end

class Options
  attr_reader :options, :argv
  def initialize( argv, options={})
    @argv = argv
    @options = options
  end
  
  def args
    res = {}
    options.each do |opt_key, opt_value| 
      opt_value[:variants].each do |variant|
        arg_index = argv.index(variant.to_s)
        res[opt_key] = arg_index.nil? ? opt_value[:default] : argv[arg_index].to_sym
      end
    end
    res
  end
end

class Main
  attr_reader :row_size, :commands, :alfabet
  LEFT_UP_CORNER =    "\u250c"
  RIGHT_UP_CORNER =   "\u2510"
  LEFT_DOWN_CORNER =  "\u2514"
  RIGHT_DOWN_CORNER = "\u2518"
  VERTICAL_BORDER =   "\u2502"
  HORIZONTAL_BORDER = "\u2500"
  
  def initialize(row_size, commands, alfabet)
    @row_size = row_size
    @commands = commands
    @alfabet = alfabet
  end
  
  def result
    alfabet.map do |l| 
      l + commands[rand(300)].red
    end
  end
  
  def out
    puts top_border
    result.each_slice(row_size) do |row|
      puts VERTICAL_BORDER + " " + row.join(" ") + " " + VERTICAL_BORDER
    end
    puts bottom_border
  end
  
  private 
  
  def line
    HORIZONTAL_BORDER * (row_size * 3 + 1)
  end
  
  def top_border
    LEFT_UP_CORNER + line + RIGHT_UP_CORNER
  end
  def bottom_border
    LEFT_DOWN_CORNER + line + RIGHT_DOWN_CORNER
  end
end

options_conf = { 
  lang: { 
    variants: [:en, :ru], 
    default: :en, 
    optional: true }, 
  order: { variants: [:ordered, :random],
    default: :ordered,
    optional: true }
  } 


args = Options.new(ARGV, options_conf).args

Main.new(
  5,
  Command.new(args[:lang]).list,
  Alfabet.new(args[:lang], args[:order]).list
).out