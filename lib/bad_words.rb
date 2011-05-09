require 'yaml'

module BadWords
  
  #Str     : String
  #Nivel 1 : clean bad words.
  #Nivel 2 : clean block words {exemplo name of concurrence, name of group or products of group}
  #Nivel 3 : use all filters
  def self.make_clean(str, nivel)
    words_define = load_words(nivel)
    clean_string(str, words_define.split(' '))
  end
  
  #Str     : String
  #Nivel 1 : verify bad words.
  #Nivel 2 : verify block words {exemplo name of concurrence, name of group or products of group}
  #Nivel 3 : use all filters
  def self.make_verify(str, nivel)
    words_define = load_words(nivel)
    verify_string(str, words_define.split(' '))
  end
  
  def self.clean_string(str, bad_words)
    str_broken = str.downcase.split(' ')
    bad_words.any? { |bw| str_broken.include?(bw) }
    (str_broken - bad_words).join(' ') 
  end 
  
  def self.verify_string(str, bad_words)
    str_broken = str.downcase.split(' ')
    str_broken.size() != (str_broken - bad_words).size()  
  end 
  
  def self.load_words(nivel)
    @words = YAML.load_file File.join(File.dirname(__FILE__), "../config/words.yml")
     words_define = ""
      if nivel == 1 || nivel == 3
        words_define << @words['bad_words'] << " "
      end
      if nivel == 2 || nivel == 3
        words_define << @words['block_words']
      end
      words_define
  end    
  
end