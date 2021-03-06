
require 'net/ldap' # gem install net-Ldap

class LdapController < ApplicationController
  def connect
  	ldap = Net::LDAP.new(
  			host: '192.168.99.100',
  			port: 389,
  			auth: {
  				method: :simple,
  				dn: "cn=admin,dc=arqsoft,dc=unal,dc=edu,dc=co",
  				password: "admin"
  			}
  		)
  		return ldap.bind
  end

  def create
    email = params[:email]
    password = params[:password]
    email = email[/\A\w+/].downcase
    if connect()
      ldap = Net::LDAP.new(
          host: '192.168.99.100',
          port: 389,
          auth: {
            method: :simple,
            dn: 'cn=' + email +'@unal.edu.co,ou=electrodomesticos,dc=arqsoft,dc=unal,dc=edu,dc=co',
            password: password
          }
      )
      if ldap.bind
        render json: { userValid: true }
      else
        render json: { userValid: false }
      end
    end
  end

end
