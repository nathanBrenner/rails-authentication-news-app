require 'cgi'
require 'json'
require 'active_support'

def verify_and_decrypt_session_cookie(cookie, secret_key_base)
	cookie = CGI::unescape(cookie)
	salt = 'encrypted cookie'
	signed_salt = 'signed encrypted cookie'
	key_generator = ActiveSupport::KeyGenerator.new(secret_key_base, iterations: 1000)
	secret = key_generator.generate_key(salt)[0, ActiveSupport::MessageEncryptor.key_len]
	signed_secret = key_generator.generate_key(signed_salt)
	encryptor = ActiveSuppot::MessageEncryptor.new(secret, signed_secret, serializer: JSON)

	encryptor.decrypt_and_verify(cookie)
end

cookie = ''
secret = ''

p verify_and_decrypt_session_cookie(cookie, secret)