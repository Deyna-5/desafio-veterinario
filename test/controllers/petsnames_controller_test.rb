require 'test_helper'

class PetsnamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @petsname = petsnames(:one)
  end

  test "should get index" do
    get petsnames_url
    assert_response :success
  end

  test "should get new" do
    get new_petsname_url
    assert_response :success
  end

  test "should create petsname" do
    assert_difference('Petsname.count') do
      post petsnames_url, params: { petsname: { birthday: @petsname.birthday, race: @petsname.race } }
    end

    assert_redirected_to petsname_url(Petsname.last)
  end

  test "should show petsname" do
    get petsname_url(@petsname)
    assert_response :success
  end

  test "should get edit" do
    get edit_petsname_url(@petsname)
    assert_response :success
  end

  test "should update petsname" do
    patch petsname_url(@petsname), params: { petsname: { birthday: @petsname.birthday, race: @petsname.race } }
    assert_redirected_to petsname_url(@petsname)
  end

  test "should destroy petsname" do
    assert_difference('Petsname.count', -1) do
      delete petsname_url(@petsname)
    end

    assert_redirected_to petsnames_url
  end
end
