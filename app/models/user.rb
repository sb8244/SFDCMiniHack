class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:salesforce]

  def restforce
    if sfdc_oauth_token && sfdc_instance_url && sfdc_refresh_token
      @restforce ||= Restforce.new oauth_token: sfdc_oauth_token,
                                   refresh_token: sfdc_refresh_token,
                                   instance_url: sfdc_instance_url,
                                   client_id: ENV["SALESFORCE_KEY"],
                                   client_secret: ENV["SALESFORCE_SECRET"]
    end
  end
end
