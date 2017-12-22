class BrightIdeasController < ApplicationController
    def index
        @bright_ideas = BrightIdea.all
        # p "this ideas likes", @bright_ideas[0].likes_count
        @ordered_ideas = @bright_ideas.order(:likes_count).reverse
        p "these are all the bright_ideas", @bright_ideas
        @user = current_user
        render 'index'
      end
    def show 
        @bright_idea = BrightIdea.find(params[:id])
        p @bright_idea
        users = @bright_idea.users
        p users
        p "users", @bright_idea.users
        render 'show'
        end

    def create
        @bright_idea = BrightIdea.new(bright_idea_params)
        if @bright_idea.valid?
            p @bright_idea
            @bright_idea.save
            redirect_to :back
        else
            p "messed up"
            flash[:errors] = @bright_idea.errors.full_messages
            redirect_to :back
        end
    end
        def destroy
            @bright_idea = BrightIdea.find(params[:id])
                p "idea's user", @bright_idea.user.id
                if @bright_idea.user.id == current_user.id
                    @bright_idea.destroy
                    redirect_to bright_ideas_path
                    # resets the session id
                else
                    flash[:errors] = ["Can't delete someone else's idea"]
                    redirect_to :back
                end
        end
        private
        def bright_idea_params
            params.require(:bright_idea).permit(:content).merge(user_id: session[:user_id])
        # merge adds the key user_id into the params hash
        end
end
