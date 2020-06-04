module CompareFaces
  extend ActiveSupport::Concern

  def compare_faces(pic1, pic2)
    client = Aws::Rekognition::Client.new
    resp = client.compare_faces(similarity_threshold: 0,
                                 source_image: { s3_object: { bucket: Rails.application.secrets.aws_bucket,
                                                              name: pic1, }, },
                                 target_image: { s3_object: { bucket: Rails.application.secrets.aws_bucket,
                                                              name: pic2, }, },
                               )
    resp
  end

end