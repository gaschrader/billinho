require "test_helper"

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment = enrollments(:one)
  end

  test "should get index" do
    get enrollments_url, as: :json
    assert_response :success
  end

  test "should create enrollment" do
    assert_difference("Enrollment.count") do
      post enrollments_url, params: { enrollment: { Institution_id: @enrollment.Institution_id, Student_id: @enrollment.Student_id, bill_due_date: @enrollment.bill_due_date, course_name: @enrollment.course_name, number_of_bills: @enrollment.number_of_bills, total_cost: @enrollment.total_cost } }, as: :json
    end

    assert_response :created
  end

  test "should show enrollment" do
    get enrollment_url(@enrollment), as: :json
    assert_response :success
  end

  test "should update enrollment" do
    patch enrollment_url(@enrollment), params: { enrollment: { Institution_id: @enrollment.Institution_id, Student_id: @enrollment.Student_id, bill_due_date: @enrollment.bill_due_date, course_name: @enrollment.course_name, number_of_bills: @enrollment.number_of_bills, total_cost: @enrollment.total_cost } }, as: :json
    assert_response :success
  end

  test "should destroy enrollment" do
    assert_difference("Enrollment.count", -1) do
      delete enrollment_url(@enrollment), as: :json
    end

    assert_response :no_content
  end
end
