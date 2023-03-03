class OmniauthParser
  attr_reader :data

  def initialize(provider, data)
    @provider = provider
    @data = data
  end

  def credentials
    { provider: provider, uid: uid }
  end

  def email
    data.dig("info", "email")
  end

  private

  def provider
    data["provider"]
  end

  def uid
    data["uid"]
  end
end
