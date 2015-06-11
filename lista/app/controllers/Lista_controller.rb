class ListasController < ApplicationController
  def index
    @listas = Lista.all
  end

  def show
    @lista = Lista.find(params[:list_name])
  end

<!-- Responsive panel example-->
  def new
    @lista = Lista.new
  end

  def create
    @lista = Lista.new
    @lista.name = params[:list_name]
    @lista.size = params[:size]
    @lista.topic = params[:topic]
    @lista.content = params[:content]

    if @lista.save
      redirect_to "/Lista", :notice => "Lista created successfully."
    else
      render 'new'
    end
  end

  def edit
    @lista = Lista.find(params[:list_name])
  end

  def update
    @lista = Lista.find(params[:list_name])

    @lista.name = params[:list_name]
    @lista.size = params[:size]
    @lista.topic = params[:topic]
    @lista.content = params[:content]

    if @lista.save
      redirect_to "/Listas", :notice => "Lista updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @lista = Lista.find(params[:list_name])

    @lista.destroy

    redirect_to "/Listas", :notice => "Lista deleted."
  end
end
