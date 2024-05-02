class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index
  before_action :correct_record, only: [:edit]

  def index
    @categories = Category.all
    if params[:category_id].present?
      @records = Record.where(category_id: params[:category_id]).includes(:user).order("posted_at DESC")
    else
      @records = Record.all.includes(:user).order("posted_at DESC")
    end
  end

  def new
    @record = Record.new
    @categories = Category.all # カテゴリーのリストを取得しておく
  end

  def create
    @record = Record.new(record_params)
  
    if params[:record][:new_category_name].present?
      category = Category.find_or_create_by(category_name: params[:record][:new_category_name])
      @record.category = category
    end
  
    if @record.save
      redirect_to records_path
    else
      redirect_to new_record_path, alert: "日記の作成に失敗しました."
    end
  end

  def show
  end

  def update
    @record = Record.find(params[:id])
  
    new_category_name = params[:record][:new_category_name]
    if new_category_name.present?
      category = Category.find_or_create_by(category_name: new_category_name)
      @record.category = category
    elsif params[:record][:category_id].present?
      @record.category_id = params[:record][:category_id]
    end
  
    if @record.update(record_params.except(:new_category_name))
      redirect_to record_path(@record)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:record_image, :record_text, :category_id, :new_category_name, :posted_at).merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path, notice: "ログインなしではアクセスできません。"
    end
  end

  def correct_record
    @record = Record.find(params[:id])
    unless @record.user.id == current_user.id
      redirect_to records_path, notice: "アクセスできません。"
    end
  end
end