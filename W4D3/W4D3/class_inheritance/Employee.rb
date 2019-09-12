class Employee
  attr_accessor :title, :salary, :boss, :name

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * mulitplier
  end

end