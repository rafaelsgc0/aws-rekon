require 'test_helper'

class FaceComparesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @face_compare = face_compares(:one)
  end

  test "should get index" do
    get face_compares_url
    assert_response :success
  end

  test "should get new" do
    get new_face_compare_url
    assert_response :success
  end

  test "should create face_compare" do
    assert_difference('FaceCompare.count') do
      post face_compares_url, params: { face_compare: { photo_compare: @face_compare.photo_compare, profile_id: @face_compare.profile_id, result: @face_compare.result } }
    end

    assert_redirected_to face_compare_url(FaceCompare.last)
  end

  test "should show face_compare" do
    get face_compare_url(@face_compare)
    assert_response :success
  end

  test "should get edit" do
    get edit_face_compare_url(@face_compare)
    assert_response :success
  end

  test "should update face_compare" do
    patch face_compare_url(@face_compare), params: { face_compare: { photo_compare: @face_compare.photo_compare, profile_id: @face_compare.profile_id, result: @face_compare.result } }
    assert_redirected_to face_compare_url(@face_compare)
  end

  test "should destroy face_compare" do
    assert_difference('FaceCompare.count', -1) do
      delete face_compare_url(@face_compare)
    end

    assert_redirected_to face_compares_url
  end
end
