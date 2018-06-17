class RoomsController < ApplicationController
  
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end
  
  def new
    @room = current_user.rooms.build
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room, notice:"Your listing has been created successfully!"
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice:"your updated has been made successfully!"
    else
      render :edit
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accomodate, :bed_room, :bathroom, :listing_name, :summary, :address, :has_wifi, :has_closet, :has_shampoo, :has_breakfast, :has_heating, :has_aircon, :has_kitchen, :price, :active)
  end


end
