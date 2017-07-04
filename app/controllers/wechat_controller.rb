require 'digest/sha1'
class WechatController < ApplicationController
  @@token = "wechat_auth"
  #URL验证
  def auth
    if check_signature?(params[:signature],params[:timestamp],params[:nonce])
      return render text: params[:echostr]
    end
  end

  #接收微信服务器信息  
  def process_request
    # if check_signature?(params[:signature], params[:timestamp], params[:nonce]) #验证消息真实性  
      if params[:xml][:MsgType] == "event"
        if params[:xml][:Event] == "subscribe"
          render "wechat/info", layout: false, :formats => :xml          #关注  
        end
      else
        if params[:xml][:MsgType] == "text"
          render "wechat/info", :formats => :xml  #用户输入消息时，回送欢迎关注  
        end
      end
    # end
  end

  private
  def check_signature?(signature,timestamp,nonce)
    Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature
  end
end
