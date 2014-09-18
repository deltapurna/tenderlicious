class CompaniesController < ApplicationController
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to root_path, status: :created
    else
      render :new
    end
  end

  private
    def company_params
      params.require(:company).
        permit(:name, :registration_number, 
               users_attributes: [:email, :password, :password_confirmation])
    end
end
