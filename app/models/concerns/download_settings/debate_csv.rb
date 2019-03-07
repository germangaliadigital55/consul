module DownloadSettings
  module DebateCsv
    extend ActiveSupport::Concern

    def get_association_attribute_names
      ['author_name', 'author_email']
    end

  end
end
