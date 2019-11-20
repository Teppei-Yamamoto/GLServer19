require 'test_helper'

class SprintDiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sprint_diary = sprint_diaries(:one)
  end

  test "should get index" do
    get sprint_diaries_url
    assert_response :success
  end

  test "should get new" do
    get new_sprint_diary_url
    assert_response :success
  end

  test "should create sprint_diary" do
    assert_difference('SprintDiary.count') do
      post sprint_diaries_url, params: { sprint_diary: { bdiary: @sprint_diary.bdiary, scrum_member_id: @sprint_diary.scrum_member_id } }
    end

    assert_redirected_to sprint_diary_url(SprintDiary.last)
  end

  test "should show sprint_diary" do
    get sprint_diary_url(@sprint_diary)
    assert_response :success
  end

  test "should get edit" do
    get edit_sprint_diary_url(@sprint_diary)
    assert_response :success
  end

  test "should update sprint_diary" do
    patch sprint_diary_url(@sprint_diary), params: { sprint_diary: { bdiary: @sprint_diary.bdiary, scrum_member_id: @sprint_diary.scrum_member_id } }
    assert_redirected_to sprint_diary_url(@sprint_diary)
  end

  test "should destroy sprint_diary" do
    assert_difference('SprintDiary.count', -1) do
      delete sprint_diary_url(@sprint_diary)
    end

    assert_redirected_to sprint_diaries_url
  end
end
