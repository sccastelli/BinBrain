class ApplicationController < ActionController::Base
    def escanear_producto
      tipo = params[:tipo]
      empresa = params[:empresa]
      cantidad = params[:cantidad]
  
      producto_escaneado = ProductoEscaneado.new(tipo: tipo, empresa: empresa, cantidad: cantidad)
      if producto_escaneado.save
        render json: { message: "Producto escaneado correctamente" }, status: :created
      else
        render json: { error: "No se pudo escanear el producto" }, status: :unprocessable_entity
      end
    end
  end
  
