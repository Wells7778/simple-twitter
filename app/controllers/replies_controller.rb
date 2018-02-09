class RepliesController < ApplicationController

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @replies = @tweet.replies.all
    @reply = Reply.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.build(comment: reply_params[:comment], user: current_user)
    respond_to do |format|
      @reply.save
      @replies = @tweet.replies.all
      format.html { redirect_to tweet_replies_path(@tweet), notice: "reply success" }
      format.js
    end

  end

  private
  def reply_params
    params.require(:reply).permit(:comment)
  end
end
