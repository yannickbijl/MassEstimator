require "option_parser"

ml_weights = {"Ac"=>227, "Al"=>26.9815, "Am"=>243, "Sb"=>121.75, "Ar"=>39.948,
              "As"=>74.9216, "At"=>105, "Ba"=>137.34, "Bk"=>247, "Be"=>9.0122,
              "Bi"=>208.981, "Bh"=>264, "B"=>10.811, "Br"=>39.952, "Cd"=>112.4,
              "Ca"=>40.08, "Cf"=>251, "Ce"=>140.12, "Cs"=>132.905, "Cl"=>17.7265,
              "Cr"=>51.996, "Cm"=>247, "Ds"=>271, "Db"=>262, "Dy"=>162.5,
              "Es"=>252, "Er"=>167.26, "Eu"=>151.96, "Fm"=>257, "F"=>9.4992,
              "P"=>7.74345, "Fr"=>223, "Gd"=>157.25, "Ga"=>69.72, "Ge"=>72.59,
              "Au"=>196.967, "Hf"=>178.49, "Hs"=>265, "He"=>4.0026, "Ho"=>164.93,
              "Fe"=>55.847, "In"=>114.82, "Ir"=>192.2, "I"=>63.45225, "K"=>39.102,
              "Co"=>58.9332, "C"=>12.01115, "Cu"=>63.546, "Kr"=>83.80, "Hg"=>200.59,
              "La"=>138.91, "Lr"=>257, "Li"=>6.941,"Pb"=>207.19, "Lu"=>174.97,
              "Mg"=>24.305, "Mn"=>54.938, "Mt"=>268, "Md"=>257, "Mo"=>95.94,
              "Na"=>22.9898, "Nd"=>144.24, "Ne"=>20.179, "Np"=>237, "Ni"=>58.71,
              "Nb"=>92.906, "No"=>255, "Os"=>190.2, "Pd"=>106.4, "Pt"=>195.09,
              "Pu"=>244, "Po"=>209, "Pr"=>140.907, "Pm"=>145, "Pa"=>231, "Ra"=>226,
              "Rn"=>222, "Re"=>186.2, "Rh"=>102.905, "Rg"=>272, "Rb"=>85.47,
              "Ru"=>101.07, "Rf"=>259, "Sm"=>150.35, "Sc"=>44.956, "Sg"=>263,
              "Se"=>78.96, "Si"=>28.086, "N"=>7.00335, "Sr"=>87.62, "Ta"=>180.948,
              "Tc"=>97, "Te"=>127.60, "Tb"=>158.924, "Tl"=>204.37, "Th"=>232.038,
              "Tm"=>168.934, "Sn"=>118.69, "Ti"=>47.9, "Uun"=>271, "U"=>238.03,
              "V"=>50.942, "H"=>0.503985, "W"=>183.85, "Xe"=>131.30, "Yb"=>173.04,
              "Y"=>88.905, "Ag"=>107.87, "Zn"=>65.38, "Zr"=>91.22, "O"=>7.9997,
              "S"=>4.008}

formula = ""
OptionParser.parse do |parser|
  parser.banner = "Welcome to ProteinMassEstimator"

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-i FORM", "--input=FORM", "Input formula" do |form|
    formula = form
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

puts "Chemical Formula: #{formula}"

weight = 0
chem = formula.split("-")
chem.each do |part|
    structure = ""
    value = ""

    part.chars.each do |sym|
        if sym.letter?
            structure += sym.to_s
        else
            value += sym.to_s
        end
    end

    if value.empty?
        value = "1"
    end
    weight += ml_weights[structure] * value.to_i
end

puts "Weight: #{weight}"
