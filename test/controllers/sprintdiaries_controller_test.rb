require 'test_helper'

class SprintdiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sprintdiary = sprintdiaries(:one)
  end

  test "should get index" do
    get sprintdiaries_url
    assert_response :success
  end

  test "should get new" do
    get new_sprintdiary_url
    assert_response :success
  end

  test "should create sprintdiary" do
    assert_difference('Sprintdiary.count') do
      post sprintdiaries_url, params: { sprintdiary: { bdiary: @sprintdiary.bdiary, surum_menber_id: @sprintdiary.surum_menber_id } }
    end

    assert_redirected_to sprintdiary_url(Sprintdiary.last)
  end

  test "should show sprintdiary" do
    get sprintdiary_url(@sprintdiary)
    assert_response :success
  end

  test "should get edit" do
    get edit_sprintdiary_url(@sprintdiary)
    assert_response :success
  end

  test "should update sprintdiary" do
    patch sprintdiary_url(@sprintdiary), params: { sprintdiary: { bdiary: @sprintdiary.bdiary, surum_menber_id: @sprintdiary.surum_menber_id } }
    assert_redirected_to sprintdiary_url(@sprintdiary)
  end

  test "should destroy sprintdiary" do
    assert_difference('Sprintdiary.count', -1) do
      delete sprintdiary_url(@sprintdiary)
    end

    assert_redirected_to sprintdiaries_url
  end
end
