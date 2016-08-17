class HandicapCalculator
  def initialize(user)
    @user = user
  end

  def get_handicap_index
    my_scorecards = Handicap.my_handicaps(@user)
    my_scorecards = my_scorecards.reverse.shift(20)
    my_handicap_differentials = []
    my_scorecards.each do |card|
      my_handicap_differentials << card.differential
    end

    my_handicap_differentials = my_handicap_differentials.sort!

    needed_differentials = []
    if my_handicap_differentials.length <= 6
      needed_differentials << my_handicap_differentials.shift
    elsif my_handicap_differentials.length <= 8
      needed_differentials = my_handicap_differentials.shift(2)
    elsif my_handicap_differentials.length <= 10
      needed_differentials = my_handicap_differentials.shift(3)
    elsif my_handicap_differentials.length <= 12
      needed_differentials = my_handicap_differentials.shift(4)
    elsif my_handicap_differentials.length <= 14
      needed_differentials = my_handicap_differentials.shift(5)
    elsif my_handicap_differentials.length <= 16
      needed_differentials = my_handicap_differentials.shift(6)
    elsif my_handicap_differentials.length == 17
      needed_differentials = my_handicap_differentials.shift(7)
    elsif my_handicap_differentials.length == 18
      needed_differentials = my_handicap_differentials.shift(8)
    elsif my_handicap_differentials.length == 19
      needed_differentials = my_handicap_differentials.shift(9)
    else
      needed_differentials = my_handicap_differentials.shift(10)
    end

    average_differential = (needed_differentials.reduce(:+)) / (needed_differentials.length)
    handicap_index = (average_differential * 0.96).round(2)
    return handicap_index, needed_differentials.length
  end

end
