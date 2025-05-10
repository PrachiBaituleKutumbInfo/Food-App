import 'package:equatable/equatable.dart';

class OtpResponseEntity extends Equatable {
  final String responseStatus;
  final String responseCode;
  final String responseMessage;
  final List<String> responseData;

  const OtpResponseEntity({
    required this.responseStatus,
    required this.responseCode,
    required this.responseMessage,
    required this.responseData,
  });

  @override
  List<Object?> get props => [
        responseStatus,
        responseCode,
        responseMessage,
        responseData,
      ];

  //below for testing purpose only if required

  // OtpResponseEntity.empty()
  //     : this(
  //         responseStatus: '',
  //         responseCode: '',
  //         responseMessage: '',
  //         responseData: ['123456'],
  //       );
}
