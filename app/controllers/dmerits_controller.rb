class DmeritsController < ApplicationController
  # before_action :set_certificate, only: [:alloatment_index1]

  def alloatment_form
    @dmerit = Dmerit.new
  end

  def alloatment_index1
    @dmerit = Dmerit.find_by_f_rank(params[:rank].to_i)
    if !@dmerit.present? || params[:rank] == ''
      redirect_to :controller => 'dmerit', :action => 'alloatment_form'
    end
    @result = Dmerit.get_alloatment(@dmerit)
  end

  def executer_route
    seat_alloted = params[:seat_area].downcase.split('/')
    area = seat_alloted[1] == 'nl' ? false : true
    category = seat_alloted[2] + "_" + seat_alloted[3]
    dseat_record = Dseat.where(code: seat_alloted[0].upcase, area: area).first
    if category == 'oc_g'
     dseat_record.oc_g = dseat_record.oc_g - 1
    elsif category == 'oc_w'
     dseat_record.oc_w = dseat_record.oc_w - 1
    end
    respond_to do |format|
      if dseat_record.save
        redirect_to :controller => 'dmerit', :action => 'alloatment_form'
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_certificate
    @dmerit = Dmerit.find_by_f_rank(params[:dmerit][:f_rank].to_i)
    @dmerit.present? ? @dmerit : nil
  end
end
