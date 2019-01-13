class MessagesController < ApplicationController
  before_action :set_group
  def index
    #@group = Group.find(params[:group_id])before_actionで処理
    @messages = @group.messages.includes(:user)
    @message  = Message.new

  end
  def create
      @message = @group.messages.new(message_params)
        #validationがあるのでsaveしたタイミングで、nilは除外してくれる
      if @message.save
        respond_to do |format|
          format.html { redirect_to group_messages_path( @group ) , notice: "投稿されました" }
          format.json
        end
      else
        @messages = @group.messages.includes( :user )
        flash.now[:alert] = "メッセージを入力してください。"
        # renderは、コントローラのindexに行くのではなくviewに行く。
        render :index
      end
  end
  private
  def message_params
    params.require(:message).permit(:message, :image).merge(user_id: current_user.id)
  end
  def set_group
    @group = Group.find(params[:group_id])
  end

end
