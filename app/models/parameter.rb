class Parameter < ApplicationRecord

	has_many :patient_parameters
   	has_many :parameters, through: :patient_parameters
end


# Parameter.joins("LEFT JOIN patient_parameters ON parameters.name = 'BP' AND patient_parameters.patient_id = p.id")

# User.joins("LEFT JOIN bookmarks ON bookmarks.bookmarkable_type = 'Post' AND bookmarks.user_id = users.id")

# @comments = Comment.joins(:user).select("comments.*, users.first_name") .where(study_id: @study.id)


# "SELECT parameters.name,patient_parameters.time
# FROM parameters
# INNER JOIN patient_parameters
# ON parameters.name='BP' and patient_parameters.patient_id='1' "


# SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
# FROM Orders
# INNER JOIN Customers
# ON Orders.CustomerID=Customers.CustomerID; 