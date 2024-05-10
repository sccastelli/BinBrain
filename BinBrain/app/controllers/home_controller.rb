class HomeController < ApplicationController
  def index
    @producto_escaneados = ProductoEscaneado.all
  end
end
