class Admin::DownloadSettingsController < Admin::BaseController

  load_and_authorize_resource

  def edit
    @download_settings = []
    if permitted_modals.include? params[:resource]
      @resource = get_resource(params[:resource])
      @download_settings = get_attrs(params[:resource].singularize.classify.constantize)
    end
  end

  def update
    if params[:downloadable]
      DownloadSetting.where(name_model: params[:resource].singularize.classify).each do |download_setting|
        download_setting.update(downloadable: params[:downloadable].include?(download_setting.name_field))
      end
    end
    redirect_to admin_update_download_settings_path(resource: params[:resource])
  end

  private

  def get_resource(resource)
    resource == 'Legislation::Process' ? 'legislation_processes' : resource
  end

  def get_attrs(model)
    download_settings = []
    get_attr_names(model).each do |attr_name|
      download_settings << DownloadSetting.initialize(model, attr_name)
    end
    download_settings
  end

  def get_attr_names(model)
    model.attribute_names + model.get_association_attribute_names
  end


  def permitted_modals
    ['Legislation::Process', 'debates', 'proposals', 'budgets', 'comments']
  end


end
