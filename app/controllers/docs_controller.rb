class DocsController < InheritedResources::Base
  before_filter :authenticate_user!
  def index
    page = params[:page] || 1
    @docs = Doc.paginate(:page => page, :per_page => 20)
  end
end
