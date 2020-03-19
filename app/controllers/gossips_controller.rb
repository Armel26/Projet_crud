class GossipsController < ApplicationController
	def new
		@gossip = Gossip.new
		@user_number = User.all.count
	end
	def create
		permitted = permmit
		Gossip.create(permitted)
		redirecte_to(new_gossip_path)
	end

	def index
		@gossips = Gossip.all

	end

	def show
		@gossip = find
	end
	def edit
		@gossip = find
		@user_number = User.all.count
	end
	def update
		@gossip = find
		permitted = permmit
		@gossip.update(permitted)
		redirect_to(new_gossip_path(params[:id]))
	end
	def destroy
		@gossip = find
		@gossip.delete
		redirect_to(gossips_path)
	end
	def permmit
		params.require(:gossip).permit(:title, :content, :user_id)
	end
	def find
		Gossip.find(params[:id])
	end
end
