require_relative "Employee"
require_relative "manager"

ned = Employee.new("Ned", 1000000, "Founder", nil)
darren = Employee.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)

ned = Manager.new([darren])
darren = Manager.new([shawna, david])

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)