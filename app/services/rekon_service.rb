require 'aws-sdk'
class RekonService

  attr_accessor :profile, :result, :error

  def initialize(profile, params = {})
    @profile = profile
    @params = params
    @error = {}

  end

  def compare_faces(face_to_compare)
    client = Aws::Rekognition::Client.new
    profile_picture = @profile.picture.path
    face_to_compare = face_to_compare.photo_compare.path
    result ||= {}
    begin
      result = client.compare_faces({
                                      similarity_threshold: 0,
                                      source_image: {
                                          s3_object: {
                                              bucket: "rekon-rafael",
                                              name: profile_picture,
                                          },
                                      },
                                      target_image: {
                                          s3_object: {
                                              bucket: "rekon-rafael",
                                              name: face_to_compare,
                                          },
                                      },
                                  })
    rescue Aws::Rekognition::Errors::ServiceError => error
     result[:error] = error
    end

  end

  def have_face?
    client = Aws::Rekognition::Client.new
    profile_picture = @profile.picture.path
    result ||= {}
    begin
      result = client.search_faces_by_image({ collection_id: 'myphotos',
                                            max_faces: 1,
                                            face_match_threshold: 0,
                                            image: { s3_object: {
                                                bucket: "rekon-rafael",
                                                name: profile_picture,
                                            },}
                                          })
    rescue Aws::Rekognition::Errors::ServiceError => error
      result[:error]  ||= error.message
    end
    result

  end
  #
  # def fetch_connection
  #   Aws.config.update({region:  Rails.application.secrets.aws_region,
  #                      credentials: Aws::Credentials.new(Rails.application.secrets.aws_key,
  #                                                        Rails.application.secrets.aws_secret)
  #                     })
  #
  # end

end