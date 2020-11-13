class VinylsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:buy]
  before_action :check_roles
  before_action :set_vinyl, only: [:show, :edit, :update, :destroy, :buy]

  # GET /vinyls
  # GET /vinyls.json
  def index
    @vinyls = Vinyl.all
  end

  # GET /vinyls/1
  # GET /vinyls/1.json
  def show
  end

  # GET /vinyls/new
  def new
    @vinyl = current_user.vinyls.build
  end

  # GET /vinyls/1/edit
  def edit
  end

  # POST /vinyls
  # POST /vinyls.json
  def create
    @vinyl = current_user.vinyls.build(vinyl_params)
  

    respond_to do |format|
      if @vinyl.save
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully created.' }
        format.json { render :show, status: :created, location: @vinyl }
      else
        format.html { render :new }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinyls/1
  # PATCH/PUT /vinyls/1.json
  def update
    respond_to do |format|
      if @vinyl.update(vinyl_params)
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully updated.' }
        format.json { render :show, status: :ok, location: @vinyl }
      else
        format.html { render :edit }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinyls/1
  # DELETE /vinyls/1.json
  def destroy
    @vinyl.destroy
    respond_to do |format|
      format.html { redirect_to vinyls_url, notice: 'Vinyl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # put in paths later
  def buy
    Stripe.api_key = ENV['STRIPE_API_KEY']
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: success_url(params[:id]),
      cancel_url: cancel_url(params[:id]),
      line_items: [
        {
          price_data: {
            currency: 'aud',
            product_data: {
              name: @vinyl.title
            },
            unit_amount: (@vinyl.price * 100).to_i
          },
          quantity: 1
        }
      ]
    })

    render json: session
  end


  # change to views later
  def success
    render plain: "Success!"
  end

  def cancel
    render plain: "The transaction was cancelled!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinyl
      @vinyl = Vinyl.find(params[:id])
    end

    def check_roles
      if !current_user.has_role?(:admin)
      
      end
    end

    # Only allow a list of trusted parameters through.
    def vinyl_params
      params.require(:vinyl).permit(:title, :artist, :label, :genre, :year, :quality, :price, :description, :availability, :image)
    end
end
