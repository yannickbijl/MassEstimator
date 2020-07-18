require "option_parser"

sequence = ""

OptionParser.parse do |parser|
  parser.banner = "Welcome to ProteinMassEstimator"

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-i SEQ", "--input=SEQ", "Input Sequence" do |seq|
    sequence = seq
  end

  parser.missing_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is missing something."
    STDERR.puts ""
    STDERR.puts parser
    exit(1)
  end
  parser.invalid_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

puts "Protein: #{sequence}"

sequence.chars.each do |aa|
  puts "AminoAcid: #{aa}"
end