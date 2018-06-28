class CertificatesController < ApplicationController
  before_action :set_certificate, only: [:show, :edit, :update, :update_password, :destroy, :download]

  def home_page
  end
  # GET /certificates
  # GET /certificates.json
  def index
    @certificates = Certificate.all
  end

  # GET /certificates/1
  # GET /certificates/1.json
  def show
  end

  # GET /certificates/new
  def new
    @certificate = Certificate.new
  end

  # GET /certificates/1/edit
  def edit
  end

  # POST /certificates
  # POST /certificates.json
  def create
    @certificate = Certificate.new(certificate_params)
    respond_to do |format|
      if @certificate.save
        format.html { redirect_to root_path, notice: 'Certificate was successfully created.' }
        format.json { render :show, status: :created, location: @certificate }
      else
        format.html { render :new }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificates/1
  # PATCH/PUT /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(certificate_params)
        format.html { redirect_to root_path, notice: 'Certificate was successfully updated.' }
        format.json { render root_path, status: :ok, location: @certificate }
      else
        format.html { render :edit }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificates/1
  # DELETE /certificates/1.json
  def destroy
    @certificate.destroy
    respond_to do |format|
      format.html { redirect_to certificates_url, notice: 'Certificate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
   respond_to do |format|
     format.html {
       if params[:post_id].nil?
           redirect_to :back
       else
         begin
           post = Certificate.find(params[:post_id])
           attachment_file = File.join('public', post.attachment.url)
           if File.exists?(attachment_file)
             send_file attachment_file, :disposition => 'attachment'
           else
             redirect_to :back
           end
         rescue Exception => error
           redirect_to :back
         end
       end
     }
   end
 end

 def alloatment_form
   @dmerit = Dmerit.new
 end

 def alloatment_index1
   @dmerit = Dmerit.find_by_f_rank(params[:rank].to_i)
   respond_to do |format|
     if !@dmerit.present? || params[:rank] == ''
       format.html { redirect_to alloatment_form_certificates_path, notice: 'Rank is not existed in records.' }
       format.json { render root_path, status: :ok, location: @certificate }
     else
       @result = Dmerit.get_alloatment(@dmerit)
       @result[:dmerit] = [@dmerit.applicant_name, @dmerit.caste, @dmerit.gender, @dmerit.f_rank]
       format.html { render alloatment_index1_certificates_path }
       format.json { render json: @certificate.errors, status: :unprocessable_entity }
     end
   end
 end

 def executer_route
   area = params[:area] == 'NL' ? false : true
   dseat_record = Dseat.where(code: params[:code], area: area).first
    if params[:category] == 'OC_G'
      dseat_record.oc_g = dseat_record.oc_g - 1
    elsif params[:category] == 'OC_W'
      dseat_record.oc_w = dseat_record.oc_w - 1
    end
   respond_to do |format|
     if dseat_record.save
       Allotment.create(student_name: params[:student_name], gender: params[:gender], rank: params[:rank], college_name: params[:college_name], area: params[:area],category: params[:category], allotment: params[:allotment])
       format.html { redirect_to alloatment_form_certificates_path }
       format.json { render json: @certificate.errors, status: :unprocessable_entity }
     end
   end
 end

 def retrieve_courses_and_colleges_based_on_academic_program
   if params[:academic_program] == "UG"
     result = { "B.Sc.(Agriculture)" => ["College of Agriculture, Rajendranagar, Hyderabad", "Agricultural College, Aswaraopet", "Agricultural College, Jagtial", "Agricultural College, Palem", "Agricultural College, Warangal"], "B.Sc.(CA&BM)" => ["College of Agriculture, Rajendranagar, Hyderabad"], "B.Sc.(Hons.) Home Science" => ["College of Home Science, Saifabad, Hyderabad"], "B.Sc.(Hons.) Food Science & Nutrition" => ["College of Home Science, Saifabad, Hyderabad"], "B.Sc.(Hons.) Fashion Technology" => ["College of Home Science, Saifabad, Hyderabad"], "B.Tech.(Agricultural Engineering)" => ["College of Agricultural Engineering, Kandi, Sangareddy"], "B.Tech.(Food Technology)" => ["College of Food Science and Technology, Rudrur"]}

   elsif params[:academic_program] == "PG"
     result = []

   elsif params[:academic_program] == "Diploma(2 Years)"
     result = { "Diploma in Agriculture" => ["Agricultural Polytechnic, Jammikunta, Karimnagar Dist.","Agricultural Polytechnic, Kampasagar, Nalgonda Dist.","Agricultural Polytechnic, Palem, Nagarkurnool Dist.","Agricultural Polytechnic, Basanthpur, Sangareddy Dist.","Agricultural Polytechnic, Warangal, Warangal Dist.","Agricultural Polytechnic, Madhira, Khammam Dist.","Agricultural Polytechnic, Sangupet, Sangareddy Dist.","Agricultural Polytechnic, Sircilla, Rajanna Sircilla Dist.","Agricultural Polytechnic, Malthumeda, Kamareddy Dist.","Mother Teresa Agricultural Polytechnic, Sathupally, Khammam Dist.","Pujya Shri Madhavanji Agricultural Polytechnic, Aware Puram, Aswaraopet, Kothagudem Dist.","Sagar Agricultural Polytechnic (FABS), Chevella, Rangareddy Dist.","Bade Kotaiah Memorial Agricultural Polytechnic, Polenigudem, Suryapet Dist.","Shiva Keshava Agricultural Polytechnic, Panchagama, Narayankhed, Sangareddy Dist.","Agricultural Polytechnic, Polasa, Jagtial Dist.", "Agricultural Polytechnic, Tornala, Siddipet Dist.", "Ratnapuri Agricultural Polytechnic, Turkala Khanapur, Sangareddy Dist.", "Dr. D.Rama Naidu Vignana Jyothi Agriculture Polytechnic, Tuniki, Medak Dist."], "Diploma in Seed Technology" => ["Seed Technology Polytechnic, Rudrur, Nizamabad Dist.", "Dr. D.Rama Naidu Vignana Jyothi Seed Technology Polytechnic, Tuniki, Medak Dist."]}

   elsif params[:academic_program] == "Diploma(3 Years)"
     result = { "Diploma in Agricultural Engineering" => ["Institute of Agricultural Engineering & Technology, Rajendranagar, Hyderabad.","Dr. D. Rama Naidu Vignana Jyothi Agricultural Engineering Polytechnic, Tuniki, Medak Dist.","Mother Teresa Agricultural Engineering Polytechnic, Sathupally, Khammam Dist.","Ratnapuri Agricultural Engineering Polytechnic, Turkala Khanapur, Sangareddy Dist."]}
   end

   respond_to do |format|
     format.json { render json: result }
   end
 end

 def retrieve_colleges_based_on_degree
  result = case params[:degree_name]
  when "B.Sc.(Agriculture)"
    ["College of Agriculture, Rajendranagar, Hyderabad", "Agricultural College, Aswaraopet", "Agricultural College, Jagtial", "Agricultural College, Palem", "Agricultural College, Warangal"]
  when "B.Sc.(CA&BM)"
    ["College of Agriculture, Rajendranagar, Hyderabad"]
  when "B.Sc.(Hons.) Home Science"
    ["College of Home Science, Saifabad, Hyderabad"]
  when "B.Sc.(Hons.) Food Science & Nutrition"
    ["College of Home Science, Saifabad, Hyderabad"]
  when "B.Sc.(Hons.) Fashion Technology"
    ["College of Home Science, Saifabad, Hyderabad"]
  when "B.Tech.(Agricultural Engineering)"
    ["College of Agricultural Engineering, Kandi, Sangareddy"]
  when "B.Tech.(Food Technology)"
    ["College of Food Science and Technology, Rudrur"]
  when "Diploma in Agriculture"
    ["Agricultural Polytechnic, Jammikunta, Karimnagar Dist.","Agricultural Polytechnic, Kampasagar, Nalgonda Dist.","Agricultural Polytechnic, Palem, Nagarkurnool Dist.","Agricultural Polytechnic, Basanthpur, Sangareddy Dist.","Agricultural Polytechnic, Warangal, Warangal Dist.","Agricultural Polytechnic, Madhira, Khammam Dist.","Agricultural Polytechnic, Sangupet, Sangareddy Dist.","Agricultural Polytechnic, Sircilla, Rajanna Sircilla Dist.","Agricultural Polytechnic, Malthumeda, Kamareddy Dist.","Mother Teresa Agricultural Polytechnic, Sathupally, Khammam Dist.","Pujya Shri Madhavanji Agricultural Polytechnic, Aware Puram, Aswaraopet, Kothagudem Dist.","Sagar Agricultural Polytechnic (FABS), Chevella, Rangareddy Dist.","Bade Kotaiah Memorial Agricultural Polytechnic, Polenigudem, Suryapet Dist.","Shiva Keshava Agricultural Polytechnic, Panchagama, Narayankhed, Sangareddy Dist.","Agricultural Polytechnic, Polasa, Jagtial Dist.", "Agricultural Polytechnic, Tornala, Siddipet Dist.", "Ratnapuri Agricultural Polytechnic, Turkala Khanapur, Sangareddy Dist.", "Dr. D.Rama Naidu Vignana Jyothi Agriculture Polytechnic, Tuniki, Medak Dist."]
  when "Diploma in Agricultural Engineering"
    ["Institute of Agricultural Engineering & Technology, Rajendranagar, Hyderabad.","Mother Teresa Agricultural Engineering Polytechnic, Sathupally, Khammam Dist.","Dr. D. Rama Naidu Vignana Jyothi Agricultural Engineering Polytechnic, Tuniki, Medak Dist.","Ratnapuri Agricultural Engineering Polytechnic, Turkala Khanapur, Sangareddy Dist."]
  else
    ["Seed Technology Polytechnic, Rudrur, Nizamabad Dist.", "Dr. D.Rama Naidu Vignana Jyothi Seed Technology Polytechnic, Tuniki, Medak Dist."]
  end
  respond_to do |format|
    format.json { render json: result }
  end
 end

 def get_certificates_data
   current_user.update(academic_program: params[:data_value][0], degree_name: params[:data_value][1], college_name: params[:data_value][2], admission_year: params[:data_value][3])
   @certificates = Certificate.where(academic_program: params[:data_value][0], degree_name: params[:data_value][1], college_name: params[:data_value][2], admission_year: params[:data_value][3])
   render json: { certificates: render_to_string("/certificates/_home_page", layout: false, locals: {:@certificates_data => @certificates}) }
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate
      @certificate = Certificate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificate_params
      params.require(:certificate).permit(:certificate_no, :student_id, :student_name, :father_name, :mother_name, :aadhar_no, :academic_program, :degree_name, :college_name, :admission_year, :attachment)
    end
end
