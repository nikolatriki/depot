class SupportRequestsController < ApplicationController
  def index
    @support_requests = SupportRequest.all
  end

  def update
    support_request = SupportRequest.find(params[:id])
    support_request.response = params[:support_request][:response]
    support_request.save
    SupportRequestMailer.respond(support_request).deliver_now
    redirect_to support_requests_path
  end
end
