# frozen_string_literal: true
# Hand-written minimal resource for hashicorp/tls tls_private_key.

require 'pangea/resources/base'
require 'pangea/resources/reference'
require 'pangea/resources/tls_private_key/types'
require 'pangea/resource_registry'

module Pangea::Resources
  module TlsPrivateKey
    include Pangea::Resources::ResourceBuilder

    define_resource :tls_private_key,
      attributes_class: Tls::Types::PrivateKeyAttributes,
      outputs: {
        id: :id,
        public_key_openssh: :public_key_openssh,
        public_key_pem: :public_key_pem,
        private_key_pem: :private_key_pem,
      },
      map: [:algorithm],
      map_present: [:rsa_bits, :ecdsa_curve]
  end
  module Tls
    include TlsPrivateKey
  end
end

Pangea::ResourceRegistry.register_module(Pangea::Resources::Tls)
