#coding: utf-8

class RequestsController < ApplicationController
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end
  
  def mini
    @request = Request.new(:is_mini => true)
    
    render :layout => false
  end
  
  def accept
  	@request = Request.find(params[:id]) if params[:id]
		if @request.update_attribute("is_accepted", true)
			flash[:notice] = "Заявка была отмечена как одобренная."			
		end
  end

  def show
    @request = Request.find_by_token(params[:id])
    
    # # Black List look up
    # @black_list_search = Debtor.search( @request.personal_last_name  + 
    #                                     " " + 
    #                                     @request.personal_first_name + 
    #                                     " " + 
    #                                     @request.personal_surname ).first
                                        
    # if @black_list_search.present?
    #   @is_in_black_list = true
    # else
    #   @is_in_black_list = false
    # end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  def new
    @request = Request.new
  end

  def edit
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new(params[:request])    

    respond_to do |format|
      if @request.save
        UserMailer.loan_request_to_office(@request).deliver
        UserMailer.loan_request_to_director(@request).deliver
        
        format.html { redirect_to(account_user_path(current_user)) }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to(@request, :notice => 'Request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @request = Request.find_by_token(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(account_user_path(current_user)) }
      format.xml  { head :ok }
    end
  end
end
