class Worker < ActiveRecord::Base

	validates :first_name, presence: {message: "Por favor ingrese su(s) nombre(s)"}
	validates :last_name, presence: {message: "Por favor ingrese su(s) apellidos(s)"}
	
	validates :cc, presence: {message: "Por favor ingrese su cedula"}
	validates :cc, numericality: {message: "Su cedula solo debe contener numeros"}  
	validates :cc, uniqueness: {message: "Esta cedula ya esta resgistrada"}

end
