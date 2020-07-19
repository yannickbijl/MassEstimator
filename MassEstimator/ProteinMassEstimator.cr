require "option_parser"

aa_weights = {'A'=>71.0788, 'R'=>156.1875, 'N'=>114.1038,
              'D'=>115.0886, 'C'=>103.1388, 'E'=>129.1155,
              'Q'=>128.1307, 'G'=>57.0519, 'H'=>137.1411,
              'I'=>113.1594, 'L'=>113.1594, 'K'=>128.1741,
              'M'=>131.1926, 'F'=>147.1766, 'P'=>97.1167,
              'S'=>87.0782, 'T'=>101.1051, 'W'=>186.2132,
              'Y'=>163.1760, 'V'=>99.1326}

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


weight = 0
sequence.chars.each do |aa|
  weight += aa_weights[aa]
end

puts "Weight: #{weight}"