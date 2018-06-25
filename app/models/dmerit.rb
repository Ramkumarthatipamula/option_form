class Dmerit < ApplicationRecord
  serialize :subjects, Hash
  serialize :special, Hash

  def self.get_alloatment(dmerit)
    result = {}
    result[:details] = []
    colleges = College.all

    @a = first_test_in_govt_college

  end

  def first_test_in_govt_college

    College.all.each do |college|



      case dmerit.caste
        when 'A'
          seat_govt = Dseat.where(code: "GOVT").collect{|seats| [seats.oc_g, seats.oc_w, seats.a_g, seats.a_w, seats.tot] }
          seat_list = Dseat.where(code: college.code).collect{|seats| [seats.oc_g, seats.oc_w, seats.a_g, seats.a_w, seats.tot] }
        when 'B'
          seat_govt = Dseat.where(code: "GOVT").collect{|seats| [seats.oc_g, seats.oc_w, seats.b_g, seats.b_w, seats.tot] }
          seat_list = Dseat.where(code: college.code).collect{|seats| [seats.oc_g, seats.oc_w, seats.b_g, seats.b_w, seats.tot] }
        when 'C'
          seat_govt = Dseat.where(code: "GOVT").collect{|seats| [seats.oc_g, seats.oc_w, seats.c_g, seats.c_w, seats.tot] }
          seat_list = Dseat.where(code: college.code).collect{|seats| [seats.oc_g, seats.oc_w, seats.c_g, seats.c_w, seats.tot] }
        when 'D'
          seat_govt = Dseat.where(code: "GOVT").collect{|seats| [seats.oc_g, seats.oc_w, seats.d_g, seats.d_w, seats.tot] }
          seat_list = Dseat.where(code: college.code).collect{|seats| [seats.oc_g, seats.oc_w, seats.d_g, seats.d_w, seats.tot] }
        when 'E'
          seat_govt = Dseat.where(code: "GOVT").collect{|seats| [seats.oc_g, seats.oc_w, seats.e_g, seats.e_w, seats.tot] }
          seat_list = Dseat.where(code: college.code).collect{|seats| [seats.oc_g, seats.oc_w, seats.e_g, seats.e_w, seats.tot] }
        when 'F'
          seat_govt = Dseat.where(code: "GOVT").collect{|seats| [seats.oc_g, seats.oc_w, seats.f_g, seats.f_w, seats.tot] }
          seat_list = Dseat.where(code: college.code).collect{|seats| [seats.oc_g, seats.oc_w, seats.f_g, seats.f_w, seats.tot] }
        else
          seat_govt = Dseat.where(code: "GOVT").collect{|seats| [seats.oc_g, seats.oc_w, seats.g_g, seats.g_w, seats.tot] }
          seat_list = Dseat.where(code: college.code).collect{|seats| [seats.oc_g, seats.oc_w, seats.g_g, seats.g_w, seats.tot] }
        end
      a = allocation(dmerit, seat_list)
      result[:details] = result[:details].push(college.code + '/' + a) if a.present?
    end
  end





  def allocation(dmerit, seat_list)
    if seats.code=="PLAP" or seats.code=="JGAP" or seats.code=="KPAP" or seats.code=="MDAP" and seats.code=="TRAP" or seats.code=="JMAP" or seats.code=="MTAP" or seats.code=="BSAP" and seats.code=="WGAP" or seats.code=="SGAP"
      if dmerit.gender == "W"
        if seats.code!="JMAP" or seats.code!="MTAP" or seats.code!="BSAP" or seats.code!="GGAP" or seats.code!="GOVT"
        if seat_govt[1][1]>0
          return "NL/OC/W"

          COLLEGE CLASS

        elsif seat_govt[1][0]>0
          return "NL/OC/G"

          COLLEGE CLASS

        end
        if dmerit.area
          if seat_govt[0][1]>0
            return "OU/OC/W"

            COLLEGE CLASS

          elsif seat_govt[0][0]>0
            return "OU/OC/G"

            COLLEGE CLASS

          end
        end
      end
      elsif seats.code!="SGAP" or seats.code!="WGAP" or seats.code!="GOVT"
        if seat_govt[4]>0
          return "NL/OC/G"

          COLLEGE CLASS

        elsif dmerit.area
          if seat_govt[0]>0
            return "OU/OC/G"

            COLLEGE CLASS

          end
        end

      end
      end
      end
      end


  else

    COLLEGE CLASS

end






    if dmerit.gender == "W"
      if seats.code!="JMAP" or seats.code!="MTAP" or seats.code!="BSAP" or seats.code!="GGAP" or seats.code!="GOVT"
      if seat_list[1][1]>0
        return "NL/OC/W"
      elsif seat_list[1][0]>0
        return "NL/OC/G"
      end
      if dmerit.area
        if seat_list[0][1]>0
          return "OU/OC/W"
        elsif seat_list[0][0]>0
          return "OU/OC/G"
        end
      end
    end
    elsif seats.code!="SGAP" or seats.code!="WGAP" or seats.code!="GOVT"
      if seat_list[4]>0
        return "NL/OC/G"
      elsif dmerit.area
        if seat_list[0]>0
          return "OU/OC/G"
        end
      end

    end
  end
end
end
