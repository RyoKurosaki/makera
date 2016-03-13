module Utils
  class CommonUtil
    def self.password_gen(length=8)
      numbers = [*0..9]
      alpha_bigs = [*'A'..'Z']
      alpha_smalls = [*'a'..'z']
      symbols = "! # $ % & @ + * ?".split(/\s+/)

      codes = [numbers, alpha_bigs, alpha_smalls, symbols].shuffle
      password = []

      length.times do |i|
        password << codes[i % codes.length].sample(1)
      end
      password.shuffle.join
    end
  end
end
