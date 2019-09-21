# typed: strong
# :nodoc:
module Faker
  VERSION = T.let('2.4.0', T.untyped)

  class Config
    # Sets the attribute locale
    # 
    # _@param_ `value` — the value to set the attribute locale to.
    sig { params(value: T.untyped).returns(T.untyped) }
    def self.locale=(value); end

    # Sets the attribute random
    # 
    # _@param_ `value` — the value to set the attribute random to.
    sig { params(value: T.untyped).returns(T.untyped) }
    def self.random=(value); end

    sig { returns(T.untyped) }
    def self.locale; end

    sig { returns(T.untyped) }
    def self.own_locale; end

    sig { returns(T.untyped) }
    def self.random; end
  end

  class Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # by default numerify results do not start with a zero
    sig { params(number_string: T.untyped, leading_zero: T.untyped).returns(T.untyped) }
    def self.numerify(number_string, leading_zero: false); end

    sig { params(letter_string: T.untyped).returns(T.untyped) }
    def self.letterify(letter_string); end

    sig { params(string: T.untyped).returns(T.untyped) }
    def self.bothify(string); end

    # Given a regular expression, attempt to generate a string
    # that would match it.  This is a rather simple implementation,
    # so don't be shocked if it blows up on you in a spectacular fashion.
    # 
    # It does not handle ., *, unbounded ranges such as {1,},
    # extensions such as (?=), character classes, some abbreviations
    # for character classes, and nested parentheses.
    # 
    # I told you it was simple. :) It's also probably dog-slow,
    # so you shouldn't use it.
    # 
    # It will take a regex like this:
    # 
    # /^[A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}$/
    # 
    # and generate a string like this:
    # 
    # "U3V  3TP"
    sig { params(reg: T.untyped).returns(T.untyped) }
    def self.regexify(reg); end

    # Helper for the common approach of grabbing a translation
    # with an array of values and selecting one of them.
    sig { params(key: T.untyped).returns(T.untyped) }
    def self.fetch(key); end

    # Helper for the common approach of grabbing a translation
    # with an array of values and returning all of them.
    sig { params(key: T.untyped).returns(T.untyped) }
    def self.fetch_all(key); end

    # Load formatted strings from the locale, "parsing" them
    # into method calls that can be used to generate a
    # formatted translation: e.g., "#{first_name} #{last_name}".
    sig { params(key: T.untyped).returns(T.untyped) }
    def self.parse(key); end

    # Call I18n.translate with our configured locale if no
    # locale is specified
    sig { params(args: T.untyped).returns(T.untyped) }
    def self.translate(*args); end

    # Executes block with given locale set.
    sig { params(tmp_locale: T.untyped).returns(T.untyped) }
    def self.with_locale(tmp_locale = nil); end

    sig { params(key: T.untyped).returns(T.untyped) }
    def self.flexible(key); end

    # You can add whatever you want to the locale file, and it will get caught here.
    # E.g., in your locale file, create a
    #   name:
    #     girls_name: ["Alice", "Cheryl", "Tatiana"]
    # Then you can call Faker::Name.girls_name and it will act like #first_name
    sig { params(mth: T.untyped, args: T.untyped, block: T.untyped).returns(T.untyped) }
    def self.method_missing(mth, *args, &block); end

    sig { params(method_name: T.untyped, include_private: T.untyped).returns(T::Boolean) }
    def self.respond_to_missing?(method_name, include_private = false); end

    # Generates a random value between the interval
    sig { params(from: T.untyped, to: T.untyped).returns(T.untyped) }
    def self.rand_in_range(from, to); end

    # If an array or range is passed, a random value will be selected.
    # All other values are simply returned.
    sig { params(value: T.untyped).returns(T.untyped) }
    def self.resolve(value); end

    sig { params(max_retries: T.untyped).returns(T.untyped) }
    def self.unique(max_retries = 10_000); end

    sig { params(list: T.untyped).returns(T.untyped) }
    def self.sample(list); end

    sig { params(list: T.untyped).returns(T.untyped) }
    def self.shuffle(list); end

    sig { params(max: T.untyped).returns(T.untyped) }
    def self.rand(max = nil); end

    sig { returns(T.untyped) }
    def self.disable_enforce_available_locales; end

    sig { returns(T.untyped) }
    def self.warn_for_deprecated_arguments; end

    # Workaround for emulating `warn '...', uplevel: 1` in Ruby 2.4 or lower.
    sig { params(message: T.untyped, uplevel: T.untyped).returns(T.untyped) }
    def self.warn_with_uplevel(message, uplevel: 1); end

    sig { params(at: T.untyped).returns(T.untyped) }
    def self.parse_caller(at); end
  end

  module Char
    sig { params(string: T.untyped).returns(T.untyped) }
    def self.prepare(string); end

    sig { params(string: T.untyped).returns(T.untyped) }
    def self.fix_umlauts(string); end

    sig { params(string: T.untyped).returns(T.untyped) }
    def self.romanize_cyrillic(string); end
  end

  module Base58
    sig { params(str: T.untyped).returns(T.untyped) }
    def self.encode(str); end
  end

  class Book < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a random book title
    # 
    # ```ruby
    # Faker::Book.title #=> "The Odd Sister"
    # ```
    sig { returns(String) }
    def self.title; end

    # Produces a random book author
    # 
    # ```ruby
    # Faker::Book.author #=> "Alysha Olsen"
    # ```
    sig { returns(String) }
    def self.author; end

    # Produces a random book publisher
    # 
    # ```ruby
    # Faker::Book.publisher #=> "Opus Reader"
    # ```
    sig { returns(String) }
    def self.publisher; end

    # Produces a random genre
    # 
    # ```ruby
    # Faker::Book.genre #=> "Mystery"
    # ```
    sig { returns(String) }
    def self.genre; end
  end

  class Books
    # 
    # A Faker module beyond your dreams, test data beyond your imagination.
    class Dune < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a character from Dune
      # 
      # ```ruby
      # Faker::Books::Dune.character #=> "Leto Atreides"
      # ```
      sig { returns(String) }
      def self.character; end

      # ```ruby
      # Faker::Books::Dune.title #=> "Duke"
      # ```
      sig { returns(String) }
      def self.title; end

      # Produces the name of a planet from Dune
      # 
      # ```ruby
      # Faker::Books::Dune.planet #=> "Caladan"
      # ```
      sig { returns(String) }
      def self.planet; end

      # Produces a quote from Dune
      # 
      # _@param_ `character` — The name of the character that the quote should be from
      # 
      # ```ruby
      # Faker::Books::Dune.quote
      #   #=> "A dead man, surely, no longer requires that water."
      # ```
      # 
      # ```ruby
      # Faker::Books::Dune.quote(character: "baron_harkonnen")
      #   #=> "He who controls the spice, controls the universe!"
      # ```
      sig { params(legacy_character: T.untyped, character: T.nilable(String)).returns(String) }
      def self.quote(legacy_character = NOT_GIVEN, character: nil); end

      # Produces a saying from Dune
      # 
      # _@param_ `source` — 
      # 
      # ```ruby
      # Faker::Books::Dune.saying #=> "You do not beg the sun for mercy."
      # ```
      # 
      # ```ruby
      # Faker::Books::Dune.saying(source: "fremen")
      #   #=> "May thy knife chip and shatter."
      # ```
      sig { params(legacy_source: T.untyped, source: T.nilable(String)).returns(String) }
      def self.saying(legacy_source = NOT_GIVEN, source: nil); end
    end

    class Lovecraft < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a location
      # 
      # ```ruby
      # Faker::Books::Lovecraft.location #=> "Kingsport"
      # ```
      sig { returns(String) }
      def self.location; end

      # _@param_ `number` — The number of times to repeat the chant
      # 
      # ```ruby
      # Faker::Books::Lovecraft.fhtagn
      #   #=> "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn"
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.fhtagn(number: 3)
      #   #=> "Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fht...
      # ```
      sig { params(legacy_number: T.untyped, number: Integer).returns(String) }
      def self.fhtagn(legacy_number = NOT_GIVEN, number: 1); end

      # Produces the name of a deity
      # 
      # ```ruby
      # Faker::Books::Lovecraft.deity #=> "Shub-Niggurath"
      # ```
      sig { returns(String) }
      def self.deity; end

      # Produces the name of a tome
      # 
      # ```ruby
      # Faker::Books::Lovecraft.tome #=> "Book of Eibon"
      # ```
      sig { returns(String) }
      def self.tome; end

      # Produces a random sentence
      # 
      # _@param_ `word_count` — The number of words to have in the sentence
      # 
      # _@param_ `random_words_to_add` — 
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentence
      #   #=> "Furtive antiquarian squamous dank cat loathsome amorphous lurk."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentence(word_count: 3)
      #   #=> "Daemoniac antediluvian fainted squamous comprehension gambrel nameless singular."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentence(word_count: 3, random_words_to_add: 1)
      #   #=> "Amorphous indescribable tenebrous."
      # ```
      sig do
        params(
          legacy_word_count: T.untyped,
          legacy_random_words_to_add: T.untyped,
          word_count: Integer,
          random_words_to_add: Integer
        ).returns(String)
      end
      def self.sentence(legacy_word_count = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, random_words_to_add: 6); end

      # Produces a random word
      # 
      # ```ruby
      # Faker::Books::Lovecraft.word #=> "furtive"
      # ```
      sig { returns(String) }
      def self.word; end

      # Produces a array of random words
      # 
      # _@param_ `number` — Number of words to generate
      # 
      # _@param_ `spaces_allowed` — If true, generated words can contain spaces
      # 
      # ```ruby
      # Faker::Books::Lovecraft.words
      # #=> [
      # #     "manuscript",
      # #     "abnormal",
      # #     "singular",
      # #   ]
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.words(number: 2)
      # #=> [
      # #     "daemoniac",
      # #     "cat",
      # #   ]
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.words(number: 2, spaces_allowed: 1)
      # #=> [
      # #     "lurk",
      # #     "charnel",
      # #   ]
      # ```
      sig do
        params(
          legacy_number: T.untyped,
          legacy_spaces_allowed: T.untyped,
          number: Integer,
          spaces_allowed: T::Boolean
        ).returns(T::Array[String])
      end
      def self.words(legacy_number = NOT_GIVEN, legacy_spaces_allowed = NOT_GIVEN, number: 3, spaces_allowed: false); end

      # Produces a array of random sentences
      # 
      # _@param_ `number` — Number of sentences to generate
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentences
      # #=> [
      # #     "Nameless loathsome decadent gambrel.",
      # #     "Ululate swarthy immemorial cat madness gibbous unmentionable unnamable.",
      # #     "Decadent antediluvian non-euclidean tentacles amorphous tenebrous.",
      # #   ]
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.sentences(number: 2)
      # #=> [
      # #     "Antediluvian amorphous unmentionable singular accursed squamous immemorial.",
      # #     "Gambrel daemoniac gibbous stygian shunned ululate iridescence abnormal.",
      # #   ]
      # ```
      sig { params(legacy_number: T.untyped, number: Integer).returns(T::Array[String]) }
      def self.sentences(legacy_number = NOT_GIVEN, number: 3); end

      # Produces a random paragraph
      # 
      # _@param_ `sentence_count` — Number of sentences to generate
      # 
      # _@param_ `random_sentences_to_add` — 
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph
      #   #=> "Squamous nameless daemoniac fungus ululate. Cyclopean stygian decadent loathsome manuscript tenebrous. Foetid abnormal stench. Dank non-euclidean comprehension eldritch. Charnel singular shunned lurk effulgence fungus."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph(sentence_count: 2)
      #   #=> "Decadent lurk tenebrous loathsome furtive spectral amorphous gibbous. Gambrel eldritch daemoniac cat madness comprehension stygian effulgence."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph(sentence_count: 1, random_sentences_to_add: 1)
      #   #=> "Stench cyclopean fainted antiquarian nameless. Antiquarian ululate tenebrous non-euclidean effulgence."
      # ```
      sig do
        params(
          legacy_sentence_count: T.untyped,
          legacy_random_sentences_to_add: T.untyped,
          sentence_count: Integer,
          random_sentences_to_add: Integer
        ).returns(String)
      end
      def self.paragraph(legacy_sentence_count = NOT_GIVEN, legacy_random_sentences_to_add = NOT_GIVEN, sentence_count: 3, random_sentences_to_add: 3); end

      # Produces a array of random paragraphs
      # 
      # _@param_ `number` — Number of paragraphs to generate
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraphs
      # #=> [
      # #     "Noisome daemoniac gibbous abnormal antediluvian. Unutterable fung...
      # #     "Non-euclidean immemorial indescribable accursed furtive. Dank unn...
      # #     "Charnel antediluvian unnamable cat blasphemous comprehension tene...
      # #   ]
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraphs(number: 2)
      # #=> [
      # #     "Hideous amorphous manuscript antediluvian non-euclidean cat eldri...
      # #     "Tenebrous unnamable comprehension antediluvian lurk. Lurk spectra...
      # #   ]
      # ```
      sig { params(legacy_number: T.untyped, number: Integer).returns(T::Array[String]) }
      def self.paragraphs(legacy_number = NOT_GIVEN, number: 3); end

      # _@param_ `characters` — Number of characters to generate in the paragraph
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph_by_chars
      #   #=> "Truffaut stumptown trust fund 8-bit messenger bag portland. Meh kombucha selvage swag biodiesel. Lomo kinfolk jean shorts asymmetrical diy. Wayfarers portland twee stumptown. Wes anderson biodiesel retro 90's pabst. Diy echo 90's mixtape semiotics. Cornho."
      # ```
      # 
      # ```ruby
      # Faker::Books::Lovecraft.paragraph_by_chars(characters: 128)
      #   #=> "Effulgence madness noisome. Fungus stygian mortal madness amorphous dank. Decadent noisome hideous effulgence. Tentacles charne."
      # ```
      sig { params(legacy_characters: T.untyped, characters: Integer).returns(String) }
      def self.paragraph_by_chars(legacy_characters = NOT_GIVEN, characters: 256); end
    end

    class CultureSeries < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # ```ruby
      # Faker::Books::CultureSeries.book
      #   #=> "The Player of Games"
      # ```
      sig { returns(String) }
      def self.book; end

      # ```ruby
      # Faker::Books::CultureSeries.culture_ship
      #   #=> "Fate Amenable To Change"
      # ```
      sig { returns(String) }
      def self.culture_ship; end

      # ```ruby
      # Faker::Books::CultureSeries.culture_ship_class
      #   #=> "General Systems Vehicle"
      # ```
      sig { returns(String) }
      def self.culture_ship_class; end

      # ```ruby
      # Faker::Books::CultureSeries.culture_ship_class_abv
      #   #=> "The Odd Sister"
      # ```
      sig { returns(String) }
      def self.culture_ship_class_abv; end

      # ```ruby
      # Faker::Books::CultureSeries.civ
      #   #=> "Culture"
      # ```
      sig { returns(String) }
      def self.civ; end

      # ```ruby
      # Faker::Books::CultureSeries.planet
      #   #=> "Xinth"
      # ```
      sig { returns(String) }
      def self.planet; end
    end
  end

  class Games
    class Dota < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a hero from Dota.
      # 
      # ```ruby
      # Faker::Games::Dota.hero #=> "Abaddon"
      # ```
      sig { returns(String) }
      def self.hero; end

      # Produces the name of an item from Dota.
      # 
      # ```ruby
      # Faker::Games::Dota.item #=> "Armlet of Mordiggian"
      # ```
      sig { returns(String) }
      def self.item; end

      # Produces the name of a professional Dota team.
      # 
      # ```ruby
      # Faker::Games::Dota.team #=> "Evil Geniuses"
      # ```
      sig { returns(String) }
      def self.team; end

      # Produces the name of a professional Dota player.
      # 
      # ```ruby
      # Faker::Games::Dota.player #=> "Dendi"
      # ```
      sig { returns(String) }
      def self.player; end

      # Produces the name of a hero from Dota.
      # 
      # _@param_ `hero` — The name of a Dota hero.
      # 
      # ```ruby
      # Faker::Games::Dota.quote #=> "You have called death upon yourself."
      # Faker::Games::Dota.quote(hero: 'alchemist') #=> "Better living through alchemy!"
      # ```
      sig { params(legacy_hero: T.untyped, hero: String).returns(String) }
      def self.quote(legacy_hero = NOT_GIVEN, hero: 'abaddon'); end
    end

    class Myst < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a game from the Myst series.
      # 
      # ```ruby
      # Faker::Games::Myst.game #=> "Myst III: Exile"
      # ```
      sig { returns(String) }
      def self.game; end

      # Produces the name of a creature from Myst.
      # 
      # ```ruby
      # Faker::Games::Myst.creature #=> "squee"
      # ```
      sig { returns(String) }
      def self.creature; end

      # Produces the name of an age from Myst.
      # 
      # ```ruby
      # Faker::Games::Myst.age #=> "Relto"
      # ```
      sig { returns(String) }
      def self.age; end

      # Produces the name of a chracter from Myst.
      # 
      # ```ruby
      # Faker::Games::Myst.character #=> "Gehn"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from Myst.
      # 
      # ```ruby
      # Faker::Games::Myst.quote #=> "I realized, the moment I fell into the fissure, that the Book would not be destroyed as I had planned."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class Zelda < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a Legend of Zelda game.
      # 
      # ```ruby
      # Faker::Games::Zelda.game #=> "Breath of the Wild"
      # ```
      sig { returns(String) }
      def self.game; end

      # Produces the name of a character from the Legend of Zelda games.
      # 
      # ```ruby
      # Faker::Games::Zelda.character #=> "Link"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces the name of a character from the Legend of Zelda games.
      # 
      # ```ruby
      # Faker::Games::Zelda.location #=> "Hyrule Castle"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces the name of an item from the Legend of Zelda games.
      # 
      # ```ruby
      # Faker::Games::Zelda.item #=> "Boomerang"
      # ```
      sig { returns(String) }
      def self.item; end
    end

    class Heroes < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a hero from Heroes 3.
      # 
      # ```ruby
      # Faker::Games::Heroes.name #=> "Christian"
      # ```
      sig { returns(String) }
      def self.name; end

      # Produces the name of a specialty from Heroes 3.
      # 
      # ```ruby
      # Faker::Games::Heroes.specialty #=> "Ballista"
      # ```
      sig { returns(String) }
      def self.specialty; end

      # Produces the name of a class from Heroes 3.
      # 
      # ```ruby
      # Faker::Games::Heroes.klass #=> "Knight"
      # ```
      sig { returns(String) }
      def self.klass; end
    end

    class Fallout < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a character from the Fallout games.
      # 
      # ```ruby
      # Faker::Games::Fallout.character #=> "Liberty Prime"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces the name of a faction from the Fallout games.
      # 
      # ```ruby
      # Faker::Games::Fallout.faction #=> "Brotherhood of Steel"
      # ```
      sig { returns(String) }
      def self.faction; end

      # Produces the name of a location from the Fallout games.
      # 
      # ```ruby
      # Faker::Games::Fallout.location #=> "New Vegas"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from the Fallout games.
      # 
      # ```ruby
      # Faker::Games::Fallout.quote
      #   #=> "Democracy is non-negotiable"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class Pokemon < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a Pokemon.
      # 
      # ```ruby
      # Faker::Games::Pokemon.name #=> "Pikachu"
      # ```
      sig { returns(String) }
      def self.name; end

      # Produces a location from Pokemon.
      # 
      # ```ruby
      # Faker::Games::Pokemon.location #=> "Pallet Town"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a move from Pokemon.
      # 
      # ```ruby
      # Faker::Games::Pokemon.move #=> "Thunder Shock"
      # ```
      sig { returns(String) }
      def self.move; end
    end

    class Witcher < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a character from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.character #=> "Triss Merigold"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces the name of a witcher from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.witcher #=> "Geralt of Rivia"
      # ```
      sig { returns(String) }
      def self.witcher; end

      # Produces the name of a school from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.school #=> "Wolf"
      # ```
      sig { returns(String) }
      def self.school; end

      # Produces the name of a location from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.location #=> "Novigrad"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.quote #=> "No Lollygagin'!"
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces the name of a monster from The Witcher.
      # 
      # ```ruby
      # Faker::Games::Witcher.monster #=> "Katakan"
      # ```
      sig { returns(String) }
      def self.monster; end
    end

    class HalfLife < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a character from the Half-Life games.
      # 
      # ```ruby
      # Faker::Games::HalfLife.character #=> "Gordon Freeman"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces the name of an enemy from the Half-Life games.
      # 
      # ```ruby
      # Faker::Games::HalfLife.enemy #=> "Headcrab"
      # ```
      sig { returns(String) }
      def self.enemy; end

      # Produces the name of a location from the Half-Life games.
      # 
      # ```ruby
      # Faker::Games::HalfLife.location #=> "Black Mesa Research Facility"
      # ```
      sig { returns(String) }
      def self.location; end
    end

    class Overwatch < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a hero from Overwatch.
      # 
      # ```ruby
      # Faker::Games::Overwatch.hero #=> "Tracer"
      # ```
      sig { returns(String) }
      def self.hero; end

      # Produces the name of a location from Overwatch.
      # 
      # ```ruby
      # Faker::Games::Overwatch.location #=> "Numbani"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from Overwatch.
      # 
      # ```ruby
      # Faker::Games::Overwatch.quote #=> "It's high noon"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class ElderScrolls < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a race from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.race #=> "Argonian"
      # ```
      sig { returns(String) }
      def self.race; end

      # Produces the name of a city from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.city #=> "Whiterun"
      # ```
      sig { returns(String) }
      def self.city; end

      # Produces the name of a creature from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.creature #=> "Frost Troll"
      # ```
      sig { returns(String) }
      def self.creature; end

      # Produces the name of a region from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.region #=> "Cyrodiil"
      # ```
      sig { returns(String) }
      def self.region; end

      # Produces the name of a dragon from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.dragon #=> "Blood Dragon"
      # ```
      sig { returns(String) }
      def self.dragon; end

      # Produces a randomly generated name from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.name #=> "Balgruuf The Old"
      # ```
      sig { returns(String) }
      def self.name; end

      # Produces a first name from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.first_name #=> "Balgruuf"
      # ```
      sig { returns(String) }
      def self.first_name; end

      # Produces a last name from the Elder Scrolls universe.
      # 
      # ```ruby
      # Faker::Games::ElderScrolls.last_name #=> "The Old"
      # ```
      sig { returns(String) }
      def self.last_name; end
    end

    class SuperSmashBros < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a fighter from the Smash Bros games.
      # 
      # ```ruby
      # Faker::Games::SuperSmashBros.fighter #=> "Mario"
      # ```
      sig { returns(String) }
      def self.fighter; end

      # Produces the name of a stage from the Smash Bros games.
      # 
      # ```ruby
      # Faker::Games::SuperSmashBros.stage #=> "Final Destination"
      # ```
      sig { returns(String) }
      def self.stage; end
    end

    class LeagueOfLegends < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a champion from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.champion #=> "Jarvan IV"
      # ```
      sig { returns(String) }
      def self.champion; end

      # Produces a location from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.location #=> "Demacia"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.quote #=> "Purge the unjust."
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces a summoner spell from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.summoner_spell #=> "Flash"
      # ```
      sig { returns(String) }
      def self.summoner_spell; end

      # Produces a mastery from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.masteries #=> "Double Edged Sword"
      # ```
      sig { returns(String) }
      def self.masteries; end

      # Produces a rank from League of Legends.
      # 
      # ```ruby
      # Faker::Games::LeagueOfLegends.rank #=> "Bronze V"
      # ```
      sig { returns(String) }
      def self.rank; end
    end

    class WorldOfWarcraft < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a hero from World of Warcraft.
      # 
      # ```ruby
      # Faker::Games::WorldOfWarcraft.hero #=> "Uther the Lightbringer"
      # ```
      sig { returns(String) }
      def self.hero; end

      # Produces a quote from World of Warcraft.
      # 
      # ```ruby
      # Faker::Games::WorldOfWarcraft.quote #=> "These are dark times indeed."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class SonicTheHedgehog < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a character from Sonic the Hedgehog.
      # 
      # ```ruby
      # Faker::Games::SonicTheHedgehog.character #=> "Sonic the Hedgehog"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces the name of a zone from Sonic the Hedgehog.
      # 
      # ```ruby
      # Faker::Games::SonicTheHedgehog.zone #=> "Green Hill Zone"
      # ```
      sig { returns(String) }
      def self.zone; end

      # Produces the name of a game from the Sonic the Hedgehog series.
      # 
      # ```ruby
      # Faker::Games::SonicTheHedgehog.game #=> "Waku Waku Sonic Patrol Car"
      # ```
      sig { returns(String) }
      def self.game; end
    end

    class HeroesOfTheStorm < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a battleground from Heroes of the Storm.
      # 
      # ```ruby
      # Faker::Games::HeroesOfTheStorm.battleground #=> "Towers of Doom"
      # ```
      sig { returns(String) }
      def self.battleground; end

      # Produces a class from Heroes of the Storm.
      # 
      # ```ruby
      # Faker::Games::HeroesOfTheStorm.class #=> "Support"
      # ```
      sig { returns(String) }
      def self.class; end

      # Produces a hero from Heroes of the Storm.
      # 
      # ```ruby
      # Faker::Games::HeroesOfTheStorm.hero #=> "Illidan"
      # ```
      sig { returns(String) }
      def self.hero; end

      # Produces a quote from Heroes of the Storm.
      # 
      # ```ruby
      # Faker::Games::HeroesOfTheStorm.quote #=> "MEAT!!!"
      # ```
      sig { returns(String) }
      def self.quote; end
    end
  end

  class Game < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a video game.
    # 
    # ```ruby
    # Faker::Game.title #=> "Half-Life 2"
    # ```
    sig { returns(String) }
    def self.title; end

    # Produces the name of a video game genre.
    # 
    # ```ruby
    # Faker::Game.genre #=> "Real-time strategy"
    # ```
    sig { returns(String) }
    def self.genre; end

    # Produces the name of a video game console or platform.
    # 
    # ```ruby
    # Faker::Game.platform #=> "Nintendo Switch"
    # ```
    sig { returns(String) }
    def self.platform; end
  end

  class App < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces an app name.
    # 
    # ```ruby
    # Faker::App.name #=> "Treeflex"
    # ```
    sig { returns(String) }
    def self.name; end

    # Produces a version string.
    # 
    # ```ruby
    # Faker::App.version #=> "1.85"
    # ```
    sig { returns(String) }
    def self.version; end

    # Produces the name of an app's author.
    # 
    # ```ruby
    # Faker::App.author #=> "Daphne Swift"
    # ```
    sig { returns(String) }
    def self.author; end

    # Produces a String representing a semantic version identifier.
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `major` — An integer to use or a range to pick the integer from.
    # 
    # _@param_ `minor` — An integer to use or a range to pick the integer from.
    # 
    # _@param_ `patch` — An integer to use or a range to pick the integer from.
    # 
    # ```ruby
    # Faker::App.semantic_version #=> "3.2.5"
    # ```
    # 
    # ```ruby
    # Faker::App.semantic_version(major: 42) #=> "42.5.2"
    # ```
    # 
    # ```ruby
    # Faker::App.semantic_version(minor: 100..101) #=> "42.100.4"
    # ```
    # 
    # ```ruby
    # Faker::App.semantic_version(patch: 5..6) #=> "7.2.6"
    # ```
    sig do
      params(
        legacy_major: T.untyped,
        legacy_minor: T.untyped,
        legacy_patch: T.untyped,
        major: T.any(Integer, T::Range[T.untyped]),
        minor: T.any(Integer, T::Range[T.untyped]),
        patch: T.any(Integer, T::Range[T.untyped])
      ).returns(String)
    end
    def self.semantic_version(legacy_major = NOT_GIVEN, legacy_minor = NOT_GIVEN, legacy_patch = NOT_GIVEN, major: 0..9, minor: 0..9, patch: 1..9); end
  end

  class Job < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.title; end

    sig { returns(T.untyped) }
    def self.position; end

    sig { returns(T.untyped) }
    def self.field; end

    sig { returns(T.untyped) }
    def self.key_skill; end
  end

  class NationalHealthService < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.british_number; end

    sig { params(legacy_number: T.untyped, number: T.untyped).returns(T.untyped) }
    def self.check_digit(legacy_number = NOT_GIVEN, number: 0); end
  end

  # A generator of titles of operas by Verdi, Rossini, Donizetti and Bellini
  class Music < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.key; end

    sig { returns(T.untyped) }
    def self.chord; end

    sig { returns(T.untyped) }
    def self.instrument; end

    sig { returns(T.untyped) }
    def self.keys; end

    sig { returns(T.untyped) }
    def self.key_variants; end

    sig { returns(T.untyped) }
    def self.key_types; end

    sig { returns(T.untyped) }
    def self.chord_types; end

    sig { returns(T.untyped) }
    def self.band; end

    sig { returns(T.untyped) }
    def self.album; end

    sig { returns(T.untyped) }
    def self.genre; end

    class Opera < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      sig { returns(T.untyped) }
      def self.verdi; end

      sig { returns(T.untyped) }
      def self.rossini; end

      sig { returns(T.untyped) }
      def self.donizetti; end

      sig { returns(T.untyped) }
      def self.bellini; end
    end

    class Phish < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a song by Phish.
      # 
      # ```ruby
      # Faker::Music::Phish.song #=> "Tweezer"
      # ```
      sig { returns(String) }
      def self.song; end
    end

    class RockBand < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a rock band.
      # 
      # ```ruby
      # Faker::Music::RockBand.name #=> "Led Zeppelin"
      # ```
      sig { returns(String) }
      def self.name; end
    end

    class GratefulDead < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a member of The Grateful Dead.
      # 
      # ```ruby
      # Faker::Music::GratefulDead.player #=> "Jerry Garcia"
      # ```
      sig { returns(String) }
      def self.player; end

      # Produces the name of a song by The Grateful Dead.
      # 
      # ```ruby
      # Faker::Music::GratefulDead.song #=> "Cassidy"
      # ```
      sig { returns(String) }
      def self.song; end
    end

    class UmphreysMcgee < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a song by Umphrey's McGee.
      # 
      # ```ruby
      # Faker::Music::UmphreysMcgee.song #=> "Dump City"
      # ```
      sig { returns(String) }
      def self.song; end
    end
  end

  class Creature
    class Cat < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a random name for a cat
      # 
      # ```ruby
      # Faker::Creature::Cat.name #=> "Felix"
      # ```
      sig { returns(String) }
      def self.name; end

      # Produces a random cat breed
      # 
      # ```ruby
      # Faker::Creature::Cat.breed #=> "Scottish Fold"
      # ```
      sig { returns(String) }
      def self.breed; end

      # Produces a random cat breed registry
      # 
      # ```ruby
      # Faker::Creature::Cat.registry #=> "Fancy Southern Africa Cat Council"
      # ```
      sig { returns(String) }
      def self.registry; end
    end

    class Dog < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a random name for a dog
      # 
      # ```ruby
      # Faker::Creature::Dog.name #=> "Spike"
      # ```
      sig { returns(String) }
      def self.name; end

      # Produces a random dog breed
      # 
      # ```ruby
      # Faker::Creature::Dog.breed #=> "Yorkshire Terrier"
      # ```
      sig { returns(String) }
      def self.breed; end

      # Produces a random sound made by a dog
      # 
      # ```ruby
      # Faker::Creature::Dog.sound #=> "woof woof"
      # ```
      sig { returns(String) }
      def self.sound; end

      # Produces a random dog meme phrase
      # 
      # ```ruby
      # Faker::Creature::Dog.meme_phrase #=> "smol pupperino"
      # ```
      sig { returns(String) }
      def self.meme_phrase; end

      # Produces a random dog age
      # 
      # ```ruby
      # Faker::Creature::Dog.age #=> "puppy"
      # ```
      sig { returns(String) }
      def self.age; end

      # Produces a random gender
      # 
      # ```ruby
      # Faker::Creature::Dog.gender #=> "Female"
      # ```
      sig { returns(String) }
      def self.gender; end

      # Produces a random coat length
      # 
      # ```ruby
      # Faker::Creature::Dog.coat_length #=> "short"
      # ```
      sig { returns(String) }
      def self.coat_length; end

      # Produces a random size of a dog
      # 
      # ```ruby
      # Faker::Creature::Dog.size #=> "small"
      # ```
      sig { returns(String) }
      def self.size; end
    end

    class Horse < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a random name for a horse
      # 
      # ```ruby
      # Faker::Creature::Horse.name #=> "Noir"
      # ```
      sig { returns(String) }
      def self.name; end

      # Produces a random horse breed
      # 
      # ```ruby
      # Faker::Creature::Horse.breed #=> "Spanish Barb see Barb Horse"
      # ```
      sig { returns(String) }
      def self.breed; end
    end

    class Animal < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a random animal name
      # 
      # ```ruby
      # Faker::Creature::Animal.name #=> "fly"
      # ```
      sig { returns(String) }
      def self.name; end
    end
  end

  class Bank < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_digits: T.untyped, digits: T.untyped).returns(T.untyped) }
    def self.account_number(legacy_digits = NOT_GIVEN, digits: 10); end

    sig { params(legacy_country_code: T.untyped, country_code: T.untyped).returns(T.untyped) }
    def self.iban(legacy_country_code = NOT_GIVEN, country_code: 'GB'); end

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.routing_number; end

    sig { returns(T.untyped) }
    def self.routing_number_with_format; end

    sig { returns(T.untyped) }
    def self.swift_bic; end

    sig { params(num_string: T.untyped).returns(T.untyped) }
    def self.checksum(num_string); end

    sig { returns(T.untyped) }
    def self.compile_routing_number; end

    # Calculates the mandatory checksum in 3rd and 4th characters in IBAN format
    # source: https://en.wikipedia.org/wiki/International_Bank_Account_Number#Validating_the_IBAN
    sig { params(country_code: T.untyped, account: T.untyped).returns(T.untyped) }
    def self.iban_checksum(country_code, account); end

    sig { returns(T.untyped) }
    def self.valid_routing_number; end

    sig { params(routing_num: T.untyped).returns(T.untyped) }
    def self.compile_fraction(routing_num); end

    sig { returns(T.untyped) }
    def self.rand_numstring; end
  end

  class Beer < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.style; end

    sig { returns(T.untyped) }
    def self.hop; end

    sig { returns(T.untyped) }
    def self.yeast; end

    sig { returns(T.untyped) }
    def self.malts; end

    sig { returns(T.untyped) }
    def self.ibu; end

    sig { returns(T.untyped) }
    def self.alcohol; end

    sig { returns(T.untyped) }
    def self.blg; end
  end

  class Code < Faker::Base
    RBI = T.let(%w[01 10 30 33 35 44 45 49 50 51 52 53 54 86 91 98 99].freeze, T.untyped)
    EAN_CHECK_DIGIT8 = T.let([3, 1, 3, 1, 3, 1, 3].freeze, T.untyped)
    EAN_CHECK_DIGIT13 = T.let([1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3].freeze, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Generates a 10 digit NPI (National Provider Identifier
    # issued to health care providers in the United States)
    sig { returns(T.untyped) }
    def self.npi; end

    # By default generates 10 sign isbn code in format 123456789-X
    # You can pass 13 to generate new 13 sign code
    sig { params(legacy_base: T.untyped, base: T.untyped).returns(T.untyped) }
    def self.isbn(legacy_base = NOT_GIVEN, base: 10); end

    # By default generates 13 sign ean code in format 1234567890123
    # You can pass 8 to generate ean8 code
    sig { params(legacy_base: T.untyped, base: T.untyped).returns(T.untyped) }
    def self.ean(legacy_base = NOT_GIVEN, base: 13); end

    sig { returns(T.untyped) }
    def self.rut; end

    # By default generates a Singaporean NRIC ID for someone
    # who is born between the age of 18 and 65.
    sig do
      params(
        legacy_min_age: T.untyped,
        legacy_max_age: T.untyped,
        min_age: T.untyped,
        max_age: T.untyped
      ).returns(T.untyped)
    end
    def self.nric(legacy_min_age = NOT_GIVEN, legacy_max_age = NOT_GIVEN, min_age: 18, max_age: 65); end

    # Generate GSM modem, device or mobile phone 15 digit IMEI number.
    sig { returns(T.untyped) }
    def self.imei; end

    # Retrieves a real Amazon ASIN code list taken from
    # https://archive.org/details/asin_listing
    sig { returns(T.untyped) }
    def self.asin; end

    # Generates Social Insurance Number issued in Canada
    # https://en.wikipedia.org/wiki/Social_Insurance_Number
    sig { returns(T.untyped) }
    def self.sin; end

    sig { returns(T.untyped) }
    def self.generate_imei; end

    sig { returns(T.untyped) }
    def self.generate_base10_isbn; end

    sig { returns(T.untyped) }
    def self.generate_base13_isbn; end

    sig { params(values: T.untyped).returns(T.untyped) }
    def self.sum(values); end

    sig { returns(T.untyped) }
    def self.generate_base8_ean; end

    sig { returns(T.untyped) }
    def self.generate_base13_ean; end

    sig { params(rut: T.untyped).returns(T.untyped) }
    def self.rut_verificator_digit(rut); end

    sig { params(values: T.untyped, prefix: T.untyped).returns(T.untyped) }
    def self.generate_nric_check_alphabet(values, prefix); end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.generate_sin_check_digit(digits); end
  end

  class Coin < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.flip; end
  end

  class Date < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: T.untyped,
        to: T.untyped
      ).returns(T.untyped)
    end
    def self.between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from:, to:); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        legacy_excepted: T.untyped,
        from: T.untyped,
        to: T.untyped,
        excepted: T.untyped
      ).returns(T.untyped)
    end
    def self.between_except(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, legacy_excepted = NOT_GIVEN, from:, to:, excepted:); end

    sig { params(legacy_days: T.untyped, days: T.untyped).returns(T.untyped) }
    def self.forward(legacy_days = NOT_GIVEN, days: 365); end

    sig { params(legacy_days: T.untyped, days: T.untyped).returns(T.untyped) }
    def self.backward(legacy_days = NOT_GIVEN, days: 365); end

    sig do
      params(
        legacy_min_age: T.untyped,
        legacy_max_age: T.untyped,
        min_age: T.untyped,
        max_age: T.untyped
      ).returns(T.untyped)
    end
    def self.birthday(legacy_min_age = NOT_GIVEN, legacy_max_age = NOT_GIVEN, min_age: 18, max_age: 65); end

    sig { params(date: T.untyped, age: T.untyped).returns(T.untyped) }
    def self.birthday_date(date, age); end

    sig { params(date: T.untyped).returns(T.untyped) }
    def self.get_date_object(date); end
  end

  class File < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_segment_count: T.untyped,
        legacy_root: T.untyped,
        legacy_directory_separator: T.untyped,
        segment_count: T.untyped,
        root: T.untyped,
        directory_separator: T.untyped
      ).returns(T.untyped)
    end
    def self.dir(legacy_segment_count = NOT_GIVEN, legacy_root = NOT_GIVEN, legacy_directory_separator = NOT_GIVEN, segment_count: 3, root: nil, directory_separator: '/'); end

    sig { returns(T.untyped) }
    def self.extension; end

    sig { returns(T.untyped) }
    def self.mime_type; end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_dir: T.untyped,
        legacy_name: T.untyped,
        legacy_ext: T.untyped,
        legacy_directory_separator: T.untyped,
        dir: T.untyped,
        name: T.untyped,
        ext: T.untyped,
        directory_separator: T.untyped
      ).returns(T.untyped)
    end
    def self.file_name(legacy_dir = NOT_GIVEN, legacy_name = NOT_GIVEN, legacy_ext = NOT_GIVEN, legacy_directory_separator = NOT_GIVEN, dir: nil, name: nil, ext: nil, directory_separator: '/'); end
  end

  class Food < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Retrieves a typical dish from each country
    sig { returns(T.untyped) }
    def self.dish; end

    # Retrieves a description about some dish
    sig { returns(T.untyped) }
    def self.description; end

    # Retrieves an ingredient
    sig { returns(T.untyped) }
    def self.ingredient; end

    # Retrieves a fruit
    sig { returns(T.untyped) }
    def self.fruits; end

    # Retrieves a vegetable
    sig { returns(T.untyped) }
    def self.vegetables; end

    # Retrieves some random spice
    sig { returns(T.untyped) }
    def self.spice; end

    # Retrieves cooking measures
    sig { returns(T.untyped) }
    def self.measurement; end

    # Retrieves metric mesurements
    sig { returns(T.untyped) }
    def self.metric_measurement; end
  end

  class Json < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig do
      params(
        legacy_width: T.untyped,
        legacy_options: T.untyped,
        width: T.untyped,
        options: T.untyped
      ).returns(T.untyped)
    end
    def self.shallow_json(legacy_width = NOT_GIVEN, legacy_options = NOT_GIVEN, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' }); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_json: T.untyped,
        legacy_width: T.untyped,
        legacy_options: T.untyped,
        json: T.untyped,
        width: T.untyped,
        options: T.untyped
      ).returns(T.untyped)
    end
    def self.add_depth_to_json(legacy_json = NOT_GIVEN, legacy_width = NOT_GIVEN, legacy_options = NOT_GIVEN, json: shallow_json, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' }); end

    sig { params(width: T.untyped, options: T.untyped).returns(T.untyped) }
    def self.build_shallow_hash(width, options); end

    sig do
      params(
        hash: T.untyped,
        key_array: T.untyped,
        width: T.untyped,
        options: T.untyped
      ).returns(T.untyped)
    end
    def self.add_hash_to_bottom(hash, key_array, width, options); end

    sig do
      params(
        key_array: T.untyped,
        hash: T.untyped,
        width: T.untyped,
        options: T.untyped
      ).returns(T.untyped)
    end
    def self.add_hash(key_array, hash, width, options); end

    sig { params(key_array: T.untyped).returns(T.untyped) }
    def self.build_keys_from_array(key_array); end
  end

  class Kpop < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.i_groups; end

    sig { returns(T.untyped) }
    def self.ii_groups; end

    sig { returns(T.untyped) }
    def self.iii_groups; end

    sig { returns(T.untyped) }
    def self.girl_groups; end

    sig { returns(T.untyped) }
    def self.boy_bands; end

    sig { returns(T.untyped) }
    def self.solo; end
  end

  class Name < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.name_with_middle; end

    sig { returns(T.untyped) }
    def self.first_name; end

    sig { returns(T.untyped) }
    def self.male_first_name; end

    sig { returns(T.untyped) }
    def self.female_first_name; end

    sig { returns(T.untyped) }
    def self.last_name; end

    sig { returns(T.untyped) }
    def self.prefix; end

    sig { returns(T.untyped) }
    def self.suffix; end

    sig { params(legacy_number: T.untyped, number: T.untyped).returns(T.untyped) }
    def self.initials(legacy_number = NOT_GIVEN, number: 3); end
  end

  class Team < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.creature; end

    sig { returns(T.untyped) }
    def self.state; end

    sig { returns(T.untyped) }
    def self.sport; end

    sig { returns(T.untyped) }
    def self.mascot; end
  end

  class Time < Faker::Base
    TIME_RANGES = T.let({
  all: (0..23),
  day: (9..17),
  night: (18..23),
  morning: (6..11),
  afternoon: (12..17),
  evening: (17..21),
  midnight: (0..4)
}.freeze, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        legacy_format: T.untyped,
        from: T.untyped,
        to: T.untyped,
        format: T.untyped
      ).returns(T.untyped)
    end
    def self.between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, legacy_format = NOT_GIVEN, from:, to:, format: nil); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        legacy_period: T.untyped,
        legacy_format: T.untyped,
        from: T.untyped,
        to: T.untyped,
        period: T.untyped,
        format: T.untyped
      ).returns(T.untyped)
    end
    def self.between_dates(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, from:, to:, period: :all, format: nil); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_days: T.untyped,
        legacy_period: T.untyped,
        legacy_format: T.untyped,
        days: T.untyped,
        period: T.untyped,
        format: T.untyped
      ).returns(T.untyped)
    end
    def self.forward(legacy_days = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, days: 365, period: :all, format: nil); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_days: T.untyped,
        legacy_period: T.untyped,
        legacy_format: T.untyped,
        days: T.untyped,
        period: T.untyped,
        format: T.untyped
      ).returns(T.untyped)
    end
    def self.backward(legacy_days = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, days: 365, period: :all, format: nil); end

    sig { params(date: T.untyped, period: T.untyped).returns(T.untyped) }
    def self.date_with_random_time(date, period); end

    sig { params(time: T.untyped, format: T.untyped).returns(T.untyped) }
    def self.time_with_format(time, format); end

    sig { params(period: T.untyped).returns(T.untyped) }
    def self.hours(period); end

    sig { returns(T.untyped) }
    def self.minutes; end

    sig { returns(T.untyped) }
    def self.seconds; end

    sig { params(time: T.untyped).returns(T.untyped) }
    def self.get_time_object(time); end
  end

  class Verb < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.base; end

    sig { returns(T.untyped) }
    def self.past; end

    sig { returns(T.untyped) }
    def self.past_participle; end

    sig { returns(T.untyped) }
    def self.simple_present; end

    sig { returns(T.untyped) }
    def self.ing_form; end
  end

  class Movie < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a quote from a movie.
    # 
    # ```ruby
    # Faker::Movie.quote #=> "Bumble bee tuna"
    # ```
    sig { returns(String) }
    def self.quote; end
  end

  class Quote < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.famous_last_words; end

    sig { returns(T.untyped) }
    def self.matz; end

    sig { returns(T.untyped) }
    def self.most_interesting_man_in_the_world; end

    sig { returns(T.untyped) }
    def self.robin; end

    sig { returns(T.untyped) }
    def self.singular_siegler; end

    # from: http://morecoolquotes.com/famous-yoda-quotes/
    sig { returns(T.untyped) }
    def self.yoda; end
  end

  class Color < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.hex_color; end

    sig { returns(T.untyped) }
    def self.color_name; end

    sig { returns(T.untyped) }
    def self.single_rgb_color; end

    sig { returns(T.untyped) }
    def self.rgb_color; end

    # returns [hue, saturation, lightness]
    sig { returns(T.untyped) }
    def self.hsl_color; end

    sig { returns(T.untyped) }
    def self.hsla_color; end
  end

  class House < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a piece of furniture.
    # 
    # ```ruby
    # Faker::House.furniture #=> "chair"
    # ```
    sig { returns(String) }
    def self.furniture; end

    # Produces the name of a room in a house.
    # 
    # ```ruby
    # Faker::House.room #=> "kitchen"
    # ```
    sig { returns(String) }
    def self.room; end
  end

  # Based on Perl's Text::Lorem
  class Lorem < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.word; end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.words(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false); end

    sig { returns(T.untyped) }
    def self.character; end

    # Produces a random string of alphanumeric characters
    # 
    # _@param_ `number` — The number of characters to generate
    # 
    # _@param_ `min_alpha` — The minimum number of alphabetic to add to the string
    # 
    # _@param_ `min_numeric` — The minimum number of numbers to add to the string
    # 
    # ```ruby
    # Faker::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5w..."
    # Faker::Lorem.characters(number: 10) #=> "ang9cbhoa8"
    # Faker::Lorem.characters(number: 10, min_alpha: 4) #=> "ang9cbhoa8"
    # Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) #=> "ang9cbhoa8"
    # ```
    sig do
      params(
        legacy_number: T.untyped,
        number: Integer,
        min_alpha: Integer,
        min_numeric: Integer
      ).returns(String)
    end
    def self.characters(legacy_number = NOT_GIVEN, number: 255, min_alpha: 0, min_numeric: 0); end

    sig { returns(T.untyped) }
    def self.multibyte; end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_word_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_words_to_add: T.untyped,
        word_count: T.untyped,
        supplemental: T.untyped,
        random_words_to_add: T.untyped
      ).returns(T.untyped)
    end
    def self.sentence(legacy_word_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, supplemental: false, random_words_to_add: 0); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.sentences(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_sentence_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_sentences_to_add: T.untyped,
        sentence_count: T.untyped,
        supplemental: T.untyped,
        random_sentences_to_add: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraph(legacy_sentence_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_sentences_to_add = NOT_GIVEN, sentence_count: 3, supplemental: false, random_sentences_to_add: 0); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraphs(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraph_by_chars(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 256, supplemental: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_word_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_words_to_add: T.untyped,
        word_count: T.untyped,
        supplemental: T.untyped,
        random_words_to_add: T.untyped
      ).returns(T.untyped)
    end
    def self.question(legacy_word_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, supplemental: false, random_words_to_add: 0); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.questions(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false); end

    sig { returns(T.untyped) }
    def self.locale_period; end

    sig { returns(T.untyped) }
    def self.locale_space; end

    sig { returns(T.untyped) }
    def self.locale_question_mark; end
  end

  class Space < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.planet; end

    sig { returns(T.untyped) }
    def self.moon; end

    sig { returns(T.untyped) }
    def self.galaxy; end

    sig { returns(T.untyped) }
    def self.nebula; end

    sig { returns(T.untyped) }
    def self.star_cluster; end

    sig { returns(T.untyped) }
    def self.constellation; end

    sig { returns(T.untyped) }
    def self.star; end

    sig { returns(T.untyped) }
    def self.agency; end

    sig { returns(T.untyped) }
    def self.agency_abv; end

    sig { returns(T.untyped) }
    def self.nasa_space_craft; end

    sig { returns(T.untyped) }
    def self.company; end

    sig { returns(T.untyped) }
    def self.distance_measurement; end

    sig { returns(T.untyped) }
    def self.meteorite; end

    sig { returns(T.untyped) }
    def self.launch_vehicle; end
  end

  class Types < Faker::Base
    CHARACTERS = T.let(('0'..'9').to_a + ('a'..'z').to_a, T.untyped)
    SIMPLE_TYPES = T.let(%i[string fixnum].freeze, T.untyped)
    COMPLEX_TYPES = T.let(%i[hash array].freeze, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_words: T.untyped, words: T.untyped).returns(T.untyped) }
    def self.rb_string(legacy_words = NOT_GIVEN, words: 1); end

    sig { returns(T.untyped) }
    def self.character; end

    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: T.untyped,
        to: T.untyped
      ).returns(T.untyped)
    end
    def self.rb_integer(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 0, to: 100); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_type: T.untyped,
        number: T.untyped,
        type: T.untyped
      ).returns(T.untyped)
    end
    def self.rb_hash(legacy_number = NOT_GIVEN, legacy_type = NOT_GIVEN, number: 1, type: random_type); end

    sig { params(legacy_number: T.untyped, number: T.untyped).returns(T.untyped) }
    def self.complex_rb_hash(legacy_number = NOT_GIVEN, number: 1); end

    sig { params(legacy_len: T.untyped, len: T.untyped).returns(T.untyped) }
    def self.rb_array(legacy_len = NOT_GIVEN, len: 1); end

    sig { returns(T.untyped) }
    def self.random_type; end

    sig { returns(T.untyped) }
    def self.random_complex_type; end

    sig { params(word: T.untyped).returns(T.untyped) }
    def self.titleize(word); end
  end

  class Movies
    class Hobbit < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a character from The Hobbit.
      # 
      # ```ruby
      # Faker::Movies::Hobbit.character #=> "Gandalf the Grey"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces the name of one of the 13 dwarves from the Company, or Gandalf or Bilbo.
      # 
      # ```ruby
      # Faker::Movies::Hobbit.thorins_company #=> "Thorin Oakenshield"
      # ```
      sig { returns(String) }
      def self.thorins_company; end

      # Produces a quote from The Hobbit.
      # 
      # ```ruby
      # Faker::Movies::Hobbit.quote
      #   #=> "Never laugh at live dragons, Bilbo you fool!"
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces the name of a location from The Hobbit.
      # 
      # ```ruby
      # Faker::Movies::Hobbit.location #=> "The Shire"
      # ```
      sig { returns(String) }
      def self.location; end
    end

    class Lebowski < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces an actor from The Big Lebowski.
      # 
      # ```ruby
      # Faker::Movies::Lebowski.actor #=> "John Goodman"
      # ```
      sig { returns(String) }
      def self.actor; end

      # Produces a character from The Big Lebowski.
      # 
      # ```ruby
      # Faker::Movies::Lebowski.character #=> "Jackie Treehorn"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from The Big Lebowski.
      # 
      # ```ruby
      # Faker::Movies::Lebowski.quote #=> "Forget it, Donny, you're out of your element!"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class StarWars < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a call squadron from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.call_squadron #=> "Green"
      # ```
      sig { returns(String) }
      def self.call_squadron; end

      # Produces a call sign from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.call_sign #=> "Grey 5"
      # ```
      sig { returns(String) }
      def self.call_sign; end

      # Produces a call number from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.call_number #=> "Leader"
      # ```
      sig { returns(String) }
      def self.call_number; end

      # Produces a character from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.character #=> "Anakin Skywalker"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a droid from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.droid #=> "C-3PO"
      # ```
      sig { returns(String) }
      def self.droid; end

      # Produces a planet from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.planet #=> "Tatooine"
      # ```
      sig { returns(String) }
      def self.planet; end

      # Produces a species from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.specie #=> "Gungan"
      # ```
      sig { returns(String) }
      def self.specie; end

      # Produces a vehicle from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.vehicle #=> "Sandcrawler"
      # ```
      sig { returns(String) }
      def self.vehicle; end

      # Produces a wookiee sentence from Star Wars.
      # 
      # ```ruby
      # Faker::Movies::StarWars.wookiee_sentence #=> "Yrroonn ru ooma roo ahuma ur roooarrgh hnn-rowr."
      # ```
      sig { returns(String) }
      def self.wookiee_sentence; end

      # Produces a quote from Star Wars.
      # 
      # _@param_ `character` — The name of a character to derive a quote from.
      # 
      # ```ruby
      # Faker::Movies::StarWars.quote #=> "Aren't you a little short for a Stormtrooper?"
      # ```
      # 
      # ```ruby
      # Faker::Movies::StarWars.quote(character: "leia_organa")
      #   #=> "Aren't you a little short for a Stormtrooper?"
      # ```
      sig { params(legacy_character: T.untyped, character: T.nilable(String)).returns(String) }
      def self.quote(legacy_character = NOT_GIVEN, character: nil); end

      sig { returns(T.untyped) }
      def self.call_numbers; end

      sig { returns(T.untyped) }
      def self.call_squadrons; end

      sig { returns(T.untyped) }
      def self.characters; end

      sig { returns(T.untyped) }
      def self.droids; end

      sig { returns(T.untyped) }
      def self.planets; end

      sig { returns(T.untyped) }
      def self.species; end

      sig { returns(T.untyped) }
      def self.vehicles; end

      sig { returns(T.untyped) }
      def self.wookiee_words; end
    end

    class Ghostbusters < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces an actor from Ghostbusters.
      # 
      # ```ruby
      # Faker::Movies::Ghostbusters.actor #=> "Bill Murray"
      # ```
      sig { returns(String) }
      def self.actor; end

      # Produces a character from Ghostbusters.
      # 
      # ```ruby
      # Faker::Movies::Ghostbusters.character #=> "Dr. Egon Spengler"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from Ghostbusters.
      # 
      # ```ruby
      # Faker::Movies::Ghostbusters.quote
      #   #=> "I tried to think of the most harmless thing. Something I loved from my childhood. Something that could never ever possibly destroy us. Mr. Stay Puft!"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class HarryPotter < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.character #=> "Harry Potter"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.location #=> "Hogwarts"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.quote #=> "I solemnly swear that I am up to good."
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces a book from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.book #=> "Harry Potter and the Chamber of Secrets"
      # ```
      sig { returns(String) }
      def self.book; end

      # Produces a house from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.house #=> "Gryffindor"
      # ```
      sig { returns(String) }
      def self.house; end

      # Produces a spell from Harry Potter.
      # 
      # ```ruby
      # Faker::Movies::HarryPotter.spell #=> "Reparo"
      # ```
      sig { returns(String) }
      def self.spell; end
    end

    class PrincessBride < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from The Princess Bride.
      # 
      # ```ruby
      # Faker::Movies::PrincessBride.character #=> "Dread Pirate Roberts"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from The Princess Bride.
      # 
      # ```ruby
      # Faker::Movies::PrincessBride.quote
      #   #=> "Hello. My name is Inigo Montoya. You killed my father. Prepare to die!"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class VForVendetta < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from V For Vendetta.
      # 
      # ```ruby
      # Faker::Movies::VForVendetta.character #=> "V"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a speech from V For Vendetta.
      # 
      # ```ruby
      # Faker::Movies::VForVendetta.speech
      #   #=> "Remember, remember, the Fifth of November, the Gunpowder Treason and Plot. I know of no reason why the Gunpowder Treason should ever be forgot..."
      # ```
      sig { returns(String) }
      def self.speech; end

      # Produces a quote from V For Vendetta.
      # 
      # ```ruby
      # Faker::Movies::VForVendetta.quote
      #   #=> "People should not be afraid of their governments. Governments should be afraid of their people."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class LordOfTheRings < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Lord of the Rings.
      # 
      # ```ruby
      # Faker::Movies::LordOfTheRings.character #=> "Legolas"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from Lord of the Rings.
      # 
      # ```ruby
      # Faker::Movies::LordOfTheRings.location #=> "Helm's Deep"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from Lord of the Rings.
      # 
      # ```ruby
      # Faker::Movies::LordOfTheRings.quote
      #   #=> "I wish the Ring had never come to me. I wish none of this had happened."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class BackToTheFuture < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Back to the Future.
      # 
      # ```ruby
      # Faker::Movies::BackToTheFuture.character #=> "Marty McFly"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a date from Back to the Future.
      # 
      # ```ruby
      # Faker::Movies::BackToTheFuture.date #=> "November 5, 1955"
      # ```
      sig { returns(String) }
      def self.date; end

      # Produces a quote from Back to the Future.
      # 
      # ```ruby
      # Faker::Movies::BackToTheFuture.quote
      #   #=> "Roads? Where we're going, we don't need roads."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class HitchhikersGuideToTheGalaxy < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.character #=> "Marvin"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.location
      #   #=> "Arthur Dent's house"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a Marvin quote from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote
      #   #=> "Life? Don't talk to me about life."
      # ```
      sig { returns(String) }
      def self.marvin_quote; end

      # Produces a planet from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.planet
      #   #=> "Magrathea"
      # ```
      sig { returns(String) }
      def self.planet; end

      # Produces a quote from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.quote
      #   #=> "In the beginning, the Universe was created. This has made a lot of people very angry and been widely regarded as a bad move."
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces a species from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.specie
      #   #=> "Perfectly Normal Beast"
      # ```
      sig { returns(String) }
      def self.specie; end

      # Produces a starship from The Hitchhiker's Guide to the Galaxy.
      # 
      # ```ruby
      # Faker::Movies::HitchhikersGuideToTheGalaxy.starship
      #   #=> "Vogon Constructor Fleet"
      # ```
      sig { returns(String) }
      def self.starship; end
    end
  end

  class Artist < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of an artist.
    # 
    # ```ruby
    # Faker::Artist.name #=> "Michelangelo"
    # ```
    sig { returns(String) }
    def self.name; end
  end

  class Avatar < Faker::Base
    SUPPORTED_FORMATS = T.let(%w[png jpg bmp].freeze, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a URL for an avatar from robohash.org
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `slug` — 
    # 
    # _@param_ `size` — image size in pixels, in the format of 'AxB'
    # 
    # _@param_ `format` — The image file format
    # 
    # _@param_ `set` — The avatar set to use
    # 
    # _@param_ `bgset` — The background set to use
    # 
    # _@return_ — A robohash.org URL
    # 
    # ```ruby
    # Faker::Avatar.image
    #   #=> "https://robohash.org/sitsequiquia.png?size=300x300&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug")
    #   #=> "https://robohash.org/my-own-slug.png?size=300x300&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug", size: "50x50")
    #   #=> "https://robohash.org/my-own-slug.png?size=50x50&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
    #   #=> "https://robohash.org/my-own-slug.jpg?size=50x50&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp")
    #   #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1"
    # ```
    # 
    # ```ruby
    # Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "bmp", set: "set1", bgset: "bg1")
    #   #=> "https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1"
    # ```
    sig do
      params(
        legacy_slug: T.untyped,
        legacy_size: T.untyped,
        legacy_format: T.untyped,
        legacy_set: T.untyped,
        legacy_bgset: T.untyped,
        slug: T.nilable(String),
        size: String,
        format: String,
        set: String,
        bgset: T.nilable(String)
      ).returns(String)
    end
    def self.image(legacy_slug = NOT_GIVEN, legacy_size = NOT_GIVEN, legacy_format = NOT_GIVEN, legacy_set = NOT_GIVEN, legacy_bgset = NOT_GIVEN, slug: nil, size: '300x300', format: 'png', set: 'set1', bgset: nil); end
  end

  class Coffee < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.blend_name; end

    sig { returns(T.untyped) }
    def self.origin; end

    sig { returns(T.untyped) }
    def self.variety; end

    sig { returns(T.untyped) }
    def self.notes; end

    sig { returns(T.untyped) }
    def self.intensifier; end

    sig { params(key: T.untyped).returns(T.untyped) }
    def self.search_format(key); end
  end

  class Crypto < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.md5; end

    sig { returns(T.untyped) }
    def self.sha1; end

    sig { returns(T.untyped) }
    def self.sha256; end
  end

  class Device < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a build number between 1 and 500.
    # 
    # ```ruby
    # Faker::Device.build_number #=> 5
    # ```
    sig { returns(Integer) }
    def self.build_number; end

    # Produces the name of a manufacturer for a device.
    # 
    # ```ruby
    # Faker::Device.manufacturer #=> "Apple"
    # ```
    sig { returns(String) }
    def self.manufacturer; end

    # Produces a model name for a device.
    # 
    # ```ruby
    # Faker::Device.model_name #=> "iPhone 4"
    # ```
    sig { returns(String) }
    def self.model_name; end

    # Produces the name of a platform for a device.
    # 
    # ```ruby
    # Faker::Device.platform #=> "webOS"
    # ```
    sig { returns(String) }
    def self.platform; end

    # Produces a serial code for a device.
    # 
    # ```ruby
    # Faker::Device.serial #=> "ejfjnRNInxh0363JC2WM"
    # ```
    sig { returns(String) }
    def self.serial; end

    # Produces a version number between 1 and 1000.
    # 
    # ```ruby
    # Faker::Device.version #=> 42
    # ```
    sig { returns(Integer) }
    def self.version; end
  end

  class Esport < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.player; end

    sig { returns(T.untyped) }
    def self.team; end

    sig { returns(T.untyped) }
    def self.league; end

    sig { returns(T.untyped) }
    def self.event; end

    sig { returns(T.untyped) }
    def self.game; end
  end

  class Gender < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a gender identity.
    # 
    # ```ruby
    # Faker::Gender.type #=> "Non-binary"
    # ```
    sig { returns(String) }
    def self.type; end

    # Produces either 'Male' or 'Female'.
    # 
    # ```ruby
    # Faker::Gender.binary_type #=> "Female"
    # ```
    sig { returns(String) }
    def self.binary_type; end
  end

  # Port of http://shinytoylabs.com/jargon/
  # Are you having trouble writing tech-savvy dialogue for your latest screenplay?
  # Worry not! Hollywood-grade technical talk is ready to fill out any form where you need to look smart.
  class Hacker < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces something smart.
    # 
    # ```ruby
    # Faker::Hacker.say_something_smart
    #   #=> "Try to compress the SQL interface, maybe it will program the back-end hard drive!"
    # ```
    sig { returns(String) }
    def self.say_something_smart; end

    # Short technical abbreviations.
    # 
    # ```ruby
    # Faker::Hacker.abbreviation #=> "RAM"
    # ```
    sig { returns(String) }
    def self.abbreviation; end

    # Hacker-centric adjectives.
    # 
    # ```ruby
    # Faker::Hacker.adjective #=> "open-source"
    # ```
    sig { returns(String) }
    def self.adjective; end

    # Only the best hacker-related nouns.
    # 
    # ```ruby
    # Faker::Hacker.noun #=> "bandwidth"
    # ```
    sig { returns(String) }
    def self.noun; end

    # Actions that hackers take.
    # 
    # ```ruby
    # Faker::Hacker.verb #=> "bypass"
    # ```
    sig { returns(String) }
    def self.verb; end

    # Produces a verb that ends with '-ing'.
    # 
    # ```ruby
    # Faker::Hacker.ingverb #=> "synthesizing"
    # ```
    sig { returns(String) }
    def self.ingverb; end

    sig { returns(T.untyped) }
    def self.phrases; end
  end

  class Nation < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a random nationality.
    # 
    # ```ruby
    # Faker::Nation.nationality #=> "Nepalese"
    # ```
    sig { returns(String) }
    def self.nationality; end

    # Produces a random national flag emoji.
    # 
    # ```ruby
    # Faker::Nation.flag #=> "🇫🇮"
    # ```
    sig { returns(String) }
    def self.flag; end

    # Produces a random national language.
    # 
    # ```ruby
    # Faker::Nation.language #=> "Nepali"
    # ```
    sig { returns(String) }
    def self.language; end

    # Produces a random capital city.
    # 
    # ```ruby
    # Faker::Nation.capital_city #=> "Kathmandu"
    # ```
    sig { returns(String) }
    def self.capital_city; end

    # Produces a random national sport.
    # 
    # ```ruby
    # Faker::Nation.national_sport #=> "dandi biyo"
    # ```
    sig { returns(String) }
    def self.national_sport; end
  end

  class Number < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_digits: T.untyped, digits: T.untyped).returns(T.untyped) }
    def self.number(legacy_digits = NOT_GIVEN, digits: 10); end

    sig { params(legacy_digits: T.untyped, digits: T.untyped).returns(T.untyped) }
    def self.leading_zero_number(legacy_digits = NOT_GIVEN, digits: 10); end

    sig { params(legacy_digits: T.untyped, digits: T.untyped).returns(T.untyped) }
    def self.decimal_part(legacy_digits = NOT_GIVEN, digits: 10); end

    sig do
      params(
        legacy_l_digits: T.untyped,
        legacy_r_digits: T.untyped,
        l_digits: T.untyped,
        r_digits: T.untyped
      ).returns(T.untyped)
    end
    def self.decimal(legacy_l_digits = NOT_GIVEN, legacy_r_digits = NOT_GIVEN, l_digits: 5, r_digits: 2); end

    sig { returns(T.untyped) }
    def self.non_zero_digit; end

    sig { returns(T.untyped) }
    def self.digit; end

    sig { params(legacy_digits: T.untyped, digits: T.untyped).returns(T.untyped) }
    def self.hexadecimal(legacy_digits = NOT_GIVEN, digits: 6); end

    sig do
      params(
        legacy_mean: T.untyped,
        legacy_standard_deviation: T.untyped,
        mean: T.untyped,
        standard_deviation: T.untyped
      ).returns(T.untyped)
    end
    def self.normal(legacy_mean = NOT_GIVEN, legacy_standard_deviation = NOT_GIVEN, mean: 1, standard_deviation: 1); end

    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: T.untyped,
        to: T.untyped
      ).returns(T.untyped)
    end
    def self.between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 1.00, to: 5000.00); end

    sig { params(legacy_range: T.untyped, range: T.untyped).returns(T.untyped) }
    def self.within(legacy_range = NOT_GIVEN, range: 1.00..5000.00); end

    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: T.untyped,
        to: T.untyped
      ).returns(T.untyped)
    end
    def self.positive(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 1.00, to: 5000.00); end

    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: T.untyped,
        to: T.untyped
      ).returns(T.untyped)
    end
    def self.negative(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: -5000.00, to: -1.00); end

    sig { params(count: T.untyped).returns(T.untyped) }
    def self.generate(count); end

    sig { params(number: T.untyped).returns(T.untyped) }
    def self.greater_than_zero(number); end

    sig { params(number: T.untyped).returns(T.untyped) }
    def self.less_than_zero(number); end

    sig { params(number: T.untyped, method_to_compare: T.untyped).returns(T.untyped) }
    def self.should_be(number, method_to_compare); end
  end

  class Source < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces source code for Hello World in a given language.
    # 
    # _@param_ `lang` — The programming language to use
    # 
    # ```ruby
    # Faker::Source.hello_world #=> "puts 'Hello World!'"
    # ```
    # 
    # ```ruby
    # Faker::Source.hello_world(lang: :javascript)
    #   #=> "alert('Hello World!');"
    # ```
    sig { params(legacy_lang: T.untyped, lang: Symbol).returns(String) }
    def self.hello_world(legacy_lang = NOT_GIVEN, lang: :ruby); end

    # Produces source code for printing a string in a given language.
    # 
    # _@param_ `str` — The string to print
    # 
    # _@param_ `lang` — The programming language to use
    # 
    # ```ruby
    # Faker::Source.print #=> "puts 'faker_string_to_print'"
    # ```
    # 
    # ```ruby
    # Faker::Source.print(str: 'foo bar', lang: :javascript)
    #   #=> "console.log('foo bar');"
    # ```
    sig do
      params(
        legacy_str: T.untyped,
        legacy_lang: T.untyped,
        str: String,
        lang: Symbol
      ).returns(String)
    end
    def self.print(legacy_str = NOT_GIVEN, legacy_lang = NOT_GIVEN, str: 'some string', lang: :ruby); end

    # Produces source code for printing 1 through 10 in a given language.
    # 
    # _@param_ `lang` — The programming language to use
    # 
    # ```ruby
    # Faker::Source.print_1_to_10 #=> "(1..10).each { |i| puts i }"
    # ```
    # 
    # ```ruby
    # Faker::Source.print_1_to_10(lang: :javascript)
    # # => "for (let i=0; i<10; i++) {
    # #       console.log(i);
    # #    }"
    # ```
    sig { params(legacy_lang: T.untyped, lang: Symbol).returns(String) }
    def self.print_1_to_10(legacy_lang = NOT_GIVEN, lang: :ruby); end
  end

  class String < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_length: T.untyped, length: T.untyped).returns(T.untyped) }
    def self.random(legacy_length = NOT_GIVEN, length: 32); end

    sig { params(length: T.untyped).returns(T.untyped) }
    def self.select_a(length); end

    sig { params(length: T.untyped).returns(T.untyped) }
    def self.utf8string(length); end

    sig { params(ratio: T.untyped).returns(T.untyped) }
    def self.space_or_utf8_char(ratio); end

    sig { returns(T.untyped) }
    def self.char_space_ratio; end

    sig { returns(T.untyped) }
    def self.utf8character; end
  end

  class Stripe < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_card_type: T.untyped, card_type: T.untyped).returns(T.untyped) }
    def self.valid_card(legacy_card_type = NOT_GIVEN, card_type: nil); end

    sig { params(legacy_card_type: T.untyped, card_type: T.untyped).returns(T.untyped) }
    def self.valid_token(legacy_card_type = NOT_GIVEN, card_type: nil); end

    sig { params(legacy_card_error: T.untyped, card_error: T.untyped).returns(T.untyped) }
    def self.invalid_card(legacy_card_error = NOT_GIVEN, card_error: nil); end

    sig { returns(T.untyped) }
    def self.month; end

    sig { returns(T.untyped) }
    def self.year; end

    sig { params(legacy_card_type: T.untyped, card_type: T.untyped).returns(T.untyped) }
    def self.ccv(legacy_card_type = NOT_GIVEN, card_type: nil); end
  end

  class TvShows
    class Buffy < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.character #=> "Buffy Summers"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.quote #=> "If the apocalypse comes, beep me."
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces a celebrity from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.celebrity #=> "John Ritter"
      # ```
      sig { returns(String) }
      def self.celebrity; end

      # Produces a big bad from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.big_bad #=> "Glory"
      # ```
      sig { returns(String) }
      def self.big_bad; end

      # Produces an episode from Buffy the Vampire Slayer.
      # 
      # ```ruby
      # Faker::TvShows::Buffy.episode #=> "Once More, with Feeling"
      # ```
      sig { returns(String) }
      def self.episode; end
    end

    class DrWho < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      sig { returns(T.untyped) }
      def self.character; end

      sig { returns(T.untyped) }
      def self.the_doctor; end

      sig { returns(T.untyped) }
      def self.actor; end

      sig { returns(T.untyped) }
      def self.catch_phrase; end

      sig { returns(T.untyped) }
      def self.quote; end

      sig { returns(T.untyped) }
      def self.villian; end

      sig { returns(T.untyped) }
      def self.specie; end
    end

    class Friends < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Friends.
      # 
      # ```ruby
      # Faker::TvShows::Friends.character #=> "Rachel Green"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from Friends.
      # 
      # ```ruby
      # Faker::TvShows::Friends.location #=> "Central Perk"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from Friends.
      # 
      # ```ruby
      # Faker::TvShows::Friends.quote #=> "We were on a break!"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class RuPaul < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a quote from RuPaul's Drag Race.
      # 
      # ```ruby
      # Faker::TvShows::RuPaul.quote #=> "That's Funny, Tell Another One."
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces a queen from RuPaul's Drag Race.
      # 
      # ```ruby
      # Faker::TvShows::RuPaul.queen #=> "Latrice Royale"
      # ```
      sig { returns(String) }
      def self.queen; end
    end

    class NewGirl < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from New Girl.
      # 
      # ```ruby
      # Faker::TvShows::NewGirl.character #=> "Jessica Day"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from New Girl.
      # 
      # ```ruby
      # Faker::TvShows::NewGirl.quote
      #   #=> "Are you cooking a frittata in a sauce pan? What is this - prison?"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class Seinfeld < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a business from Seinfeld.
      # 
      # ```ruby
      # Faker::TvShows::Seinfeld.business #=> "Kruger Industrial Smoothing"
      # ```
      sig { returns(String) }
      def self.business; end

      # Produces a character from Seinfeld.
      # 
      # ```ruby
      # Faker::TvShows::Seinfeld.character #=> "George Costanza"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from Seinfeld.
      # 
      # ```ruby
      # Faker::TvShows::Seinfeld.quote
      #   #=> "I'm not a lesbian. I hate men, but I'm not a lesbian."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class Simpsons < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from The Simpsons.
      # 
      # ```ruby
      # Faker::TvShows::Simpsons.character #=> "Charles Montgomery Burns"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from The Simpsons.
      # 
      # ```ruby
      # Faker::TvShows::Simpsons.location #=> "Moe's Tavern"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from The Simpsons.
      # 
      # ```ruby
      # Faker::TvShows::Simpsons.quote
      #   #=> "It takes two to lie: one to lie and one to listen."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class Stargate < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Stargate.
      # 
      # ```ruby
      # Faker::TvShows::Stargate.character #=> "Jack O'Neill"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a planet from Stargate.
      # 
      # ```ruby
      # Faker::TvShows::Stargate.planet #=> "Abydos"
      # ```
      sig { returns(String) }
      def self.planet; end

      # Produces a quote from Stargate.
      # 
      # ```ruby
      # Faker::TvShows::Stargate.quote
      #   #=> "General, request permission to beat the crap out of this man."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class Community < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Community.
      # 
      # ```ruby
      # Faker::TvShows::Community.characters #=> "Jeff Winger"
      # ```
      sig { returns(String) }
      def self.characters; end

      # Produces a quote from Community.
      # 
      # ```ruby
      # Faker::TvShows::Community.quotes
      #   #=> "I fear a political career could shine a negative light on my drug dealing."
      # ```
      sig { returns(String) }
      def self.quotes; end
    end

    class StarTrek < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Star Trek.
      # 
      # ```ruby
      # Faker::TvShows::StarTrek.character #=> "Spock"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from Star Trek.
      # 
      # ```ruby
      # Faker::TvShows::StarTrek.location #=> "Cardassia"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a species from Star Trek.
      # 
      # ```ruby
      # Faker::TvShows::StarTrek.specie #=> "Ferengi"
      # ```
      sig { returns(String) }
      def self.specie; end

      # Produces a villain from Star Trek.
      # 
      # ```ruby
      # Faker::TvShows::StarTrek.villain #=> "Khan Noonien Singh"
      # ```
      sig { returns(String) }
      def self.villain; end
    end

    class FamilyGuy < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Family Guy.
      # 
      # ```ruby
      # Faker::TvShows::FamilyGuy.character #=> "Peter Griffin"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from Family Guy.
      # 
      # ```ruby
      # Faker::TvShows::FamilyGuy.location #=> "James Woods High"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from Family Guy.
      # 
      # ```ruby
      # Faker::TvShows::FamilyGuy.quote
      #   #=> "It's Peanut Butter Jelly Time."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class HeyArnold < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Hey Arnold!
      # 
      # ```ruby
      # Faker::TvShows::HeyArnold.character #=> "Arnold"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from Hey Arnold!
      # 
      # ```ruby
      # Faker::TvShows::HeyArnold.location #=> "Big Bob's Beeper Emporium"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from Hey Arnold!
      # 
      # ```ruby
      # Faker::TvShows::HeyArnold.quote #=> "Stoop Kid's afraid to leave his stoop!"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class SouthPark < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from South Park.
      # 
      # ```ruby
      # Faker::TvShows::SouthPark.character #=> "Mr. Garrison"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from South Park.
      # 
      # ```ruby
      # Faker::TvShows::SouthPark.quote
      #   #=> "I'm just getting a little cancer Stan."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class TwinPeaks < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Twin Peaks.
      # 
      # ```ruby
      # Faker::TvShows::TwinPeaks.character #=> "Dale Cooper"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from Twin Peaks.
      # 
      # ```ruby
      # Faker::TvShows::TwinPeaks.location #=> "Black Lodge"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from Twin Peaks.
      # 
      # ```ruby
      # Faker::TvShows::TwinPeaks.quote
      #   #=> "The owls are not what they seem."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class TheExpanse < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from The Expanse.
      # 
      # ```ruby
      # Faker::TvShows::TheExpanse.character #=> "Jim Holden"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from The Expanse.
      # 
      # ```ruby
      # Faker::TvShows::TheExpanse.quote #=> "I am that guy."
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces a location from The Expanse.
      # 
      # ```ruby
      # Faker::TvShows::TheExpanse.location #=> "Ganymede"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a ship from The Expanse.
      # 
      # ```ruby
      # Faker::TvShows::TheExpanse.ship #=> "Nauvoo"
      # ```
      sig { returns(String) }
      def self.ship; end
    end

    class BreakingBad < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a character from Breaking Bad.
      # 
      # ```ruby
      # Faker::TvShows::BreakingBad.character #=> "Walter White"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces the name of an episode from Breaking Bad.
      # 
      # ```ruby
      # Faker::TvShows::BreakingBad.episode #=> "Fly"
      # ```
      sig { returns(String) }
      def self.episode; end
    end

    class TheITCrowd < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces an actor from The IT Crowd.
      # 
      # ```ruby
      # Faker::TvShows::TheITCrowd.actor #=> "Chris O'Dowd"
      # ```
      sig { returns(String) }
      def self.actor; end

      # Produces a character from The IT Crowd.
      # 
      # ```ruby
      # Faker::TvShows::TheITCrowd.character #=> "Roy Trenneman"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces an email from The IT Crowd.
      # 
      # ```ruby
      # Faker::TvShows::TheITCrowd.email #=> "roy.trenneman@reynholm.test"
      # ```
      sig { returns(String) }
      def self.email; end

      # Produces a quote from The IT Crowd.
      # 
      # ```ruby
      # Faker::TvShows::TheITCrowd.quote
      #   #=> "Hello, IT. Have you tried turning it off and on again?"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class VentureBros < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from The Venture Bros.
      # 
      # ```ruby
      # Faker::TvShows::VentureBros.character #=> "Scaramantula"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces an organization from The Venture Bros.
      # 
      # ```ruby
      # Faker::TvShows::VentureBros.organization
      #   #=> "Guild of Calamitous Intent"
      # ```
      sig { returns(String) }
      def self.organization; end

      # Produces a vehicle from The Venture Bros.
      # 
      # ```ruby
      # Faker::TvShows::VentureBros.vehicle #=> "Monarchmobile"
      # ```
      sig { returns(String) }
      def self.vehicle; end

      # Produces a quote from The Venture Bros.
      # 
      # ```ruby
      # Faker::TvShows::VentureBros.quote
      #   #=> "Revenge, like gazpacho soup, is best served cold, precise, and merciless."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class MichaelScott < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a quote from Michael Scott.
      # 
      # ```ruby
      # Faker::TvShows::MichaelScott.quote
      #   #=> "I am Beyoncé, always."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class ParksAndRec < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Parks and Recreation.
      # 
      # ```ruby
      # Faker::TvShows::ParksAndRec.character #=> "Leslie Knope"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a city from Parks and Recreation.
      # 
      # ```ruby
      # Faker::TvShows::ParksAndRec.city #=> "Pawnee"
      # ```
      sig { returns(String) }
      def self.city; end
    end

    class RickAndMorty < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Rick and Morty.
      # 
      # ```ruby
      # Faker::TvShows::RickAndMorty.character #=> "Rick Sanchez"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a location from Rick and Morty.
      # 
      # ```ruby
      # Faker::TvShows::RickAndMorty.location #=> "Dimension C-132"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from Rick and Morty.
      # 
      # ```ruby
      # Faker::TvShows::RickAndMorty.quote
      #   #=> "Ohh yea, you gotta get schwifty."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class SiliconValley < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.character #=> "Jian Yang"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a company from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.company #=> "Bachmanity"
      # ```
      sig { returns(String) }
      def self.company; end

      # Produces a quote from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.quote
      #   #=> "I don't want to live in a world where someone else is making the world a better place better than we are."
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces an app from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.app #=> "Nip Alert"
      # ```
      sig { returns(String) }
      def self.app; end

      # Produces an invention from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.invention
      #   #=> "Tres Comas Tequila"
      # ```
      sig { returns(String) }
      def self.invention; end

      # Produces a motto from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.motto
      #   #=> "Our products are products, producing unrivaled results"
      # ```
      sig { returns(String) }
      def self.motto; end

      # Produces a URL from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.url #=> "http://www.piedpiper.com"
      # ```
      sig { returns(String) }
      def self.url; end

      # Produces an email address from Silicon Valley.
      # 
      # ```ruby
      # Faker::TvShows::SiliconValley.email #=> "richard@piedpiper.test"
      # ```
      sig { returns(String) }
      def self.email; end
    end

    class BojackHorseman < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from BoJack Horseman.
      # 
      # ```ruby
      # Faker::TvShows::BojackHorseman.character #=> "BoJack Horseman"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a tongue twister from BoJack Horseman.
      # 
      # ```ruby
      # Faker::TvShows::BojackHorseman.tongue_twister #=> "Did you steal a meal from Neal McBeal the Navy Seal?"
      # ```
      sig { returns(String) }
      def self.tongue_twister; end

      # Produces a quote from BoJack Horseman.
      # 
      # ```ruby
      # Faker::TvShows::BojackHorseman.quote
      #   #=> "Not understanding that you're a horrible person doesn't make you less of a horrible person."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class DumbAndDumber < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces an actor from Dumb and Dumber.
      # 
      # ```ruby
      # Faker::TvShows::DumbAndDumber.actor #=> "Jim Carrey"
      # ```
      sig { returns(String) }
      def self.actor; end

      # Produces a character from Dumb and Dumber.
      # 
      # ```ruby
      # Faker::TvShows::DumbAndDumber.character #=> "Harry Dunne"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a quote from Dumb and Dumber.
      # 
      # ```ruby
      # Faker::TvShows::DumbAndDumber.quote
      #   #=> "Why you going to the airport? Flying somewhere?"
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class GameOfThrones < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.character #=> "Tyrion Lannister"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a house from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.house #=> "Stark"
      # ```
      sig { returns(String) }
      def self.house; end

      # Produces a city from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.city #=> "Lannisport"
      # ```
      sig { returns(String) }
      def self.city; end

      # Produces a quote from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.quote
      #   #=> "Never forget who you are. The rest of the world won't. Wear it like an armor and it can never be used against you."
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces a dragon from Game of Thrones.
      # 
      # ```ruby
      # Faker::TvShows::GameOfThrones.dragon #=> "Drogon"
      # ```
      sig { returns(String) }
      def self.dragon; end
    end

    class StrangerThings < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Stranger Things.
      # 
      # ```ruby
      # Faker::TvShows::StrangerThings.character #=> "six"
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces a quote from Stranger Things.
      # 
      # ```ruby
      # Faker::TvShows::StrangerThings.quote
      #   #=> "Friends don't lie."
      # ```
      sig { returns(String) }
      def self.character; end
    end

    class TheThickOfIt < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from The Thick of It.
      # 
      # ```ruby
      # Faker::TvShows::TheThickOfIt.character #=> "Nicola Murray"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a department from The Thick of It.
      # 
      # ```ruby
      # Faker::TvShows::TheThickOfIt.department #=> "Shadow Cabinet"
      # ```
      sig { returns(String) }
      def self.department; end

      # Produces a position from The Thick of It.
      # 
      # ```ruby
      # Faker::TvShows::TheThickOfIt.position
      #   #=> "Director of Communications"
      # ```
      sig { returns(String) }
      def self.position; end
    end

    class HowIMetYourMother < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from How I Met Your Mother.
      # 
      # ```ruby
      # Faker::TvShows::HowIMetYourMother.character #=> "Barney Stinson"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a catch phrase from How I Met Your Mother.
      # 
      # ```ruby
      # Faker::TvShows::HowIMetYourMother.catch_phrase #=> "Legendary"
      # ```
      sig { returns(String) }
      def self.catch_phrase; end

      # Produces a high five from How I Met Your Mother.
      # 
      # ```ruby
      # Faker::TvShows::HowIMetYourMother.high_five #=> "Relapse Five"
      # ```
      sig { returns(String) }
      def self.high_five; end

      # Produces a quote from How I Met Your Mother.
      # 
      # ```ruby
      # Faker::TvShows::HowIMetYourMother.quote
      #   #=> "Whenever I'm sad, I stop being sad and be awesome instead."
      # ```
      sig { returns(String) }
      def self.quote; end
    end

    class AquaTeenHungerForce < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from Aqua Teen Hunger Force.
      # 
      # ```ruby
      # Faker::TvShows::AquaTeenHungerForce.character #=> "Master Shake"
      # ```
      sig { returns(String) }
      def self.character; end
    end

    class TheFreshPrinceOfBelAir < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from The Fresh Prince of Bel-Air.
      # 
      # ```ruby
      # Faker::TvShows::TheFreshPrinceOfBelAir.character #=> "Will Smith"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a celebrity from The Fresh Prince of Bel-Air.
      # 
      # ```ruby
      # Faker::TvShows::TheFreshPrinceOfBelAir.celebrity #=> "Quincy Jones"
      # ```
      sig { returns(String) }
      def self.celebrity; end

      # Produces a quote from The Fresh Prince of Bel-Air.
      # 
      # ```ruby
      # Faker::TvShows::TheFreshPrinceOfBelAir.quote
      #   #=> "Girl, you look so good, I would marry your brother just to get in your family."
      # ```
      sig { returns(String) }
      def self.quote; end
    end
  end

  class Address < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_options: T.untyped, options: T.untyped).returns(T.untyped) }
    def self.city(legacy_options = NOT_GIVEN, options: {}); end

    sig { returns(T.untyped) }
    def self.street_name; end

    sig { params(legacy_include_secondary: T.untyped, include_secondary: T.untyped).returns(T.untyped) }
    def self.street_address(legacy_include_secondary = NOT_GIVEN, include_secondary: false); end

    sig { returns(T.untyped) }
    def self.secondary_address; end

    sig { returns(T.untyped) }
    def self.building_number; end

    sig { returns(T.untyped) }
    def self.community; end

    sig { params(legacy_state_abbreviation: T.untyped, state_abbreviation: T.untyped).returns(T.untyped) }
    def self.zip_code(legacy_state_abbreviation = NOT_GIVEN, state_abbreviation: ''); end

    sig { returns(T.untyped) }
    def self.time_zone; end

    sig { returns(T.untyped) }
    def self.street_suffix; end

    sig { returns(T.untyped) }
    def self.city_suffix; end

    sig { returns(T.untyped) }
    def self.city_prefix; end

    sig { returns(T.untyped) }
    def self.state_abbr; end

    sig { returns(T.untyped) }
    def self.state; end

    sig { returns(T.untyped) }
    def self.country; end

    sig { params(legacy_code: T.untyped, code: T.untyped).returns(T.untyped) }
    def self.country_by_code(legacy_code = NOT_GIVEN, code: 'US'); end

    sig { params(legacy_name: T.untyped, name: T.untyped).returns(T.untyped) }
    def self.country_name_to_code(legacy_name = NOT_GIVEN, name: 'united_states'); end

    sig { returns(T.untyped) }
    def self.country_code; end

    sig { returns(T.untyped) }
    def self.country_code_long; end

    sig { returns(T.untyped) }
    def self.latitude; end

    sig { returns(T.untyped) }
    def self.longitude; end

    sig { returns(T.untyped) }
    def self.full_address; end
  end

  class Ancient < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.god; end

    sig { returns(T.untyped) }
    def self.primordial; end

    sig { returns(T.untyped) }
    def self.titan; end

    sig { returns(T.untyped) }
    def self.hero; end
  end

  class Boolean < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a boolean
    # 
    # _@param_ `true_ratio` — The likelihood (as a float, out of 1.0) for the method to return `true`.
    # 
    # ```ruby
    # Faker::Boolean.boolean #=> true
    # ```
    # 
    # ```ruby
    # Faker::Boolean.boolean(true_ratio: 0.2) #=> false
    # ```
    sig { params(legacy_true_ratio: T.untyped, true_ratio: Float).returns(T::Boolean) }
    def self.boolean(legacy_true_ratio = NOT_GIVEN, true_ratio: 0.5); end
  end

  class Company < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.suffix; end

    sig { returns(T.untyped) }
    def self.industry; end

    # Generate a buzzword-laden catch phrase.
    sig { returns(T.untyped) }
    def self.catch_phrase; end

    sig { returns(T.untyped) }
    def self.buzzword; end

    # When a straight answer won't do, BS to the rescue!
    sig { returns(T.untyped) }
    def self.bs; end

    sig { returns(T.untyped) }
    def self.ein; end

    sig { returns(T.untyped) }
    def self.duns_number; end

    # Get a random company logo url in PNG format.
    sig { returns(T.untyped) }
    def self.logo; end

    sig { returns(T.untyped) }
    def self.type; end

    sig { returns(T.untyped) }
    def self.profession; end

    # rubocop:disable Style/AsciiComments
    # Get a random Spanish organization number. See more here https://es.wikipedia.org/wiki/Número_de_identificación_fiscal
    # rubocop:enable Style/AsciiComments
    sig { returns(T.untyped) }
    def self.spanish_organisation_number; end

    # Get a random Swedish organization number. See more here https://sv.wikipedia.org/wiki/Organisationsnummer
    sig { returns(T.untyped) }
    def self.swedish_organisation_number; end

    sig { returns(T.untyped) }
    def self.czech_organisation_number; end

    # Get a random French SIREN number. See more here https://fr.wikipedia.org/wiki/Syst%C3%A8me_d%27identification_du_r%C3%A9pertoire_des_entreprises
    sig { returns(T.untyped) }
    def self.french_siren_number; end

    sig { returns(T.untyped) }
    def self.french_siret_number; end

    # Get a random Norwegian organization number. Info: https://www.brreg.no/om-oss/samfunnsoppdraget-vart/registera-vare/einingsregisteret/organisasjonsnummeret/
    sig { returns(T.untyped) }
    def self.norwegian_organisation_number; end

    sig { returns(T.untyped) }
    def self.australian_business_number; end

    # Get a random Polish taxpayer identification number More info https://pl.wikipedia.org/wiki/NIP
    sig { returns(T.untyped) }
    def self.polish_taxpayer_identification_number; end

    # Get a random Polish register of national economy number. More info https://pl.wikipedia.org/wiki/REGON
    sig { params(legacy_length: T.untyped, length: T.untyped).returns(T.untyped) }
    def self.polish_register_of_national_economy(legacy_length = NOT_GIVEN, length: 9); end

    sig { returns(T.untyped) }
    def self.south_african_pty_ltd_registration_number; end

    sig { returns(T.untyped) }
    def self.south_african_close_corporation_registration_number; end

    sig { returns(T.untyped) }
    def self.south_african_listed_company_registration_number; end

    sig { returns(T.untyped) }
    def self.south_african_trust_registration_number; end

    sig { params(legacy_formatted: T.untyped, formatted: T.untyped).returns(T.untyped) }
    def self.brazilian_company_number(legacy_formatted = NOT_GIVEN, formatted: false); end

    sig { returns(T.untyped) }
    def self.sic_code; end

    # Mod11 functionality from https://github.com/badmanski/mod11/blob/master/lib/mod11.rb
    sig { params(number: T.untyped).returns(T.untyped) }
    def self.mod11(number); end

    sig { params(number: T.untyped).returns(T.untyped) }
    def self.luhn_algorithm(number); end

    sig { params(abn: T.untyped).returns(T.untyped) }
    def self.abn_checksum(abn); end

    sig { params(array: T.untyped).returns(T.untyped) }
    def self.collect_regon_sum(array); end

    sig { params(array: T.untyped, weights: T.untyped).returns(T.untyped) }
    def self.weight_sum(array, weights); end
  end

  class Compass < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.cardinal; end

    sig { returns(T.untyped) }
    def self.ordinal; end

    sig { returns(T.untyped) }
    def self.half_wind; end

    sig { returns(T.untyped) }
    def self.quarter_wind; end

    sig { returns(T.untyped) }
    def self.direction; end

    sig { returns(T.untyped) }
    def self.abbreviation; end

    sig { returns(T.untyped) }
    def self.azimuth; end

    sig { returns(T.untyped) }
    def self.cardinal_abbreviation; end

    sig { returns(T.untyped) }
    def self.ordinal_abbreviation; end

    sig { returns(T.untyped) }
    def self.half_wind_abbreviation; end

    sig { returns(T.untyped) }
    def self.quarter_wind_abbreviation; end

    sig { returns(T.untyped) }
    def self.cardinal_azimuth; end

    sig { returns(T.untyped) }
    def self.ordinal_azimuth; end

    sig { returns(T.untyped) }
    def self.half_wind_azimuth; end

    sig { returns(T.untyped) }
    def self.quarter_wind_azimuth; end
  end

  class Cosmere < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.aon; end

    sig { returns(T.untyped) }
    def self.shard_world; end

    sig { returns(T.untyped) }
    def self.shard; end

    sig { returns(T.untyped) }
    def self.surge; end

    sig { returns(T.untyped) }
    def self.knight_radiant; end

    sig { returns(T.untyped) }
    def self.metal; end

    sig { returns(T.untyped) }
    def self.allomancer; end

    sig { returns(T.untyped) }
    def self.feruchemist; end

    sig { returns(T.untyped) }
    def self.herald; end

    sig { returns(T.untyped) }
    def self.spren; end
  end

  class Dessert < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a dessert variety.
    # 
    # ```ruby
    # Faker::Dessert.variety #=> "Cake"
    # ```
    sig { returns(String) }
    def self.variety; end

    # Produces the name of a dessert topping.
    # 
    # ```ruby
    # Faker::Dessert.topping #=> "Gummy Bears"
    # ```
    sig { returns(String) }
    def self.topping; end

    # Produces the name of a dessert flavor.
    # 
    # ```ruby
    # Faker::Dessert.flavor #=> "Salted Caramel"
    # ```
    sig { returns(String) }
    def self.flavor; end
  end

  class Finance < Faker::Base
    CREDIT_CARD_TYPES = T.let(%i[visa mastercard discover american_express
diners_club jcb switch solo dankort
maestro forbrugsforeningen laser].freeze, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(types: T.untyped).returns(T.untyped) }
    def self.credit_card(*types); end

    sig { params(legacy_country: T.untyped, country: T.untyped).returns(T.untyped) }
    def self.vat_number(legacy_country = NOT_GIVEN, country: 'BR'); end

    sig { returns(T.untyped) }
    def self.vat_number_keys; end
  end

  class Hipster < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.word; end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_spaces_allowed: T.untyped,
        number: T.untyped,
        supplemental: T.untyped,
        spaces_allowed: T.untyped
      ).returns(T.untyped)
    end
    def self.words(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_spaces_allowed = NOT_GIVEN, number: 3, supplemental: false, spaces_allowed: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_word_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_words_to_add: T.untyped,
        word_count: T.untyped,
        supplemental: T.untyped,
        random_words_to_add: T.untyped
      ).returns(T.untyped)
    end
    def self.sentence(legacy_word_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, supplemental: false, random_words_to_add: 6); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.sentences(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_sentence_count: T.untyped,
        legacy_supplemental: T.untyped,
        legacy_random_sentences_to_add: T.untyped,
        sentence_count: T.untyped,
        supplemental: T.untyped,
        random_sentences_to_add: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraph(legacy_sentence_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_sentences_to_add = NOT_GIVEN, sentence_count: 3, supplemental: false, random_sentences_to_add: 3); end

    sig do
      params(
        legacy_number: T.untyped,
        legacy_supplemental: T.untyped,
        number: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraphs(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false); end

    sig do
      params(
        legacy_characters: T.untyped,
        legacy_supplemental: T.untyped,
        characters: T.untyped,
        supplemental: T.untyped
      ).returns(T.untyped)
    end
    def self.paragraph_by_chars(legacy_characters = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, characters: 256, supplemental: false); end
  end

  class Invoice < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Generate random amount between values with 2 decimals
    sig do
      params(
        legacy_from: T.untyped,
        legacy_to: T.untyped,
        from: T.untyped,
        to: T.untyped
      ).returns(T.untyped)
    end
    def self.amount_between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from: 0, to: 0); end

    # International bank slip reference https://en.wikipedia.org/wiki/Creditor_Reference
    # ref is optional so that we can create unit tests
    sig { params(legacy_ref: T.untyped, ref: T.untyped).returns(T.untyped) }
    def self.creditor_reference(legacy_ref = NOT_GIVEN, ref: ''); end

    # Payment references have some rules in certain countries
    # ref is optional so that we can create unit tests
    sig { params(legacy_ref: T.untyped, ref: T.untyped).returns(T.untyped) }
    def self.reference(legacy_ref = NOT_GIVEN, ref: ''); end

    # Calculates the mandatory checksum in 3rd and 4th characters in IBAN format
    # source: https://en.wikipedia.org/wiki/International_Bank_Account_Number#Validating_the_IBAN
    sig { params(country_code: T.untyped, account: T.untyped).returns(T.untyped) }
    def self.iban_checksum(country_code, account); end

    # 731 Method
    # Source: https://wiki.xmldation.com/support/fk/finnish_reference_number
    sig { params(base: T.untyped).returns(T.untyped) }
    def self.method_731(base); end

    # Norsk Modulus 10 - KIDMOD10
    sig { params(base: T.untyped).returns(T.untyped) }
    def self.kidmod10(base); end

    # Calculates weigthed sum
    # 
    # For example with 12345678, [1,2]
    # Ref.num. 1 2 3 4 5 6 7 8
    # Multipl. 1 2 1 2 1 2 1 2
    # Total 1+ 4+ 3+ 8+ 5+1+2+ 7+1+6 = 38
    sig { params(base: T.untyped, weight_factors: T.untyped).returns(T.untyped) }
    def self.calculate_weighted_sum(base, weight_factors); end

    # MOD-10 - remainder
    sig { params(number: T.untyped).returns(T.untyped) }
    def self.mod10_remainder(number); end
  end

  class Science < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a element.
    # 
    # ```ruby
    # Faker::Science.element #=> "Carbon"
    # ```
    sig { returns(String) }
    def self.element; end

    # Produces the symbol of an element.
    # 
    # ```ruby
    # Faker::Science.element_symbol #=> "Pb"
    # ```
    sig { returns(String) }
    def self.element_symbol; end

    # Produces the name of a scientist.
    # 
    # ```ruby
    # Faker::Science.scientist #=> "Isaac Newton"
    # ```
    sig { returns(String) }
    def self.scientist; end
  end

  class Twitter < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig do
      params(
        legacy_include_status: T.untyped,
        legacy_include_email: T.untyped,
        include_status: T.untyped,
        include_email: T.untyped
      ).returns(T.untyped)
    end
    def self.user(legacy_include_status = NOT_GIVEN, legacy_include_email = NOT_GIVEN, include_status: true, include_email: false); end

    sig do
      params(
        legacy_include_user: T.untyped,
        legacy_include_photo: T.untyped,
        include_user: T.untyped,
        include_photo: T.untyped
      ).returns(T.untyped)
    end
    def self.status(legacy_include_user = NOT_GIVEN, legacy_include_photo = NOT_GIVEN, include_user: true, include_photo: false); end

    sig { returns(T.untyped) }
    def self.screen_name; end

    sig { returns(T.untyped) }
    def self.id; end

    sig { returns(T.untyped) }
    def self.created_at; end

    sig { returns(T.untyped) }
    def self.utc_offset; end

    sig { returns(T.untyped) }
    def self.user_entities; end

    sig { params(legacy_include_photo: T.untyped, include_photo: T.untyped).returns(T.untyped) }
    def self.status_entities(legacy_include_photo = NOT_GIVEN, include_photo: false); end

    sig { returns(T.untyped) }
    def self.photo_entity; end
  end

  class Vehicle < Faker::Base
    MILEAGE_MIN = T.let(10_000, T.untyped)
    MILEAGE_MAX = T.let(90_000, T.untyped)
    VIN_LETTERS = T.let('ABCDEFGHJKLMNPRSTUVWXYZ', T.untyped)
    VIN_MAP = T.let('0123456789X', T.untyped)
    VIN_WEIGHTS = T.let('8765432X098765432', T.untyped)
    VIN_REGEX = T.let(/^[A-Z0-9]{3}[A-Z0-9]{5}[A-Z0-9]{1}[A-Z0-9]{1}[A-Z0-0]{1}[A-Z0-9]{1}\d{5}$/.freeze, T.untyped)
    SG_CHECKSUM_WEIGHTS = T.let([3, 14, 2, 12, 2, 11, 1].freeze, T.untyped)
    SG_CHECKSUM_CHARS = T.let('AYUSPLJGDBZXTRMKHEC', T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.vin; end

    sig { returns(T.untyped) }
    def self.manufacture; end

    sig { returns(T.untyped) }
    def self.make; end

    sig { params(legacy_make_of_model: T.untyped, make_of_model: T.untyped).returns(T.untyped) }
    def self.model(legacy_make_of_model = NOT_GIVEN, make_of_model: ''); end

    sig { returns(T.untyped) }
    def self.make_and_model; end

    sig { returns(T.untyped) }
    def self.style; end

    sig { returns(T.untyped) }
    def self.color; end

    sig { returns(T.untyped) }
    def self.transmission; end

    sig { returns(T.untyped) }
    def self.drive_type; end

    sig { returns(T.untyped) }
    def self.fuel_type; end

    sig { returns(T.untyped) }
    def self.car_type; end

    sig { returns(T.untyped) }
    def self.engine; end

    sig { returns(T.untyped) }
    def self.car_options; end

    sig { returns(T.untyped) }
    def self.standard_specs; end

    sig { returns(T.untyped) }
    def self.doors; end

    sig { returns(T.untyped) }
    def self.year; end

    sig do
      params(
        legacy_min: T.untyped,
        legacy_max: T.untyped,
        min: T.untyped,
        max: T.untyped
      ).returns(T.untyped)
    end
    def self.mileage(legacy_min = NOT_GIVEN, legacy_max = NOT_GIVEN, min: MILEAGE_MIN, max: MILEAGE_MAX); end

    sig { params(legacy_state_abreviation: T.untyped, state_abreviation: T.untyped).returns(T.untyped) }
    def self.license_plate(legacy_state_abreviation = NOT_GIVEN, state_abreviation: ''); end

    sig { returns(T.untyped) }
    def self.singapore_license_plate; end

    sig { params(number: T.untyped).returns(T.untyped) }
    def self.first_eight(number); end

    sig { params(vin: T.untyped).returns(T.untyped) }
    def self.calculate_vin_check_digit(vin); end

    sig { params(char: T.untyped).returns(T.untyped) }
    def self.vin_char_to_number(char); end

    sig { params(plate_number: T.untyped).returns(T.untyped) }
    def self.singapore_checksum(plate_number); end
  end

  class Sports
    class Football < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      sig { returns(T.untyped) }
      def self.team; end

      sig { returns(T.untyped) }
      def self.player; end

      sig { returns(T.untyped) }
      def self.coach; end

      sig { returns(T.untyped) }
      def self.competition; end

      sig { returns(T.untyped) }
      def self.position; end
    end

    class Basketball < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      sig { returns(T.untyped) }
      def self.team; end

      sig { returns(T.untyped) }
      def self.player; end

      sig { returns(T.untyped) }
      def self.coach; end

      sig { returns(T.untyped) }
      def self.position; end
    end
  end

  class Blockchain
    class Tezos < Faker::Base
      PREFIXES = T.let({
  tz1: [6, 161, 159],
  KT1: [2, 90, 121],
  edpk: [13, 15, 37, 217],
  edsk: [13, 15, 58, 7],
  edsig: [9, 245, 205, 134, 18],
  B: [1, 52],
  o: [5, 116]
}.freeze, T.untyped)
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a random Tezos account address
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.account
      #   #=> "tz1eUsgK6aj752Fbxwk5sAoEFvSDnPjZ4qvk"
      # ```
      sig { returns(String) }
      def self.account; end

      # Produces a random Tezos contract
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.contract
      #   #=> "KT1MroqeP15nnitB4CnNfkqHYa2NErhPPLWF"
      # ```
      sig { returns(String) }
      def self.contract; end

      # Produces a random Tezos operation
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.operation
      #   #=> "onygWYXJX3xNstFLv9PcCrhQdCkENC795xwSinmTEc1jsDN4VDa"
      # ```
      sig { returns(String) }
      def self.operation; end

      # Produces a random Tezos block
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.block
      #   #=> "BMbhs2rkY1dvAkAyRytvPsjFQ2RiPrBhYkxvWpY65dzkdSuw58a"
      # ```
      sig { returns(String) }
      def self.block; end

      # Produces a random Tezos signature
      # 
      # ```ruby
      # Faker::Blockchain::Tezos.signature
      #   #=> "edsigu165B7VFf3Dpw2QABVzEtCxJY2gsNBNcE3Ti7rRxtDUjqTFRpg67EdAQmY6YWPE5tKJDMnSTJDFu65gic8uLjbW2YwGvAZ"
      # ```
      sig { returns(String) }
      def self.signature; end

      # _@param_ `prefix` — 
      # 
      # _@param_ `payload_size` — The size of the payload
      sig { params(prefix: Symbol, payload_size: Integer).returns(String) }
      def self.encode_tz(prefix, payload_size); end
    end

    class Bitcoin < Faker::Base
      PROTOCOL_VERSIONS = T.let({
  main: 0,
  testnet: 111
}.freeze, T.untyped)
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a Bitcoin wallet address
      # 
      # ```ruby
      # Faker::Blockchain::Bitcoin.address
      #   #=> "147nDP22h3pHrLt2qykTH4txUwQh1ccaXp"
      # ```
      sig { returns(String) }
      def self.address; end

      # Produces a Bitcoin testnet address
      # 
      # ```ruby
      # Faker::Blockchain::Bitcoin.testnet_address
      #   #=> "n4YjRyYD6V6zREpk6opqESDqD3KYnMdVEB"
      # ```
      sig { returns(String) }
      def self.testnet_address; end

      # Generates a random Bitcoin address for the given network
      # 
      # _@param_ `network` — The name of network protocol to generate an address for
      # 
      # _@return_ — A Bitcoin address
      sig { params(network: Symbol).returns(String) }
      def self.address_for(network); end
    end

    class Ethereum < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a random Ethereum wallet address
      # 
      # ```ruby
      # Faker::Blockchain::Ethereum.address
      #   #=> "0xd392b0c0500700d02d27ab30805ec80ddd3320ff"
      # ```
      sig { returns(String) }
      def self.address; end
    end

    class Aeternity < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a random Aeternity wallet address
      # 
      # ```ruby
      # Faker::Blockchain::Aeternity.address
      #   #=> "ak_zvU8YQLagjcfng7Tg8yCdiZ1rpiWNp1PBn3vtUs44utSvbJVR"
      # ```
      sig { returns(String) }
      def self.address; end

      # Produces a random Aeternity transaction
      # 
      # ```ruby
      # Faker::Blockchain::Aeternity.transaction
      #   #=> "th_147nDP22h3pHrLt2qykTH4txUwQh1ccaXp"
      # ```
      sig { returns(String) }
      def self.transaction; end

      # Produces a random Aeternity contract
      # 
      # ```ruby
      # Faker::Blockchain::Aeternity.contract
      #   #=> "ct_Hk2JsNeWGEYQEHHQCfcBeGrwbhtYSwFTPdDhW2SvjFYVojyhW"
      # ```
      sig { returns(String) }
      def self.contract; end

      # Produces a random Aeternity oracle
      # 
      # ```ruby
      # Faker::Blockchain::Aeternity.oracle
      #   #=> "ok_28QDg7fkF5qiKueSdUvUBtCYPJdmMEoS73CztzXCRAwMGKHKZh"
      # ```
      sig { returns(String) }
      def self.oracle; end

      sig { params(length: T.untyped).returns(T.untyped) }
      def self.rand_strings(length = 50); end
    end
  end

  class Business < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.credit_card_number; end

    sig { returns(T.untyped) }
    def self.credit_card_expiry_date; end

    sig { returns(T.untyped) }
    def self.credit_card_type; end
  end

  class Cannabis < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.strain; end

    sig { returns(T.untyped) }
    def self.cannabinoid_abbreviation; end

    sig { returns(T.untyped) }
    def self.cannabinoid; end

    sig { returns(T.untyped) }
    def self.terpene; end

    sig { returns(T.untyped) }
    def self.medical_use; end

    sig { returns(T.untyped) }
    def self.health_benefit; end

    sig { returns(T.untyped) }
    def self.category; end

    sig { returns(T.untyped) }
    def self.type; end

    sig { returns(T.untyped) }
    def self.buzzword; end

    sig { returns(T.untyped) }
    def self.brand; end
  end

  class Commerce < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.color; end

    sig { params(legacy_digits: T.untyped, digits: T.untyped).returns(T.untyped) }
    def self.promotion_code(legacy_digits = NOT_GIVEN, digits: 6); end

    sig do
      params(
        legacy_max: T.untyped,
        legacy_fixed_amount: T.untyped,
        max: T.untyped,
        fixed_amount: T.untyped
      ).returns(T.untyped)
    end
    def self.department(legacy_max = NOT_GIVEN, legacy_fixed_amount = NOT_GIVEN, max: 3, fixed_amount: false); end

    sig { returns(T.untyped) }
    def self.product_name; end

    sig { returns(T.untyped) }
    def self.material; end

    sig do
      params(
        legacy_range: T.untyped,
        legacy_as_string: T.untyped,
        range: T.untyped,
        as_string: T.untyped
      ).returns(T.untyped)
    end
    def self.price(legacy_range = NOT_GIVEN, legacy_as_string = NOT_GIVEN, range: 0..100.0, as_string: false); end

    sig { params(num: T.untyped).returns(T.untyped) }
    def self.categories(num); end

    sig { params(categories: T.untyped).returns(T.untyped) }
    def self.merge_categories(categories); end
  end

  class Currency < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.code; end

    sig { returns(T.untyped) }
    def self.symbol; end
  end

  class Educator < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.university; end

    sig { returns(T.untyped) }
    def self.degree; end

    sig { returns(T.untyped) }
    def self.subject; end

    sig { returns(T.untyped) }
    def self.course_name; end

    sig { returns(T.untyped) }
    def self.secondary_school; end

    sig { returns(T.untyped) }
    def self.campus; end
  end

  class Internet < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig do
      params(
        legacy_name: T.untyped,
        legacy_separators: T.untyped,
        name: T.untyped,
        separators: T.untyped
      ).returns(T.untyped)
    end
    def self.email(legacy_name = NOT_GIVEN, legacy_separators = NOT_GIVEN, name: nil, separators: nil); end

    sig { params(legacy_name: T.untyped, name: T.untyped).returns(T.untyped) }
    def self.free_email(legacy_name = NOT_GIVEN, name: nil); end

    sig { params(legacy_name: T.untyped, name: T.untyped).returns(T.untyped) }
    def self.safe_email(legacy_name = NOT_GIVEN, name: nil); end

    sig do
      params(
        legacy_specifier: T.untyped,
        legacy_separators: T.untyped,
        specifier: T.untyped,
        separators: T.untyped
      ).returns(T.untyped)
    end
    def self.username(legacy_specifier = NOT_GIVEN, legacy_separators = NOT_GIVEN, specifier: nil, separators: %w[. _]); end

    # Produces a randomized string of characters suitable for passwords
    # 
    # rubocop:disable Metrics/ParameterLists
    # 
    # _@param_ `min_length` — The minimum length of the password
    # 
    # _@param_ `max_length` — The maximum length of the password
    # 
    # _@param_ `mix_case` — Toggles if uppercased letters are allowed. If true, at least one will be added.
    # 
    # _@param_ `special_characters` — Toggles if special characters are allowed. If true, at least one will be added.
    # 
    # ```ruby
    # Faker::Internet.password #=> "Vg5mSvY1UeRg7"
    # ```
    # 
    # ```ruby
    # Faker::Internet.password(min_length: 8) #=> "YfGjIk0hGzDqS0"
    # ```
    # 
    # ```ruby
    # Faker::Internet.password(min_length: 10, max_length: 20) #=> "EoC9ShWd1hWq4vBgFw"
    # ```
    # 
    # ```ruby
    # Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true) #=> "3k5qS15aNmG"
    # ```
    # 
    # ```ruby
    # Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) #=> "*%NkOnJsH4"
    # ```
    sig do
      params(
        legacy_min_length: T.untyped,
        legacy_max_length: T.untyped,
        legacy_mix_case: T.untyped,
        legacy_special_characters: T.untyped,
        min_length: Integer,
        max_length: Integer,
        mix_case: T::Boolean,
        special_characters: T::Boolean
      ).returns(String)
    end
    def self.password(legacy_min_length = NOT_GIVEN, legacy_max_length = NOT_GIVEN, legacy_mix_case = NOT_GIVEN, legacy_special_characters = NOT_GIVEN, min_length: 8, max_length: 16, mix_case: true, special_characters: false); end

    sig { params(legacy_subdomain: T.untyped, subdomain: T.untyped).returns(T.untyped) }
    def self.domain_name(legacy_subdomain = NOT_GIVEN, subdomain: false); end

    sig { params(legacy_string: T.untyped, string: T.untyped).returns(T.untyped) }
    def self.fix_umlauts(legacy_string = NOT_GIVEN, string: ''); end

    sig { returns(T.untyped) }
    def self.domain_word; end

    sig { returns(T.untyped) }
    def self.domain_suffix; end

    sig { params(legacy_prefix: T.untyped, prefix: T.untyped).returns(T.untyped) }
    def self.mac_address(legacy_prefix = NOT_GIVEN, prefix: ''); end

    sig { returns(T.untyped) }
    def self.ip_v4_address; end

    sig { returns(T.untyped) }
    def self.private_ip_v4_address; end

    sig { returns(T.untyped) }
    def self.public_ip_v4_address; end

    sig { returns(T.untyped) }
    def self.private_nets_regex; end

    sig { returns(T.untyped) }
    def self.private_net_checker; end

    sig { returns(T.untyped) }
    def self.reserved_nets_regex; end

    sig { returns(T.untyped) }
    def self.reserved_net_checker; end

    sig { returns(T.untyped) }
    def self.ip_v4_cidr; end

    sig { returns(T.untyped) }
    def self.ip_v6_address; end

    sig { returns(T.untyped) }
    def self.ip_v6_cidr; end

    sig do
      params(
        legacy_host: T.untyped,
        legacy_path: T.untyped,
        legacy_scheme: T.untyped,
        host: T.untyped,
        path: T.untyped,
        scheme: T.untyped
      ).returns(T.untyped)
    end
    def self.url(legacy_host = NOT_GIVEN, legacy_path = NOT_GIVEN, legacy_scheme = NOT_GIVEN, host: domain_name, path: "/#{username}", scheme: 'http'); end

    sig do
      params(
        legacy_words: T.untyped,
        legacy_glue: T.untyped,
        words: T.untyped,
        glue: T.untyped
      ).returns(T.untyped)
    end
    def self.slug(legacy_words = NOT_GIVEN, legacy_glue = NOT_GIVEN, words: nil, glue: nil); end

    sig { returns(T.untyped) }
    def self.device_token; end

    sig { params(legacy_vendor: T.untyped, vendor: T.untyped).returns(T.untyped) }
    def self.user_agent(legacy_vendor = NOT_GIVEN, vendor: nil); end

    sig { returns(T.untyped) }
    def self.uuid; end
  end

  class Markdown < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.headers; end

    sig { returns(T.untyped) }
    def self.emphasis; end

    sig { returns(T.untyped) }
    def self.ordered_list; end

    sig { returns(T.untyped) }
    def self.unordered_list; end

    sig { returns(T.untyped) }
    def self.inline_code; end

    sig { returns(T.untyped) }
    def self.block_code; end

    sig { returns(T.untyped) }
    def self.table; end

    sig { params(args: T.untyped).returns(T.untyped) }
    def self.random(*args); end

    sig do
      params(
        legacy_sentences: T.untyped,
        legacy_repeat: T.untyped,
        sentences: T.untyped,
        repeat: T.untyped
      ).returns(T.untyped)
    end
    def self.sandwich(legacy_sentences = NOT_GIVEN, legacy_repeat = NOT_GIVEN, sentences: 3, repeat: 1); end

    sig { returns(T.untyped) }
    def self.available_methods; end
  end

  class Military < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a rank in the U.S. Army.
    # 
    # ```ruby
    # Faker::Military.army_rank #=> "Staff Sergeant"
    # ```
    sig { returns(String) }
    def self.army_rank; end

    # Produces a rank in the U.S. Marines.
    # 
    # ```ruby
    # Faker::Military.marines_rank #=> "Gunnery Sergeant"
    # ```
    sig { returns(String) }
    def self.marines_rank; end

    # Produces a rank in the U.S. Navy.
    # 
    # ```ruby
    # Faker::Military.navy_rank #=> "Seaman"
    # ```
    sig { returns(String) }
    def self.navy_rank; end

    # Produces a rank in the U.S. Air Force.
    # 
    # ```ruby
    # Faker::Military.air_force_rank #=> "Captain"
    # ```
    sig { returns(String) }
    def self.air_force_rank; end

    # Produces a U.S. Department of Defense Paygrade.
    # 
    # ```ruby
    # Faker::Military.dod_paygrade #=> "E-6"
    # ```
    sig { returns(String) }
    def self.dod_paygrade; end
  end

  class Omniauth < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Returns the value of attribute name
    sig { returns(T.untyped) }
    def name; end

    # Returns the value of attribute first_name
    sig { returns(T.untyped) }
    def first_name; end

    # Returns the value of attribute last_name
    sig { returns(T.untyped) }
    def last_name; end

    # Returns the value of attribute email
    sig { returns(T.untyped) }
    def email; end

    sig { params(name: T.untyped, email: T.untyped).returns(Omniauth) }
    def initialize(name: nil, email: nil); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_name: T.untyped,
        legacy_email: T.untyped,
        legacy_uid: T.untyped,
        name: T.untyped,
        email: T.untyped,
        uid: T.untyped
      ).returns(T.untyped)
    end
    def self.google(legacy_name = NOT_GIVEN, legacy_email = NOT_GIVEN, legacy_uid = NOT_GIVEN, name: nil, email: nil, uid: Number.number(digits: 9).to_s); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_name: T.untyped,
        legacy_email: T.untyped,
        legacy_username: T.untyped,
        legacy_uid: T.untyped,
        name: T.untyped,
        email: T.untyped,
        username: T.untyped,
        uid: T.untyped
      ).returns(T.untyped)
    end
    def self.facebook(legacy_name = NOT_GIVEN, legacy_email = NOT_GIVEN, legacy_username = NOT_GIVEN, legacy_uid = NOT_GIVEN, name: nil, email: nil, username: nil, uid: Number.number(digits: 7).to_s); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_name: T.untyped,
        legacy_nickname: T.untyped,
        legacy_uid: T.untyped,
        name: T.untyped,
        nickname: T.untyped,
        uid: T.untyped
      ).returns(T.untyped)
    end
    def self.twitter(legacy_name = NOT_GIVEN, legacy_nickname = NOT_GIVEN, legacy_uid = NOT_GIVEN, name: nil, nickname: nil, uid: Number.number(digits: 6).to_s); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_name: T.untyped,
        legacy_email: T.untyped,
        legacy_uid: T.untyped,
        name: T.untyped,
        email: T.untyped,
        uid: T.untyped
      ).returns(T.untyped)
    end
    def self.linkedin(legacy_name = NOT_GIVEN, legacy_email = NOT_GIVEN, legacy_uid = NOT_GIVEN, name: nil, email: nil, uid: Number.number(digits: 6).to_s); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_name: T.untyped,
        legacy_email: T.untyped,
        legacy_uid: T.untyped,
        name: T.untyped,
        email: T.untyped,
        uid: T.untyped
      ).returns(T.untyped)
    end
    def self.github(legacy_name = NOT_GIVEN, legacy_email = NOT_GIVEN, legacy_uid = NOT_GIVEN, name: nil, email: nil, uid: Number.number(digits: 8).to_s); end

    # Generate a mock Omniauth response from Apple
    # 
    # _@param_ `name` — A specific name to return in the response
    # 
    # _@param_ `email` — A specific email to return in the response
    # 
    # _@param_ `uid` — A specific UID to return in the response
    # 
    # _@return_ — An auth hash in the format provided by omniauth-apple
    sig { params(name: T.nilable(String), email: T.nilable(String), uid: T.nilable(String)).returns(T::Hash[T.untyped, T.untyped]) }
    def self.apple(name: nil, email: nil, uid: nil); end

    sig { returns(T.untyped) }
    def self.gender; end

    sig { returns(T.untyped) }
    def self.timezone; end

    sig { returns(T.untyped) }
    def self.image; end

    sig { returns(T.untyped) }
    def self.city_state; end

    sig { params(range: T.untyped).returns(T.untyped) }
    def self.random_number_from_range(range); end

    sig { returns(T.untyped) }
    def self.random_boolean; end
  end

  class Appliance < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of an appliance brand.
    # 
    # ```ruby
    # Faker::Appliance.brand #=> "Bosch"
    # ```
    sig { returns(String) }
    def self.brand; end

    # Produces the name of a type of appliance equipment.
    # 
    # ```ruby
    # Faker::Appliance.equipment #=> "Appliance plug"
    # ```
    sig { returns(String) }
    def self.equipment; end
  end

  class ChileRut < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Fixed param added for testing a specific RUT and check digit combination.
    sig do
      params(
        legacy_min_rut: T.untyped,
        legacy_fixed: T.untyped,
        min_rut: T.untyped,
        fixed: T.untyped
      ).returns(T.untyped)
    end
    def self.rut(legacy_min_rut = NOT_GIVEN, legacy_fixed = NOT_GIVEN, min_rut: 1, fixed: false); end

    sig { returns(T.untyped) }
    def self.dv; end

    # Alias for english speaking devs.
    sig { returns(T.untyped) }
    def self.check_digit; end

    sig do
      params(
        legacy_min_rut: T.untyped,
        legacy_fixed: T.untyped,
        min_rut: T.untyped,
        fixed: T.untyped
      ).returns(T.untyped)
    end
    def self.full_rut(legacy_min_rut = NOT_GIVEN, legacy_fixed = NOT_GIVEN, min_rut: 0, fixed: false); end

    # Returns the value of attribute last_rut
    sig { returns(T.untyped) }
    def self.last_rut; end
  end

  class DcComics < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.hero; end

    sig { returns(T.untyped) }
    def self.heroine; end

    sig { returns(T.untyped) }
    def self.villain; end

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.title; end
  end

  class IDNumber < Faker::Base
    CHECKS = T.let('TRWAGMYFPDXBNJZSQVHLCKE', T.untyped)
    INVALID_SSN = T.let([
  /0{3}-\d{2}-\d{4}/,
  /\d{3}-0{2}-\d{4}/,
  /\d{3}-\d{2}-0{4}/,
  /666-\d{2}-\d{4}/,
  /9\d{2}-\d{2}-\d{4}/
].freeze, T.untyped)
    ZA_RACE_DIGIT = T.let('8', T.untyped)
    ZA_CITIZENSHIP_DIGITS = T.let(%w[0 1].freeze, T.untyped)
    BRAZILIAN_ID_FORMAT = T.let(/(\d{1,2})(\d{3})(\d{3})([\dX])/.freeze, T.untyped)
    BRAZILIAN_ID_FROM = T.let(10_000_000, T.untyped)
    BRAZILIAN_ID_TO = T.let(99_999_999, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.valid; end

    sig { returns(T.untyped) }
    def self.invalid; end

    sig { returns(T.untyped) }
    def self.ssn_valid; end

    sig { returns(T.untyped) }
    def self.spanish_citizen_number; end

    sig { returns(T.untyped) }
    def self.spanish_foreign_citizen_number; end

    sig { returns(T.untyped) }
    def self.valid_south_african_id_number; end

    sig { returns(T.untyped) }
    def self.invalid_south_african_id_number; end

    sig { params(legacy_formatted: T.untyped, formatted: T.untyped).returns(T.untyped) }
    def self.brazilian_citizen_number(legacy_formatted = NOT_GIVEN, formatted: false); end

    sig { params(legacy_formatted: T.untyped, formatted: T.untyped).returns(T.untyped) }
    def self.brazilian_id(legacy_formatted = NOT_GIVEN, formatted: false); end

    sig { params(id_number: T.untyped).returns(T.untyped) }
    def self.south_african_id_checksum_digit(id_number); end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.brazilian_citizen_number_checksum_digit(digits); end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.brazilian_id_checksum_digit(digits); end

    sig { params(digits: T.untyped).returns(T.untyped) }
    def self.brazilian_document_checksum(digits); end

    sig { params(checksum: T.untyped, id: T.untyped).returns(T.untyped) }
    def self.brazilian_document_digit(checksum, id = false); end

    sig { params(remainder: T.untyped).returns(T.untyped) }
    def self.brazilian_citizen_number_digit(remainder); end

    sig { params(remainder: T.untyped).returns(T.untyped) }
    def self.brazilian_id_digit(remainder); end

    sig { params(key: T.untyped).returns(T.untyped) }
    def self._translate(key); end
  end

  class Marketing < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a video game console or platform.
    # 
    # ```ruby
    # Faker::Marketing.buzzwords #=> "rubber meets the road"
    # ```
    sig { returns(String) }
    def self.buzzwords; end
  end

  class Superhero < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a superpower.
    # 
    # ```ruby
    # Faker::Superhero.power #=> "Photokinesis"
    # ```
    sig { returns(String) }
    def self.power; end

    # Produces a superhero name prefix.
    # 
    # ```ruby
    # Faker::Superhero.prefix #=> "the Fated"
    # ```
    sig { returns(String) }
    def self.prefix; end

    # Produces a superhero name suffix.
    # 
    # ```ruby
    # Faker::Superhero.suffix #=> "Captain"
    # ```
    sig { returns(String) }
    def self.suffix; end

    # Produces a superhero descriptor.
    # 
    # ```ruby
    # Faker::Superhero.descriptor #=> "Bizarro"
    # ```
    sig { returns(String) }
    def self.descriptor; end

    # Produces a random superhero name.
    # 
    # ```ruby
    # Faker::Superhero.name #=> "Magnificent Shatterstar"
    # ```
    sig { returns(String) }
    def self.name; end
  end

  class WorldCup < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.team; end

    sig { returns(T.untyped) }
    def self.city; end

    sig { returns(T.untyped) }
    def self.stadium; end

    sig { params(legacy_group: T.untyped, group: T.untyped).returns(T.untyped) }
    def self.group(legacy_group = NOT_GIVEN, group: 'group_A'); end

    sig do
      params(
        legacy_country: T.untyped,
        legacy_type: T.untyped,
        country: T.untyped,
        type: T.untyped
      ).returns(T.untyped)
    end
    def self.roster(legacy_country = NOT_GIVEN, legacy_type = NOT_GIVEN, country: 'Egypt', type: 'coach'); end
  end

  class BossaNova < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.artist; end

    sig { returns(T.untyped) }
    def self.song; end
  end

  class Fillmurray < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_grayscale: T.untyped,
        legacy_width: T.untyped,
        legacy_height: T.untyped,
        grayscale: T.untyped,
        width: T.untyped,
        height: T.untyped
      ).returns(T.untyped)
    end
    def self.image(legacy_grayscale = NOT_GIVEN, legacy_width = NOT_GIVEN, legacy_height = NOT_GIVEN, grayscale: false, width: 200, height: 200); end
  end

  class FunnyName < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.two_word_name; end

    sig { returns(T.untyped) }
    def self.three_word_name; end

    sig { returns(T.untyped) }
    def self.four_word_name; end

    sig { returns(T.untyped) }
    def self.name_with_initial; end
  end

  class Restaurant < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end
  end

  class University < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.name; end

    sig { returns(T.untyped) }
    def self.prefix; end

    sig { returns(T.untyped) }
    def self.suffix; end

    sig { returns(T.untyped) }
    def self.greek_organization; end

    sig { returns(T.untyped) }
    def self.greek_alphabet; end
  end

  class Quotes
    class Shakespeare < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      sig { returns(T.untyped) }
      def self.hamlet_quote; end

      sig { returns(T.untyped) }
      def self.as_you_like_it_quote; end

      sig { returns(T.untyped) }
      def self.king_richard_iii_quote; end

      sig { returns(T.untyped) }
      def self.romeo_and_juliet_quote; end

      sig { returns(T.untyped) }
      def self.hamlet; end

      sig { returns(T.untyped) }
      def self.as_you_like_it; end

      sig { returns(T.untyped) }
      def self.king_richard_iii; end

      sig { returns(T.untyped) }
      def self.romeo_and_juliet; end
    end
  end

  class UniqueGenerator
    RetryLimitExceeded = T.let(Class.new(StandardError), T.untyped)

    # Returns the value of attribute marked_unique
    sig { returns(T.untyped) }
    def self.marked_unique; end

    sig { params(generator: T.untyped, max_retries: T.untyped).returns(UniqueGenerator) }
    def initialize(generator, max_retries); end

    # rubocop:disable Style/MethodMissingSuper
    sig { params(name: T.untyped, arguments: T.untyped).returns(T.untyped) }
    def method_missing(name, *arguments); end

    # rubocop:enable Style/MethodMissingSuper
    sig { params(method_name: T.untyped, include_private: T.untyped).returns(T::Boolean) }
    def respond_to_missing?(method_name, include_private = false); end

    sig { returns(T.untyped) }
    def clear; end

    sig { returns(T.untyped) }
    def self.clear; end

    sig { params(name: T.untyped, arguments: T.untyped, values: T.untyped).returns(T.untyped) }
    def exclude(name, arguments, values); end
  end

  class CryptoCoin < Faker::Base
    COIN_NAME = T.let(0, T.untyped)
    ACRONYM = T.let(1, T.untyped)
    URL_LOGO = T.let(2, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_coin: T.untyped, coin: T.untyped).returns(T.untyped) }
    def self.coin_name(legacy_coin = NOT_GIVEN, coin: coin_array); end

    sig { params(legacy_coin: T.untyped, coin: T.untyped).returns(T.untyped) }
    def self.acronym(legacy_coin = NOT_GIVEN, coin: coin_array); end

    sig { params(legacy_coin: T.untyped, coin: T.untyped).returns(T.untyped) }
    def self.url_logo(legacy_coin = NOT_GIVEN, coin: coin_array); end

    sig { returns(T.untyped) }
    def self.coin_array; end

    sig { returns(T.untyped) }
    def self.coin_hash; end
  end

  class Demographic < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.race; end

    sig { returns(T.untyped) }
    def self.educational_attainment; end

    sig { returns(T.untyped) }
    def self.demonym; end

    sig { returns(T.untyped) }
    def self.marital_status; end

    sig { returns(T.untyped) }
    def self.sex; end

    sig { params(legacy_unit: T.untyped, unit: T.untyped).returns(T.untyped) }
    def self.height(legacy_unit = NOT_GIVEN, unit: :metric); end
  end

  class LoremPixel < Faker::Base
    SUPPORTED_CATEGORIES = T.let(%w[abstract
animals
business
cats
city
food
nightlife
fashion
people
nature
sports
technics
transport].freeze, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_size: T.untyped,
        legacy_is_gray: T.untyped,
        legacy_category: T.untyped,
        legacy_number: T.untyped,
        legacy_text: T.untyped,
        legacy_secure: T.untyped,
        size: T.untyped,
        is_gray: T.untyped,
        category: T.untyped,
        number: T.untyped,
        text: T.untyped,
        secure: T.untyped
      ).returns(T.untyped)
    end
    def self.image(legacy_size = NOT_GIVEN, legacy_is_gray = NOT_GIVEN, legacy_category = NOT_GIVEN, legacy_number = NOT_GIVEN, legacy_text = NOT_GIVEN, legacy_secure = NOT_GIVEN, size: '300x300', is_gray: false, category: nil, number: nil, text: nil, secure: true); end
  end

  class Measurement < Faker::Base
    ALL = T.let('all', T.untyped)
    NONE = T.let('none', T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_amount: T.untyped, amount: T.untyped).returns(T.untyped) }
    def self.height(legacy_amount = NOT_GIVEN, amount: rand(10)); end

    sig { params(legacy_amount: T.untyped, amount: T.untyped).returns(T.untyped) }
    def self.length(legacy_amount = NOT_GIVEN, amount: rand(10)); end

    sig { params(legacy_amount: T.untyped, amount: T.untyped).returns(T.untyped) }
    def self.volume(legacy_amount = NOT_GIVEN, amount: rand(10)); end

    sig { params(legacy_amount: T.untyped, amount: T.untyped).returns(T.untyped) }
    def self.weight(legacy_amount = NOT_GIVEN, amount: rand(10)); end

    sig { params(legacy_amount: T.untyped, amount: T.untyped).returns(T.untyped) }
    def self.metric_height(legacy_amount = NOT_GIVEN, amount: rand(10)); end

    sig { params(legacy_amount: T.untyped, amount: T.untyped).returns(T.untyped) }
    def self.metric_length(legacy_amount = NOT_GIVEN, amount: rand(10)); end

    sig { params(legacy_amount: T.untyped, amount: T.untyped).returns(T.untyped) }
    def self.metric_volume(legacy_amount = NOT_GIVEN, amount: rand(10)); end

    sig { params(legacy_amount: T.untyped, amount: T.untyped).returns(T.untyped) }
    def self.metric_weight(legacy_amount = NOT_GIVEN, amount: rand(10)); end

    sig { params(text: T.untyped, number: T.untyped).returns(T.untyped) }
    def self.check_for_plural(text, number); end

    sig { params(amount: T.untyped, locale: T.untyped).returns(T.untyped) }
    def self.define_measurement_locale(amount, locale); end

    sig { params(amount: T.untyped).returns(T.untyped) }
    def self.ensure_valid_amount(amount); end

    sig { params(text: T.untyped).returns(T.untyped) }
    def self.make_plural(text); end
  end

  class Placeholdit < Faker::Base
    SUPPORTED_FORMATS = T.let(%w[png jpg gif jpeg].freeze, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_size: T.untyped,
        legacy_format: T.untyped,
        legacy_background_color: T.untyped,
        legacy_text_color: T.untyped,
        legacy_text: T.untyped,
        size: T.untyped,
        format: T.untyped,
        background_color: T.untyped,
        text_color: T.untyped,
        text: T.untyped
      ).returns(T.untyped)
    end
    def self.image(legacy_size = NOT_GIVEN, legacy_format = NOT_GIVEN, legacy_background_color = NOT_GIVEN, legacy_text_color = NOT_GIVEN, legacy_text = NOT_GIVEN, size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil); end

    sig { returns(T.untyped) }
    def self.generate_color; end
  end

  class SlackEmoji < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.people; end

    sig { returns(T.untyped) }
    def self.nature; end

    sig { returns(T.untyped) }
    def self.food_and_drink; end

    sig { returns(T.untyped) }
    def self.celebration; end

    sig { returns(T.untyped) }
    def self.activity; end

    sig { returns(T.untyped) }
    def self.travel_and_places; end

    sig { returns(T.untyped) }
    def self.objects_and_symbols; end

    sig { returns(T.untyped) }
    def self.custom; end

    sig { returns(T.untyped) }
    def self.emoji; end
  end

  class Alphanumeric < Faker::Base
    ALPHANUMS = T.let(LLetters + Numbers, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a random string of alphabetic characters (no digits)
    # 
    # _@param_ `number` — The length of the string to generate
    # 
    # ```ruby
    # Faker::Alphanumeric.alpha(number: 10) #=> "zlvubkrwga"
    # ```
    sig { params(legacy_number: T.untyped, number: Integer).returns(String) }
    def self.alpha(legacy_number = NOT_GIVEN, number: 32); end

    # Produces a random string of alphanumeric characters
    # 
    # _@param_ `number` — The number of characters to generate
    # 
    # _@param_ `min_alpha` — The minimum number of alphabetic to add to the string
    # 
    # _@param_ `min_numeric` — The minimum number of numbers to add to the string
    # 
    # ```ruby
    # Faker::Alphanumeric.alphanumeric(number: 10) #=> "3yfq2phxtb"
    # ```
    # 
    # ```ruby
    # Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3) #=> "3yfq2phxtb"
    # ```
    # 
    # ```ruby
    # Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3) #=> "3yfq2phx8b"
    # ```
    sig do
      params(
        legacy_number: T.untyped,
        number: Integer,
        min_alpha: Integer,
        min_numeric: Integer
      ).returns(String)
    end
    def self.alphanumeric(legacy_number = NOT_GIVEN, number: 32, min_alpha: 0, min_numeric: 0); end
  end

  class ChuckNorris < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # from: https://github.com/jenkinsci/chucknorris-plugin/blob/master/src/main/java/hudson/plugins/chucknorris/FactGenerator.java
    sig { returns(T.untyped) }
    def self.fact; end
  end

  class Construction < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.material; end

    sig { returns(T.untyped) }
    def self.heavy_equipment; end

    sig { returns(T.untyped) }
    def self.trade; end

    sig { returns(T.untyped) }
    def self.subcontract_category; end

    sig { returns(T.untyped) }
    def self.standard_cost_code; end

    sig { returns(T.untyped) }
    def self.role; end
  end

  class LoremFlickr < Faker::Base
    SUPPORTED_COLORIZATIONS = T.let(%w[red green blue].freeze, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_size: T.untyped,
        legacy_search_terms: T.untyped,
        legacy_match_all: T.untyped,
        size: T.untyped,
        search_terms: T.untyped,
        match_all: T.untyped
      ).returns(T.untyped)
    end
    def self.image(legacy_size = NOT_GIVEN, legacy_search_terms = NOT_GIVEN, legacy_match_all = NOT_GIVEN, size: '300x300', search_terms: [], match_all: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_size: T.untyped,
        legacy_search_terms: T.untyped,
        legacy_match_all: T.untyped,
        size: T.untyped,
        search_terms: T.untyped,
        match_all: T.untyped
      ).returns(T.untyped)
    end
    def self.grayscale_image(legacy_size = NOT_GIVEN, legacy_search_terms = NOT_GIVEN, legacy_match_all = NOT_GIVEN, size: '300x300', search_terms: ['all'], match_all: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_size: T.untyped,
        legacy_search_terms: T.untyped,
        legacy_match_all: T.untyped,
        size: T.untyped,
        search_terms: T.untyped,
        match_all: T.untyped
      ).returns(T.untyped)
    end
    def self.pixelated_image(legacy_size = NOT_GIVEN, legacy_search_terms = NOT_GIVEN, legacy_match_all = NOT_GIVEN, size: '300x300', search_terms: ['all'], match_all: false); end

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_size: T.untyped,
        legacy_color: T.untyped,
        legacy_search_terms: T.untyped,
        legacy_match_all: T.untyped,
        size: T.untyped,
        color: T.untyped,
        search_terms: T.untyped,
        match_all: T.untyped
      ).returns(T.untyped)
    end
    def self.colorized_image(legacy_size = NOT_GIVEN, legacy_color = NOT_GIVEN, legacy_search_terms = NOT_GIVEN, legacy_match_all = NOT_GIVEN, size: '300x300', color: 'red', search_terms: ['all'], match_all: false); end

    sig do
      params(
        size: T.untyped,
        format: T.untyped,
        search_terms: T.untyped,
        match_all: T.untyped
      ).returns(T.untyped)
    end
    def self.build_url(size, format, search_terms, match_all); end
  end

  class PhoneNumber < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.phone_number; end

    sig { returns(T.untyped) }
    def self.cell_phone; end

    sig { returns(T.untyped) }
    def self.country_code; end

    sig { returns(T.untyped) }
    def self.phone_number_with_country_code; end

    sig { returns(T.untyped) }
    def self.cell_phone_with_country_code; end

    # US and Canada only
    sig { returns(T.untyped) }
    def self.area_code; end

    # US and Canada only
    sig { returns(T.untyped) }
    def self.exchange_code; end

    # US and Canada only
    # Can be used for both extensions and last four digits of phone number.
    # Since extensions can be of variable length, this method taks a length parameter
    sig { params(legacy_length: T.untyped, length: T.untyped).returns(T.untyped) }
    def self.subscriber_number(legacy_length = NOT_GIVEN, length: 4); end
  end

  class Relationship < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { params(legacy_connection: T.untyped, connection: T.untyped).returns(T.untyped) }
    def self.familial(legacy_connection = NOT_GIVEN, connection: nil); end

    sig { returns(T.untyped) }
    def self.in_law; end

    sig { returns(T.untyped) }
    def self.spouse; end

    sig { returns(T.untyped) }
    def self.parent; end

    sig { returns(T.untyped) }
    def self.sibling; end
  end

  class SouthAfrica < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    sig { returns(T.untyped) }
    def self.id_number; end

    sig { returns(T.untyped) }
    def self.valid_id_number; end

    sig { returns(T.untyped) }
    def self.invalid_id_number; end

    sig { returns(T.untyped) }
    def self.phone_number; end

    sig { returns(T.untyped) }
    def self.cell_phone; end

    sig { returns(T.untyped) }
    def self.pty_ltd_registration_number; end

    sig { returns(T.untyped) }
    def self.close_corporation_registration_number; end

    sig { returns(T.untyped) }
    def self.listed_company_registration_number; end

    sig { returns(T.untyped) }
    def self.trust_registration_number; end

    sig { returns(T.untyped) }
    def self.vat_number; end
  end

  class Subscription < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a subscription plan.
    # 
    # ```ruby
    # Faker::Subscription.plan #=> "Platinum"
    # ```
    sig { returns(String) }
    def self.plan; end

    # Produces a subscription status.
    # 
    # ```ruby
    # Faker::Subscription.status #=> "Active"
    # ```
    sig { returns(String) }
    def self.status; end

    # Produces the name of a payment method.
    # 
    # ```ruby
    # Faker::Subscription.payment_method #=> "PayPal"
    # ```
    sig { returns(String) }
    def self.payment_method; end

    # Produces the name of a subscription term.
    # 
    # ```ruby
    # Faker::Subscription.subscription_term #=> "Annual"
    # ```
    sig { returns(String) }
    def self.subscription_term; end

    # Produces the name of a payment term.
    # 
    # ```ruby
    # Faker::Subscription.payment_term #=> "Monthly"
    # ```
    sig { returns(String) }
    def self.payment_term; end
  end

  class DrivingLicence < Faker::Base
    GB_PADDING = T.let('9999', T.untyped)
    NI_CHANCE = T.let(0.03, T.untyped)
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # rubocop:disable Metrics/ParameterLists
    sig do
      params(
        legacy_last_name: T.untyped,
        legacy_initials: T.untyped,
        legacy_gender: T.untyped,
        legacy_date_of_birth: T.untyped,
        last_name: T.untyped,
        initials: T.untyped,
        gender: T.untyped,
        date_of_birth: T.untyped
      ).returns(T.untyped)
    end
    def self.british_driving_licence(legacy_last_name = NOT_GIVEN, legacy_initials = NOT_GIVEN, legacy_gender = NOT_GIVEN, legacy_date_of_birth = NOT_GIVEN, last_name: Faker::Name.last_name, initials: Faker::Name.initials, gender: random_gender, date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65)); end

    sig { returns(T.untyped) }
    def self.northern_irish_driving_licence; end

    sig { params(args: T.untyped).returns(T.untyped) }
    def self.uk_driving_licence(*args); end

    sig { returns(T.untyped) }
    def self.random_gender; end

    sig { params(str: T.untyped, num_chars: T.untyped).returns(T.untyped) }
    def self.gb_licence_padding(str, num_chars); end

    sig { params(dob: T.untyped, gender: T.untyped).returns(T.untyped) }
    def self.gb_licence_year(dob, gender); end

    sig { returns(T.untyped) }
    def self.gb_licence_checksum; end
  end

  class JapaneseMedia
    class OnePiece < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces a character from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.character #=> "Monkey D. Luffy"
      # ```
      sig { returns(String) }
      def self.character; end

      # Produces a sea from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.sea #=> "East Blue"
      # ```
      sig { returns(String) }
      def self.sea; end

      # Produces an island from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.island #=> "Laftel"
      # ```
      sig { returns(String) }
      def self.island; end

      # Produces a location from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.location #=> "Foosha Village"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces a quote from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.quote #=> "ONE PIECE IS REAL!"
      # ```
      sig { returns(String) }
      def self.quote; end

      # Produces an akuma no mi from One Piece.
      # 
      # ```ruby
      # Faker::JapaneseMedia::OnePiece.akuma_no_mi #=> "Gomu Gomu no Mi"
      # ```
      sig { returns(String) }
      def self.akuma_no_mi; end
    end

    class DragonBall < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the name of a character from Dragon Ball.
      # 
      # ```ruby
      # Faker::Games::DragonBall.character #=> "Goku"
      # ```
      sig { returns(String) }
      def self.character; end
    end

    class SwordArtOnline < Faker::Base
      Numbers = T.let(Array(0..9), T.untyped)
      ULetters = T.let(Array('A'..'Z'), T.untyped)
      LLetters = T.let(Array('a'..'z'), T.untyped)
      Letters = T.let(ULetters + LLetters, T.untyped)
      NOT_GIVEN = T.let(Object.new, T.untyped)

      # Produces the real name of a character from Sword Art Online.
      # 
      # ```ruby
      # Faker::JapaneseMedia::SwordArtOnline.real_name #=> "Kirigaya Kazuto"
      # ```
      sig { returns(String) }
      def self.real_name; end

      # Produces the in-game name of a character from Sword Art Online.
      # 
      # ```ruby
      # Faker::JapaneseMedia::SwordArtOnline.game_name #=> "Silica"
      # ```
      sig { returns(String) }
      def self.game_name; end

      # Produces the name of a location from Sword Art Online.
      # 
      # ```ruby
      # Faker::JapaneseMedia::SwordArtOnline.location #=> "Ruby Palace"
      # ```
      sig { returns(String) }
      def self.location; end

      # Produces the name of an item from Sword Art Online.
      # 
      # ```ruby
      # Faker::JapaneseMedia::SwordArtOnline.item #=> "Blackwyrm Coat"
      # ```
      sig { returns(String) }
      def self.item; end
    end
  end

  class IndustrySegments < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of an industry.
    # 
    # ```ruby
    # Faker::IndustrySegments.industry #=> "Basic Materials"
    # ```
    sig { returns(String) }
    def self.industry; end

    # Produces the name of a super-sector of an industry.
    # 
    # ```ruby
    # Faker::IndustrySegments.super_sector #=> "Basic Resources"
    # ```
    sig { returns(String) }
    def self.super_sector; end

    # Produces the name of a sector of an industry.
    # 
    # ```ruby
    # Faker::IndustrySegments.sector #=> "Industrial Metals & Mining"
    # ```
    sig { returns(String) }
    def self.sector; end

    # Produces the name of a subsector of an industry.
    # 
    # ```ruby
    # Faker::IndustrySegments.industry #=> "Basic Materials"
    # ```
    sig { returns(String) }
    def self.sub_sector; end
  end

  class GreekPhilosophers < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a Greek philosopher.
    # 
    # ```ruby
    # Faker::GreekPhilosophers.name #=> "Socrates"
    # ```
    sig { returns(String) }
    def self.name; end

    # Produces a quote from a Greek philosopher.
    # 
    # ```ruby
    # Faker::GreekPhilosophers.quote #=> "Only the educated are free."
    # ```
    sig { returns(String) }
    def self.quote; end
  end

  class ProgrammingLanguage < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces the name of a programming language.
    # 
    # ```ruby
    # Faker::ProgrammingLanguage.name #=> "Ruby"
    # ```
    sig { returns(String) }
    def self.name; end

    # Produces the name of a programming language's creator.
    # 
    # ```ruby
    # Faker::ProgrammingLanguage.creator #=> "Yukihiro Matsumoto"
    # ```
    sig { returns(String) }
    def self.creator; end
  end

  class ElectricalComponents < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces an active electrical component.
    # 
    # ```ruby
    # Faker::ElectricalComponents.active #=> "Transistor"
    # ```
    sig { returns(String) }
    def self.active; end

    # Produces a passive electrical component.
    # 
    # ```ruby
    # Faker::ElectricalComponents.passive #=> "Resistor"
    # ```
    sig { returns(String) }
    def self.passive; end

    # Produces an electromechanical electrical component.
    # 
    # ```ruby
    # Faker::ElectricalComponents.electromechanical #=> "Toggle Switch"
    # ```
    sig { returns(String) }
    def self.electromechanical; end
  end

  class NatoPhoneticAlphabet < Faker::Base
    Numbers = T.let(Array(0..9), T.untyped)
    ULetters = T.let(Array('A'..'Z'), T.untyped)
    LLetters = T.let(Array('a'..'z'), T.untyped)
    Letters = T.let(ULetters + LLetters, T.untyped)
    NOT_GIVEN = T.let(Object.new, T.untyped)

    # Produces a code word from the NATO phonetic alphabet.
    # 
    # ```ruby
    # Faker::NatoPhoneticAlphabet.code_word #=> "Hotel"
    # ```
    sig { returns(String) }
    def self.code_word; end
  end
end
