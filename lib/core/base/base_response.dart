abstract class BaseResponse {
  void successCreate(String message);
  void badRequest(String message);
  void unauthorized(String message);
  void forbidden(String message);
  void notFound(String message);
  void methodNotAllowed(String message);
  void requestTimeOut(String message);
  void toManyRequest(String message);
  void internalServerError(String message);
  void badGateway(String message);
  void servicesUnavailable(String message);
  void gatewayTimeOut(String message);
  void noInternet(String message);
}
