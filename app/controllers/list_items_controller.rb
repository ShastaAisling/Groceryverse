class ListItemsController < ApplicationController
  before_action :get_list
  before_action :set_list_item, only: %i[ show edit update destroy ]

  # GET /list_items or /list_items.json
  def index
    @list_items = @list.list_items
  end

  # GET /list_items/1 or /list_items/1.json
  def show
  end

  # GET /list_items/new
  def new
    @list_item = @list.list_items.build
  end

  # GET /list_items/1/edit
  def edit
  end

  # POST /list_items or /list_items.json
  def create
    @list_item = @list.list_items.build(list_item_params)

    respond_to do |format|
      if @list_item.save
        format.html { redirect_to list_list_items_path(@list), notice: "List item was successfully created." }
        format.json { render :show, status: :created, location: @list_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_items/1 or /list_items/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
        format.html { redirect_to list_list_items_path(@list), notice: "List item was successfully updated." }
        format.json { render :show, status: :ok, location: @list_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1 or /list_items/1.json
  def destroy
    @list_item.destroy

    respond_to do |format|
      format.html { redirect_to list_list_items_path(@list), notice: "List item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = @list.list_items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.require(:list_item).permit(:name, :quantity, :list_id)
    end

  def get_list
    @list = List.find(params[:list_id])
  end
end
