# encoding: utf-8

class OfficesController < ApplicationController
  before_filter :define_request
  
  def index
    @offices = Office.all
  end

  def show
    @office = Office.find_by_slug(params[:id])
  end

  def new
    @office = Office.new
  end

  def edit
    @office = Office.find_by_slug(params[:id])
  end

  def create
    @office = Office.new(params[:office])

    if @office.save
      redirect_to(@office, :notice => "Новый офис был успешно добавлен.")
    else
      render :action => "new"
    end
  end

  def update
    @office = Office.find_by_slug(params[:id])
    
    if @office.update_attributes(params[:office])
      redirect_to(@office, :notice => "Данные офиса были успешно изменены.")
    else
      render :action => "edit"
    end
  end

  def destroy    
    @office = Office.find_by_slug(params[:id])
    
    if @office.destroy
      redirect_to(offices_url)
    end
  end 
end