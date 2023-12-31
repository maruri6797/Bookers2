class GroupUsersController < ApplicationController
  def create
    current_user.group_users.create(group_id: params[:group_id])
    redirect_to request.referer
  end
  
  def destroy
    group_user = current_user.group_users.find_by(group_id: params[:group_id])
    group_user.destroy
    redirect_to request.referer
  end
end
