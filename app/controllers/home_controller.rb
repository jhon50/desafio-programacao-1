class HomeController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
  end

  def upload
    begin
      @file = params[:order_file]
      order = OrderParser.new(@file).parse_tab_separated
      OrderService.new(order).call
      flash[:message] = 'Arquivo importado com sucesso!'
      redirect_to home_index_path
    rescue Exception
      redirect_with_alert
    rescue Exception::NoMethodError
      redirect_with_alert
    end
  end

  private

  def redirect_with_alert
    flash[:message] = 'Houve um erro ao importar o arquivo'
    redirect_to home_index_path
  end
end
