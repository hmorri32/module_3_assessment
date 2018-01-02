class Api::V1::BaseController < ActionController::API
  include ExceptionHandler
  include Response
end