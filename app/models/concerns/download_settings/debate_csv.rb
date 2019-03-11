module DownloadSettings
  module DebateCsv
    extend ActiveSupport::Concern

    def get_association_attribute_names
      ['author_name', 'author_email']
    end

    def get_downloadables_names
      names = DownloadSetting.where(name_model: 'Debate', downloadable: true).pluck(:name_field)
      names
    end

    def to_csv(debates, options = {})
      attributes = get_downloadables_names

      CSV.generate(options) do |csv|
        csv << attributes
        debates.each do |debate|
          csv << attributes.map{ |attr| debate.send(attr)}
        end
      end
    end

  end
end
