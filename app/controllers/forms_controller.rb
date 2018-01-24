class FormsController < ApplicationController
  # protect_from_forgery prepend: true, with: :exception
  # before_action :authenticate_model!

  before_action :set_form, only: [:show, :edit, :update]


  # # GET /forms
  # # GET /forms.json
  def index
    @forms = Form.all

    render json: @forms
  end
  #
  # # GET /forms/1
  # # GET /forms/1.json
  def show
    # forbidden_request
    render json: @form
  end
  #
  # # GET /forms/new
  def new
    @form = Form.new
    # forbidden_request
  end
  #
  # # GET /forms/1/edit
  # def edit
  #   forbidden_request
  # end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)

    # respond_to do |format|
      if @form.save
        # format.html { redirect_to @form, notice: 'Form was successfully created.' }
        # format.json { render :show, status: :created, location: @form }
        render json: @form, status: :created, location: @form
        FormMailer.send_email_notification(@form).deliver_now
        # WFEmailMailer.send_wf_email(@form).deliver_later
      else
        render json: @form.errors, status: :unprocessable_entity
        # format.html { render :new }
        # format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    # end
  end

  # # PATCH/PUT /forms/1
  # # PATCH/PUT /forms/1.json
  def update
    # respond_to do |format|
      if @form.update(form_params)
        render json: @form
        # format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        # format.json { render :show, status: :ok, location: @form }
      else
        render json: @form.errors, status: :unprocessable_entity
        # format.html { render :edit }
        # format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    # end
  end
  #
  # # DELETE /forms/1
  # # DELETE /forms/1.json
  def destroy
    @form.destroy
    # respond_to do |format|
    #   format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:topic, :from, :name, :comments, :app_name, :app_version, :build_number, :device, :os_version)
    end
end
