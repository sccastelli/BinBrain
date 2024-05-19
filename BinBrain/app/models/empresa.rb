class Empresa < ApplicationRecord
    has_many :producto_escaneados, dependent: :destroy
end
