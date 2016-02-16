class GroupsController < ApplicationController
	before_action :authenticate_user!  
	
	def index
		 flash[:notice] = "早安！你好！"
		@groups=Group.all
	end 
	def new 
		@group= Group.new
	end
	def create 
		@group= Group.create(group_params)
		if @group.save
			redirect_to groups_path
		else
			render :new
		end
	
	end
	def show
		@group = Group.find(params[:id])
		@posts = @group.posts
	end
	def edit 
		@group = Group.find(params[:id])
	end
	def update 
		@group = Group.find(params[:id])
		if(@group.update(group_params))
			redirect_to groups_path, notice:"修改成功"
		else
			render :edit
		end
	end

	def destory 
		@group = Group.find(params[:id])
		@group.destroy 
		redirect_to groups_path, alert:"討論版已刪除"
	end
	

	private

def group_params
	params.require(:group).permit(:title, :description)
end

end


