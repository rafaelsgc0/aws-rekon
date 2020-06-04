# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class AwsRecon.Profile.ProfilePictureUpload

  constructor: (@userId) ->
    @initUploader()

  initUploader: ->
    $('#profile-picture-upload').change (e) =>
      files = e.target.files
      fileData = new FormData()

      $.each files, (k, v) ->
        fileData.append k, v

      @uploadFile(fileData)

  uploadFile: (fileData) =>
    return if fileData == undefined
    @activateProfileImageSpinner()

    $.ajax
      url: "/team/profile/#{@userId}/profile_pictures"
      type: 'PUT'
      cache: false
      contentType: false
      processData: false
      data: fileData
      .done (data) =>
      $('#js-room-avatar').attr 'src', "#{data['profile_picture']['url']}"
      @deactiveProfileImageSpinner()

  activateProfileImageSpinner: ->
    $('.amm-avatar-loader').show()

  deactiveProfileImageSpinner: ->
    $('.amm-avatar-loader').hide()
