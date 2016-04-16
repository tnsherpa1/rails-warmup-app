class LibraryUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :library

  def index
    @user = User.find(params[:user_id])
    @libraries = @user.libraries

    render :index
  end
end
