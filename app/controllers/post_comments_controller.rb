class PostCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment  = current_user.post_comments.new(book_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy(book_params)
    redirect_to book_path(params[:book_id])
  end

  private
  def book_params
  params.permit(:comment)
  end

end
