require "pry"

class Doctor
    attr_accessor :name
    @@all = []

    def initialize (name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |app|
            app.doctor == self
        end
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def patients
        self.appointments.map do |app|
            app.patient
            #binding.pry
        end
    end

end