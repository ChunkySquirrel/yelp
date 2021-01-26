class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    if @review.user_id == current_user.id
      render 'show'
    else
      redirect_to business_path(@business)
    end
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    if @review.user_id == current_user.id
      render 'edit'
    else
      redirect_to business_path(@business)
    end
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.create(review_params)
    @review.user_id = current_user.id
    @review.business_id = @business.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to @business, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end
    def set_business
      @business = Business.find(params[:business_id])
    end
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
