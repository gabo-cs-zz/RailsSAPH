class Api::V1::HeadquartersController < ApiController

  before_action :set_hq, only: %i[show update destroy]

  def index
    @hq = Headquarter.all
    render json: { message: 'success', hqs: @hq }, status: :ok
  end

  def create
    @hq = Headquarter.new(hq_params)
    if @hq.save
      render json: { message: 'Inserted, two-timed', data: @hq }, status: :ok
    else
      render json: { message: 'Headquarter not inserted', data: @hq.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: {data: @hq}, status: :ok
  end

  def update
    if @hq.update(hq_params)
      render json: {data: @hq}, status: :ok
    else
      render json: { message: 'Headquarter not updated', data: @hq.errors }, status: :unprocessable_entity
    end
  end

  # soft delete pending
  def destroy
    if @hq.destroy
      render json: {data: @hq}, status: :ok
    else
      render json: { message: 'Headquarter not deleted', data: @hq.errors }, status: :unprocessable_entity
    end
  end

  private
  def hq_params
    params.require(:headquarter).permit!
  end

  def set_hq
    @hq = Headquarter.find(params[:id])
  end

end
