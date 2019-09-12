require_relative "Employee"

class Manager < Employee
  attr_accessor :employees
  def initialize(employees)
    @employees = employees
    
  end

  def bonus(multiplier)
    
    (sum_all_employee_salaries - salary) * multiplier
  end

  def sum_all_employee_salaries
    #base case
    case self
    when Employee
      self.salary
    #recursive case
    when Manager
      employee_salaries_sum = employees.map { |employee| employee.sum_all_employee_salaries }.sum
      self.salary + employee_salaries_sum
    end
  end

end