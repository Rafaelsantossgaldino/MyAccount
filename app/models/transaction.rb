class Transaction < ApplicationRecord
  
  enum kind: { :creditar => 1, :debitar => 2, :transferencia => 3, :remover => 4 }
end
