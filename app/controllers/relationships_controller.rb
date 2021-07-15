class RelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:user_id])
    @rel = Relationship.new(follover_id: current_user.id,
                            followed_id: other_user.id)
    @rel.save!
    redirect_to user_path(other_user)
  end
end

def destroy
  @user = User.find(params[:id])
  @rel = Relationship.find_by(follover_id: @user.id, followed_id: current_user.id).id
  Relationship.destroy(@rel)
  redirect_to user_path(@user)
end




# def destroy
#   @rel = Relationship.find(params[:id])
#   @rel.destroy
#   redirect_to user_path(@rel.followed.id)
# end
