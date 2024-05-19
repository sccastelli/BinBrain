class HomeController < ApplicationController
  def index
    @empresas = Empresa.includes(:producto_escaneados).all
  end
end

