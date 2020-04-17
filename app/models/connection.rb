class Connection < ApplicationRecord
    belongs_to :admirer, :optional => true, class_name: "User"
    belongs_to :sweetheart, :optional => true, class_name: "User"

end
