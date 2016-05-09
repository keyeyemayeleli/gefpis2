class MembersController < ApplicationController
  def index
    if params[:arm]
      @members = Member.where(:arm => params[:arm])
    else
      @members = Member.all
    end
    render "members/index"
  end

  def new
    @member = Member.new
     render "members/new"
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to member_path(@member.id)
    else
      render "member/new"
    end
  end

  def show
  	@member = Member.find(params[:id])

	  render "members/show"
  end

  def edit
    @member = Member.find(params[:id])
    
    render "members/edit"
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      render "candidates/edit"
    end
  end


  def destroy
    @member = Member.find(params[:id])
    @member.destroy!

    redirect_to :back
  end

  def member_params
    params.require(:member).permit!
  end
end
