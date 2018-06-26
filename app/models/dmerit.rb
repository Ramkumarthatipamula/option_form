class Dmerit < ApplicationRecord
  serialize :subjects, Hash
  serialize :special, Hash

  def self.get_alloatment(dmerit)
    @result = {}
    @result[:details] = []
    @seats = Dseat.all

    if college_seats.present?
      college_seat_allocation = allocation(dmerit, college_seats, code)
    end
    @b = allocation(dmerit.gender, college_seats, code)
    @result[:details] << @b if @b.present?
    @seats.each do |college|
      college_seats =  get_seats(college.code)
      if college_seats.present?
        college_seat_allocation = allocation(dmerit.gender, college_seats, college.code)
        @result[:details] << college_seat_allocation if college_seat_allocation.present?
      end
    end
    @result
  end

  def self.get_seats(college_code)
    seats = @seats.where(code: college_code).collect{|seats| [seats.oc_g, seats.oc_w] }
    return !seats[0].blank? ? seats[0] + seats[1] : ''
  end

  def self.allocation(gender, college_seats, college_code)
    if college_code=="GOVT" || college_code=="PLAP" || college_code=="JGAP" || college_code=="KPAP" || college_code=="MDAP" and college_code=="TRAP" || college_code=="JMAP" || college_code=="MTAP" || college_code=="BSAP" || college_code=="WGAP" || college_code=="SGAP"
      if gender == "W"
        if college_code!="JMAP" or college_code!="MTAP" or college_code!="BSAP" or college_code!="GGAP" or college_code!="GOVT"
          if college_seats[3]>0
            return "#{college_code}/NL/OC/W"
            @seat_allocation = college_class
            return @seat_allocation if seat_allocation.present
          elsif college_seats[2]>0
            return "#{college_code}/NL/OC/G"
            @seat_allocation = college_class
            return @seat_allocation if seat_allocation.present
          end
          if dmerit.area
            if college_seats[1]>0
              return "#{college_code}/OU/OC/W"
              @seat_allocation = college_class
              return @seat_allocation if seat_allocation.present
            elsif college_seats[0]>0
              return "#{college_code}/OU/OC/G"
              @seat_allocation = college_class
              return @seat_allocation if seat_allocation.present
            end
          end
        elsif college_code!="SGAP" or college_code!="WGAP" or college_code!="GOVT"
          if college_seats[2]>0
            return "#{college_code}/NL/OC/G"
            @seat_allocation = college_class
            return @seat_allocation if seat_allocation.present
          elsif dmerit.area
            if college_seats[0]>0
              return "#{college_code}/OU/OC/G"
              @seat_allocation = college_class
              return @seat_allocation if seat_allocation.present
            end
          end
        end
      else
        @seat_allocation = college_class
        return @seat_allocation if seat_allocation.present
      end
    end
  end

  def self.college_class
    if dmerit.gender == "W"
      if college_code!="JMAP" or college_code!="MTAP" or college_code!="BSAP" or college_code!="GGAP" or college_code!="GOVT"
        if college_seats[3]>0
          return "#{college_code}/NL/OC/W"
        elsif college_seats[2]>0
          return "#{college_code}/NL/OC/G"
        end
        if dmerit.area
          if college_seats[1]>0
            return "#{college_code}/OU/OC/W"
          elsif college_seats[0]>0
            return "#{college_code}/OU/OC/G"
          end
        end
      elsif college_code!="SGAP" or college_code!="WGAP" or college_code!="GOVT"
        if college_seats[2]>0
          return "#{college_code}/NL/OC/G"
        elsif dmerit.area
          if college_seats[0]>0
            return "#{college_code}/OU/OC/G"
          end
        end
      end
    end
  end
end
