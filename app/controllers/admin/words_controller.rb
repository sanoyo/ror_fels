class Admin::WordsController < ApplicationController
  before_action :require_admin
  before_action :set_word, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:index, :new, :create, :edit]

  def index
    @words = @category.words
  end

  def new
    @word = @category.words.build
    3.times { @word.word_answers.build }
  end

  def show
  end

  def create
    word = @category.words.new(word_params)

    if word.save
      flash[:success] = "Successfully saved word and answers"
      redirect_to admin_category_words_path(word.category, word)
    else
      render 'new'
    end
  end

  def destroy
    if @word.destroy
      flash[:success] = "Deleted word Successfully."
    else
      flash[:danger] = "Unsuccessful deletion."
    end

    redirect_to request.referrer || root_path
  end

  def update
    if @word.update_attributes(word_params)
      flash[:success] = "Successfully updated word and answers"
      redirect_to edit_admin_category_word_path(@word.category, @word)
    else
      render 'admin/words/edit'
    end
  end

  def edit
  end

  private
    def set_word
      @word = Word.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def word_params
      params.require(:word).permit(:content, :category_id, word_answers_attributes: [:id, :content, :is_correct])
    end
end
