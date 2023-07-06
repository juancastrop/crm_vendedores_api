require "test_helper"

class VendedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendedor = vendedors(:one)
  end

  test "should get index" do
    get vendedors_url, as: :json
    assert_response :success
  end

  test "should create vendedor" do
    assert_difference("Vendedor.count") do
      post vendedors_url, params: { vendedor: { email: @vendedor.email, manager: @vendedor.manager, nombre: @vendedor.nombre, number: @vendedor.number, oficina: @vendedor.oficina } }, as: :json
    end

    assert_response :created
  end

  test "should show vendedor" do
    get vendedor_url(@vendedor), as: :json
    assert_response :success
  end

  test "should update vendedor" do
    patch vendedor_url(@vendedor), params: { vendedor: { email: @vendedor.email, manager: @vendedor.manager, nombre: @vendedor.nombre, number: @vendedor.number, oficina: @vendedor.oficina } }, as: :json
    assert_response :success
  end

  test "should destroy vendedor" do
    assert_difference("Vendedor.count", -1) do
      delete vendedor_url(@vendedor), as: :json
    end

    assert_response :no_content
  end
end
