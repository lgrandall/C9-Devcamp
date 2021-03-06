class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular 
  end

  def ruby_on_rails
    @rails_portfolio_items = Portfolio.ruby_on_rails  
  end

	def new
	@portfolio_item = Portfolio.new
  3.times {@portfolio_item.technologies.build}
	end

	def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if  @portfolio_item.save
        format.html { redirect_to  portfolios_path, notice: 'Your portfolio item is now live.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @@portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@portfolio_item = Portfolio.find(params[:id])
  end

    def update
    		@portfolio_item = Portfolio.find(params[:id])
    		
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[ :id])
  end

  def destroy
    #Performs look up
    @portfolio_item = Portfolio.find(params[ :id])

    #destroys the record
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully deleted.' }
    end
  end

  def missing
  end

  def something
    @something = params[:something]
  end

end