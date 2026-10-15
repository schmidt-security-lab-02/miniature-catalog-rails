class MiniaturesController < ApplicationController
  before_action :set_miniature, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :create, :update]

  def index
    @categories = Category.alphabetical
    @query = params[:q].to_s.strip.first(100)
    @miniatures = Miniature.includes(:category).alphabetical
    if @query.present?
      query = "%#{ActiveRecord::Base.sanitize_sql_like(@query)}%"
      @miniatures = @miniatures.where("miniatures.name LIKE ? OR manufacturer LIKE ? OR universe LIKE ?", query, query, query)
    end
    @miniatures = @miniatures.where(category_id: params[:category_id]) if params[:category_id].present?
    @miniatures = @miniatures.where(painting_status: params[:painting_status]) if Miniature::STATUSES.key?(params[:painting_status])
    @miniatures = @miniatures.limit(100)
    @total = Miniature.count
  end

  def show; end

  def new
    @miniature = Miniature.new(quantity: 1, painting_status: "unpainted")
  end

  def edit; end

  def create
    @miniature = Miniature.new(miniature_params)
    if @miniature.save
      redirect_to @miniature, notice: "Miniature created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @miniature.update(miniature_params)
      redirect_to @miniature, notice: "Miniature updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @miniature.destroy!
    redirect_to miniatures_path, notice: "Miniature removed.", status: :see_other
  end

  private

  def set_miniature
    @miniature = Miniature.find(params[:id])
  end

  def set_categories
    @categories = Category.alphabetical
  end

  def miniature_params
    params.require(:miniature).permit(:name, :manufacturer, :universe, :scale, :quantity, :painting_status, :notes, :category_id)
  end
end
