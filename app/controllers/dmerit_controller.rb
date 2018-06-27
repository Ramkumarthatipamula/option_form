class DmeritController < ApplicationController
  # before_action :set_certificate, only: [:alloatment_index1]
  skip_before_filter :verify_authenticity_token

  def alloatment_form
    @dmerit = Dmerit.new
  end

  def alloatment_index1
    @dmerit = Dmerit.find_by_f_rank(params[:rank].to_i)
    if !@dmerit.present?
      redirect_to :controller => 'dmerit', :action => 'alloatment_form'
    end
    @result = Dmerit.get_alloatment(@dmerit)
    # @result[:details]
    # @c = []
    # @result[:details].each do |a|
    #   @c << a[0..3]
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate
      @dmerit = Dmerit.find_by_f_rank(params[:dmerit][:f_rank].to_i)
      @dmerit.present? ? @dmerit : nil
    end
end
