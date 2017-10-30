class HomeController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
  end

  def upload
    begin
      @file = params[:order_file]
      order = OrderParser.parse_tab_separated_file @file
      OrderService.persist(order)
    rescue Exception
      flash[:message] = 'Houve um erro ao importar o arquivo'
      redirect_to home_index_path
    end
  end
end
