class UsersController < ApplicationController
    def index
        @users = User.all.page(params[:page]).per(50)
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
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            flash[:success] = 'ユーザ情報を編集しました'
            redirect_to @user
        else
            flash[:danger] = 'ユーザ情報の編集に失敗しました'
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        flash[:danger] = 'アカウントを削除しました'
        redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
