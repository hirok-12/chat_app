class RoomChannel < ApplicationCable::Channel
  # 1. Webブラウザ側のコネクションが確立すると、このsubscribedメソッドが呼び出す
  # 2. room_channelとコネクションを確立する
  def subscribed
    stream_from 'room_channel'
  end

  # コネクションが切断されると呼び出されるメソッド
  # 今回はコネクション切断時は何のアクションも行わないのでそのままにする
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # メッセージデータを受信する度に呼び出されるのがreceiveメソッド
  # 想定データ
  # data = {
  #   'message': 'こんにちは！',
  #   'email': 'hiroki@test.com'
  # }
  def receive(data)
    user = User.find_by(email: data['email'])

    # messageレコードを新しく作成し、作成に成功したらメッセージの内容をフロントエンドに送信
    # ActionCable.server.broadcast 'room_channel',....は、このroom_channelチャネルに接続しているWebブラウザ全てにデータを送信するためのメソッド
    if message = Message.create(content: data['message'], user_id: user.id)
      ActionCable.server.broadcast 'room_channel', { message: data['message'], name: user.name, created_at: message.created_at }
    end
  end
end
