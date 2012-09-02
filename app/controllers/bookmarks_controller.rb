class BookmarksController < ApplicationController

  # GET /bookmarks/new
  # GET /bookmarks/new.json
  def new
    @bookmark = Bookmark.new
    @user = current_user

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
    @user = current_user
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(params[:bookmark])
    @bookmark.user = current_user

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to current_user, notice: 'Bookmark was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /bookmarks/1
  # PUT /bookmarks/1.json
  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.user = current_user

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to current_user, notice: 'Bookmark was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
    end
  end
end
