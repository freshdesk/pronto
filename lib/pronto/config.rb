module Pronto
  class Config
    def initialize(config_hash = ConfigFile.new.to_h)
      @config_hash = config_hash
    end

    def excluded_files
      @excluded_files ||= exclude.flat_map { |path| Dir[path] }
    end

    def github_access_token
      ENV['GITHUB_ACCESS_TOKEN'] || @config_file['github']['access_token']
    end

    def github_slug
      @config_file['github']['slug']
    end

    def gitlab_private_token
      ENV['GITLAB_API_PRIVATE_TOKEN'] || @config_file['gitlab']['private_token']
    end

    def gitlab_endpoint
      ENV['GITLAB_API_ENDPOINT'] || @config_file['gitlab']['endpoint']
    end

    private

    def exclude
      @config_file['all']['exclude']
    end
  end
end
