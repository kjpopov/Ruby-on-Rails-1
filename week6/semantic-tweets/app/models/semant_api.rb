require 'semantria'

class SemantApi
  def self.new_session
  	session = Semantria::Session.new($consumer_key, $consumer_secret, 'TestApp', true)
  	# Initialize session callback handlers
    callback = SessionCallbackHandler.new()
    session.setCallbackHandler(callback)
    return session
  end

  def self.prepare_doc(session)
    tweets = Tweet.get_tweets
    queued_success = []
    tweets.each do |key|
      # Creates a sample document which need to be processed on Semantria
      # Unique document ID
      # Source text which need to be processed
      doc = {'id' => rand(10 ** 10).to_s.rjust(10, '0'), 'text' => key["text"]}
      # Queues document for processing on Semantria service
      status = session.queueDocument(doc)
      # Check status from Semantria service
      if status == 202
        queued_success << doc
      end
    end
  return queued_success
  end

  def self.get_results(session, length)
    results = []
    while results.length < length
      print 'Please wait 10 sec for documents ...', "\r\n"
      # As Semantria isn't real-time solution you need to wait some time before getting of the processed results
      # In real application here can be implemented two separate jobs, one for queuing of source data another one for retreiving
      # Wait ten seconds while Semantria process queued document
      sleep(10)
      # Requests processed results from Semantria service
      status = session.getProcessedDocuments()
      # Check status from Semantria service
      status.is_a? Array and status.each do |object|
        results.push(object)
      end
      print status.length, ' documents received successfully.', "\r\n"
    end
    File.write('semantria_results_data.json', results.to_json)
    return results
  end

end #end of SemantriaAPI class
