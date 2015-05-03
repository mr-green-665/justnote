class User < ActiveRecord::Base

	has_one :note

	def self.from_omniauth(auth)
		logger.debug("Params auth debug:")
		logger.debug(auth.inspect)
		where(:uid => auth["uid"], :provider => auth["provider"]).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["nickname"]
		end
	end
end
