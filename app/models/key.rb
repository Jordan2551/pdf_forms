class Key < ApplicationRecord
  attr_accessor :ap_account_id
  attr_accessor :ap_key
  attr_encrypted :ap_account_id, key: 'zjpgsNBZQRW-snzsT-1F_w'
  attr_encrypted :ap_key, key: 'b97Mv-8xT7iVKdOiYx_ggAOyb6NCmugp63EVUr4EKFonLr2g7WADrwM0Z3wPD89J'
end
