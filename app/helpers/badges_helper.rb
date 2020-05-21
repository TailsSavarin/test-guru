module BadgesHelper
  BADGE_LIST = {
    'Пройти тест с первого раза' => :first_try,
    'Пройти все тесты определенной категории' => :all_tests_by_category,
    'Пройти все тесты определенного уровня' => :all_tests_by_level
  }.freeze
end
