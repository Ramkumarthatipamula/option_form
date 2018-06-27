class Dmerit < ApplicationRecord
  serialize :subjects, Hash
  serialize :special, Hash

  def self.get_alloatment(dmerit)
    result = {}
    result[:details] = []
    seat_govt = Dseat.where(code: "GOVT").collect{|seats| [seats.oc_g, seats.oc_w] }
    seat_govt = seat_govt[0] + seat_govt[1]
    @govt_seat_allocation = check_govt_seat(dmerit, seat_govt, "GOVT")

    College.all.each do |college|
      @e = Dseat.where(code: college.code).collect{|seats| [seats.oc_g, seats.oc_w] }
      seat_list = @e[0] + @e[1]
      a = allocation(dmerit, seat_list, college.code)
      result[:details] << a if a.present?
    end
    result
  end

  def self.check_govt_seat(dmerit, seat_govt, code)
    if dmerit.gender == "W"
      if code!="JMAP" || code!="MTAP" || code!="BSAP" || code!="GGAP" || code!="GOVT"
        if seat_govt[3]>0
          @seat_area = "NL/OC/W"
          # @c = college_class(dmerit, @seat_list, code)
          # return @c if @c.present?
        elsif seat_govt[2]>0
          @seat_area = "NL/OC/G"
          # @c = college_class(dmerit, @seat_list, code)
          # return @c if @c.present?
        end
        if dmerit.area
          if seat_govt[1]>0
            @seat_area = "OU/OC/W"
            # @c = college_class(dmerit, @seat_list, code)
            # return @c if @c.present?

          elsif seat_govt[0]>0
            @seat_area = "OU/OC/G"
            # @c = college_class(dmerit, @seat_list, code)
            # return @c if @c.present?
          end
        end
      end
    elsif code!="SGAP" || code!="WAAP" || code!="GOVT"
      if seat_govt[2]>0
        @seat_area = "NL/OC/G"
        # @c = college_class(dmerit, @seat_list, code)
        # return @c if @c.present?
      elsif dmerit.area
        if seat_govt[0]>0
          @seat_area = "OU/OC/G"
          # @c = college_class(dmerit, @seat_list, code)
          # return @c if @c.present?
        end
      end
    end
  end

  def self.allocation(dmerit, seat_list, code)
    if code=="PLAP" || code=="JGAP" || code=="KPAP" || code=="MDAP" || code=="TRAP" || code=="JMAP" || code=="MTAP" || code=="BSAP" || code=="WAAP" || code=="SGAP"
      @c = college_class(dmerit, seat_list, code)
      return [code, @govt_seat_allocation, @c] if @c.present?
    else
      @c = college_class(dmerit, seat_list, code)
      return [code, @govt_seat_allocation, @c] if @c.present?
    end
  end

  def  self.college_class(dmerit, seat_list, code)
    if dmerit.gender == "W"
      if code!="JMAP" || code!="MTAP" || code!="BSAP" || code!="GGAP" || code!="GOVT"
        if seat_list[3]>0
          return "#{code}/NL/OC/W"
        elsif seat_list[2]>0
          return "#{code}/NL/OC/G"
        end
        if dmerit.area
          if seat_list[1]>0
            return "#{code}/OU/OC/W"
          elsif seat_list[0]>0
            return "#{code}/OU/OC/G"
          end
        end
      end
    elsif code!="SGAP" || code!="WAAP" || code!="GOVT"
      if seat_list[2]>0
        return "#{code}/NL/OC/G"
      elsif dmerit.area
        if seat_list[0]>0
          return "#{code}/OU/OC/G"
        end
      end
    end
  end
end
