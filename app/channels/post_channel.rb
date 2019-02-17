class PostChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'post:message'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    logger.info('in put_message')
    logger.info(data['message'])
    PostChannel.broadcast_to('message', data['message'])
  end
end
