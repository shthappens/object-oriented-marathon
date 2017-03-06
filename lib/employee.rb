class Employee

  attr_reader :name, :title, :greet

  def initialize(name, title = "Zoo Keeper")
    @name = name
    @title = title
  end

  def full_title
    "#{name}, #{title}"
  end

  def greet
    "#{name} waved hello!"
  end

end
