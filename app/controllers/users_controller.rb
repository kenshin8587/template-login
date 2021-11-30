class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            # puts 'ユーザ登録に成功しました'
            flash[:success] = 'ユーザ登録成功!'
            redirect_to @user
        else
            # puts 'ユーザ登録に失敗しました'
            flash.now[:danger] = 'ユーザ登録失敗!'
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
