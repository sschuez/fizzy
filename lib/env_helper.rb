module EnvHelper
  def self.env
    return "submissio" if ENV["IS_SUBMISSIO"] == "true"
    return "private" if ENV["IS_PRIVATE"] == "true"

    Rails.env
  end

  def self.submissio?
    ENV["IS_SUBMISSIO"] == "true"
  end

  def self.private?
    ENV["IS_PRIVATE"] == "true"
  end

  def self.base_host
    hosts = {
      submissio: "https://do.submissio.ch",
      private: "https://do.margareti.com"
    }

    environment = %i[submissio private].find { |env| send(:"#{env}?") }
    hosts[environment]
  end
end
