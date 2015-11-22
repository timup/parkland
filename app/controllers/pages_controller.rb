class PagesController < HighVoltage::PagesController
  skip_authorization_check

  def home
    @resource = Resource.last
    @collection = Collection.last
  end
end
