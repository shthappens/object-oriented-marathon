require 'date'


class ZooAtCapacity < StandardError
end

class Zoo

  attr_reader :zoo_name, :season_opening_date, :season_closing_date, :cages
  attr_reader :employees

  def initialize(zoo_name, season_opening_date, season_closing_date)
    @zoo_name = zoo_name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = Array.new(10) { Cage.new }
    @employees = []
  end

  def cages
    @cages
  end

  def add_employee(person)
    @employees << person
  end

  def open?(date)
    if date > @season_opening_date && date < @season_closing_date
      true
    else
      false
    end
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.animal == nil
        cage.animal = animal
        return true
      end
    end
    raise ZooAtCapacity
  end

  def visit
    string = ""
    @employees.each do |employee|
      string += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      if cage.animal != nil
        string += "#{cage.animal.speak}\n"
      end
    end
    return string
  end

end
