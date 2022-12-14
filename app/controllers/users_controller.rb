class UsersController < ApplicationController
def show 
    @user=User.find(params[:id])
    @relation=@user.followers.find_by(follower:current_user)
end
def index
    @user=User.all
end
def edit

end
def myprofile
    @user=current_user
    
end
#FInd the id of the following in the Relationship Table and the dispalying them on timeline
def timeline
    if current_user.following.find_by(follower_id: "#{current_user.id}")
    id_of_follower= current_user.following.find_by(follower_id: "#{current_user.id}").followee_id
    @user=User.find(id_of_follower)
    @blogs=@user.blog
    
end

    end
end
