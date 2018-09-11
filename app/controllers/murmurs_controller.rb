class MurmursController < ApplicationController
  before_action:set_murmur,only:[:edit,:update,:destroy]
  
  def index
    @murmur = Murmur.all.order(created_at: :desc)
  end
  
  def new
    if params[:back]
      @murmur = Murmur.new(murmur_params)
    else
    @murmur = Murmur.new
    end
  end
  
  def create
    @murmur = Murmur.new(murmur_params)
    if @murmur.save
      redirect_to murmurs_path,notice: "ブログを作成しました"
    else
      render 'new'
    end
  end
  
  def destroy
    @murmur.destroy
    redirect_to murmurs_path,notice:"つぶやきを削除しました"
  end
  
  def edit
  end
  
  def update
    if @murmur.update(murmur_params)
      redirect_to murmurs_path,notice:"つぶやきを編集しました"
    else
      render 'edit'
    end
  end
  
  def confirm
    @murmur = Murmur.new(murmur_params)
    render :new if @murmur.invalid?
  end
  
  def top
  end

  private
  
    def murmur_params
      params.require(:murmur).permit(:content)
    end
    
    #parametersからidの値をparamsメソッドで取得
    def set_murmur
      @murmur = Murmur.find(params[:id])
    end
end