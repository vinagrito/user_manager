class RolesController < ApplicationController
  
  
  respond_to :html,:json
  
  protect_from_forgery :except => [:post_data]
  

  def post_data
    message=""
    role_params = { :id => params[:id],:role_name => params[:role_name]}
    case params[:oper]
    when 'add'
      if params["id"] == "_empty"
        role = Role.create(role_params)
        message << ('add ok') if role.errors.empty?
      end
      
    when 'edit'
      role = Role.find(params[:id])
      message << ('update ok') if role.update_attributes(role_params)
    when 'del'
      Role.destroy_all(:id => params[:id].split(","))
      message <<  ('del ok')
    when 'sort'
      roles = Role.all
      roles.each do |role|
        role.position = params['ids'].index(role.id.to_s) + 1 if params['ids'].index(role.id.to_s) 
        role.save
      end
      message << "sort ak"
    else
      message <<  ('unknown action')
    end
    
    unless (role && role.errors).blank?  
      role.errors.entries.each do |error|
        message << "<strong>#{Role.human_attribute_name(error[0])}</strong> : #{error[1]}<br/>"
      end
      render :json =>[false,message]
    else
      render :json => [true,message] 
    end
  end
  
  
  def index
    index_columns ||= [:id,:role_name]
    
    
    current_page = params[:page] ? params[:page].to_i : 1
    rows_per_page = params[:rows] ? params[:rows].to_i : 10

    conditions = {:page => current_page, :per_page => rows_per_page}
    conditions[:order] = params["sidx"] + " " + params["sord"] unless (params[:sidx].blank? || params[:sord].blank?)
    
    if params[:_search] == "true"
      conditions[:conditions] = filter_by_conditions(index_columns)
    end
    
    @roles = Role.paginate(conditions)

    total_entries = @roles.total_entries
    
    respond_with(@roles) do |format|
      format.json { render :json => @roles.to_jqgrid_json(index_columns, current_page, rows_per_page, total_entries)}  
    end
  end
  
end
