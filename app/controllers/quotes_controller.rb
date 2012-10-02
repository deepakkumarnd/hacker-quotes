class QuotesController < ApplicationController

  before_filter :authenticate_user!, except: [:index,:show,:random]

  def index
    @quotes = Quote.paginate(page: params[:page], per_page: 10, order: 'created_at DESC')
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params[:quote])
    @quote.creator = current_user
    if @quote.save
      redirect_to @quote, notice: "Quote successfully created!"
    else 
      render 'new'
    end
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(params[:quote])
      redirect_to @quote, notice: "Updated successfully" 
    else 
      render 'edit'
    end  
  end

  def destroy
    @quote = Quote.find params[:id]
    @quote.destroy
    redirect_to root_path
  end

  def random
    redirect_to Quote.random
  end
end