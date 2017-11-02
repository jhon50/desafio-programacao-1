class HomeController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
  end

  def upload
    begin
      @file = params[:file]
      order = OrderParserService.new(@file).parse_tab_separated
      OrderService.new(order).call
      redirect_with_alert('Arquivo importado com sucesso!')
    rescue Exception
      redirect_with_alert('Houve um erro ao importar o arquivo')
    rescue Exception::NoMethodError
      redirect_with_alert('Houve um erro ao importar o arquivo')
    end
  end

  private

  def redirect_with_alert(message)
    flash[:message] = message
    redirect_to home_index_path
  end
end
