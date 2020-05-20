# frozen_string_literal: true

class SignedContracts
  def initialize(hash)
    @hash = hash.to_h
  end

  def self.load(json)
    return nil unless json
    new(JSON.parse(json))
  end

  def as_json(_options = {})
    @hash.as_json(_options)
  end

  def self.dump(signed_contracts)
    signed_contracts.to_json
  end

  # delegate :each, to: :@hash
  def each(&b)
    @hash.transform_keys { Contract.find(name: _1) }.each(&b)
  end
  include Enumerable

  def sign(month, contract_name)
    @hash[contract_name] = month
  end

  def diff(another)
    to_a - another.to_a
  end
end
