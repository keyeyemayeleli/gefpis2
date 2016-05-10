class MembersController < ApplicationController
  def index
  	@members = Member.all
  	render "members_page/index"
  end

  def new
    @members = Member.new
    render "member_new_profile"
  end

  def show
  	@member = Member.find(params[:id])

	  render "members/show"
  end

  def edit
  end
end
