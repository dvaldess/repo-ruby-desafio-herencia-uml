class Appointment 
    attr_reader :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min) # Metodo constructor con atributos
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end
class MonthlyAppointment < Appointment 
    attr_reader :day # Aqui solo definimos el nuevo atributo, los otros son hereados desde el padre
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min, day) # El metodo Super llama a los metodos de la clase padre 
        @day = day
    end
    def occurs_on?(day)
        @day == day
        # self.day == day # Tambien funciona
    end
    def to_s
        "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}"
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        @hour == hour && @min == min
    end
    def to_s
        # "Reunión diaria en #{self.location} sobre #{self.purpose} a la(s) #{self.hour}:#{self.min}" #Se recomienda utilizar esta opción
        "Reunión diaria en #{ @location } sobre #{ @purpose } a la(s) #{ @hour }:#{ @min }"# Tambien funciona, pero con estos te saltas los seters
    end
end

class OneTimeAppointment < Appointment 
    attr_reader :location, :purpose, :hour, :min, :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        @day = day
        @month = month
        @year = year
    end
    def occurs_on?(day, month, year)
        @day == day && @month == month && @year == year
    end
    def to_s
        "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
    end
end

a = MonthlyAppointment.new('MARTE', 'Aliens', 8, 15, 23).occurs_on?(23)

b = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15).occurs_on?(8,15)

c = OneTimeAppointment.new('Desafío Latam', 'Programacion', 14, 30, 7, 7, 2021).occurs_on?(7,7,2021)