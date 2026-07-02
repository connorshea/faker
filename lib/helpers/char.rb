# frozen_string_literal: true

module Faker
  module Char
    # @private
    UMLAUTS = /[äöüß]/i

    # Transliteration table based on conventions adopted by BGN/PCGN for Ukrainian
    # @private
    UK_CHARS = {
      'а' => 'a', 'б' => 'b', 'в' => 'v', 'г' => 'h', 'ґ' => 'g', 'д' => 'd', 'е' => 'e',
      'є' => 'ye', 'ж' => 'zh', 'з' => 'z', 'и' => 'y', 'і' => 'i', 'ї' => 'yi', 'й' => 'y',
      'к' => 'k',  'л' => 'l', 'м' => 'm', 'н' => 'n', 'о' => 'o', 'п' => 'p', 'р' => 'r',
      'с' => 's', 'т' => 't', 'у' => 'u', 'ф' => 'f', 'х' => 'kh', 'ц' => 'ts', 'ч' => 'ch',
      'ш' => 'sh', 'щ' => 'shch', 'ю' => 'yu', 'я' => 'ya', 'А' => 'a', 'Б' => 'b', 'В' => 'v',
      'Г' => 'h', 'Ґ' => 'g', 'Д' => 'd', 'Е' => 'e', 'Є' => 'ye', 'Ж' => 'zh', 'З' => 'z',
      'И' => 'y', 'І' => 'i', 'Ї' => 'yi', 'Й' => 'y', 'К' => 'k', 'Л' => 'l', 'М' => 'm',
      'Н' => 'n', 'О' => 'o', 'П' => 'p', 'Р' => 'r', 'С' => 's', 'Т' => 't', 'У' => 'u',
      'Ф' => 'f', 'Х' => 'kh', 'Ц' => 'ts', 'Ч' => 'ch', 'Ш' => 'sh', 'Щ' => 'shch', 'Ю' => 'yu',
      'Я' => 'ya', 'ь' => '' # Ignore symbol, because its standard presentation is not allowed in URLs
    }.freeze

    # Transliteration table based on conventions adopted by BGN/PCGN for Russian
    # @private
    RU_CHARS = {
      'а' => 'a', 'б' => 'b', 'в' => 'v', 'г' => 'h', 'д' => 'd', 'е' => 'e',
      'ё' => 'ye', 'ж' => 'zh', 'з' => 'z', 'и' => 'i', 'й' => 'y', 'к' => 'k',
      'л' => 'l',  'м' => 'm',  'н' => 'n',  'о' => 'o', 'п' => 'p', 'р' => 'r',
      'с' => 's',  'т' => 't',  'у' => 'u',  'ф' => 'f', 'х' => 'kh', 'ц' => 'ts',
      'ч' => 'ch', 'ш' => 'sh', 'щ' => 'shch', 'ы' => 'у', 'э' => 'e', 'ю' => 'yu',
      'я' => 'ya', 'А' => 'a',  'Б' => 'b', 'В' => 'v', 'Г' => 'h', 'Д' => 'd',
      'Е' => 'e', 'Ё' => 'ye', 'Ж' => 'zh', 'З' => 'z', 'И' => 'i', 'Й' => 'y',
      'К' => 'k', 'Л' => 'l', 'М' => 'm', 'Н' => 'n', 'О' => 'o', 'П' => 'p', 'Р' => 'r',
      'С' => 's',  'Т' => 't',  'У' => 'u', 'Ф' => 'f', 'Х' => 'kh', 'Ц' => 'ts',
      'Ч' => 'ch', 'Ш' => 'sh', 'Щ' => 'shch', 'Ы' => 'у', 'Э' => 'e', 'Ю' => 'yu',
      'Я' => 'ya', 'ь' => '', 'ъ' => '' # Ignore symbols, because its standard presentation is not allowed in URLs
    }.freeze

    def self.prepare(string)
      result = romanize_cyrillic string
      result = fix_umlauts result if result.match?(UMLAUTS)
      result.gsub(/[^\w-]/, '').downcase
    end

    def self.fix_umlauts(string)
      string.gsub(UMLAUTS) do |match|
        case match.downcase
        when 'ä' then 'ae'
        when 'ö' then 'oe'
        when 'ü' then 'ue'
        when 'ß' then 'ss'
        else match.downcase
        end
      end
    end

    def self.romanize_cyrillic(string)
      case Faker::Config.locale
      when 'uk'
        string.gsub(/[а-яА-ЯіїєґІЇЄҐ]/, UK_CHARS)
      when 'ru'
        string.gsub(/[а-яА-Я]/, RU_CHARS)
      else
        string
      end
    end
  end
end
