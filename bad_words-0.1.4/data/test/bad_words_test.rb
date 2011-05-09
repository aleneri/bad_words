require "test/unit"
require 'yaml'
require "bad_words" 
 
class BadWordsTest < Test::Unit::TestCase
  def test_make_clean_nivel1
    assert_equal "legal", BadWords.make_clean("CARALHO LEGAL", 1)
  end
  
  def test_make_clean_nivel2
    assert_equal "site", BadWords.make_clean("SITE iG", 2)
  end
  
  def test_make_clean_nivel3
    assert_equal "good", BadWords.make_clean("CARALHO good iG", 3)
  end
  
  def test_make_verify_nivel1
    assert_equal true, BadWords.make_verify("CARALHO LEGAL", 1)
  end
  
  def test_make_verify_nivel2
    assert_equal true, BadWords.make_verify("SITE iG", 2)
  end
  
  def test_make_verify_nivel3
    assert_equal true, BadWords.make_verify("CARALHO good iG", 3)
  end
  
  def test_make_verify
    assert_equal false, BadWords.make_verify("good", 3)
  end
end
