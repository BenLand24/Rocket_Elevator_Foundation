class QuoteController < ApplicationController
  def index
  end

  def new
    @quote = Quote.new #generate data blank to create new form
  end

  def create
    @quote = Quote.new(quote_params)
    #render json: @quote #test when submit button form
    if @quote.save
      flash[:notice] = "add new quete successfull "
      redirect_to :index
    else
      flash[:notice] = "add new quete not successfull "
      redirect_to action:"new"
    end
  end

  def edit
  end
  #for get params when click submit form
  
  private
  def quote_params
    #params.require(name model)
    params.require(:quote).permit(:Full_Name,:Phone_Number,:Company_Name,:Email,:Building_Type,:Nb_Appartement,:Nb_Company,:Nb_Business,:Nb_Floor,:Nb_Basement,:Nb_Parking,:Nb_Cage,:Nb_OccupantPerFloor,:Product_Grade,:Nb_Ele_Suggested,:Price_Per_Ele,:Subtotal,:Install_Fee,:Final_Price)
  end
end