# frozen_string_literal: true
# Hand-written minimal typescape for hashicorp/tls tls_private_key
# until pangea-forge + terraform-schema-importer regenerate the full set.
# Matches the structural pattern of pangea-aws/<resource>/types.rb.

require 'pangea/resources/base_attributes'

module Pangea::Resources::Tls::Types
  include Dry.Types()

  class PrivateKeyAttributes < Pangea::Resources::BaseAttributes
    T = Pangea::Resources::Tls::Types

    # Required. One of: RSA, ECDSA, ED25519
    attribute :algorithm, T::String

    # Optional. For RSA: bits. For ECDSA: curve name.
    attribute? :rsa_bits, (T::Coercible::Integer | T::Coercible::Float).optional
    attribute? :ecdsa_curve, T::String.optional
  end
end
