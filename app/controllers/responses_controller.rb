class ResponsesController < ApplicationController
	def create
		@micropost=Micropost.find(params[:micropost_id])
		@response=@micropost.responses.build(response_params)
		@response.user=User.find(params[:response][:user_id])
		if @response.save
			flash[:success]="返信しました。"
			redirect_to root_path
		else
			render 'new'
		end
	end
	
	def new
		@micropost=Micropost.find(params[:micropost_id])
		@response=Response.new
	end
	
	def destroy
		@response=Response.find(params[:id])
		@response.destroy
		flash[:success]="ツイートを削除しました。"
		redirect_to root_path
	end
	
	private
		def response_params
			params.require(:response).permit(:response_text,:user_id)
		end
end
