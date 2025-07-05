class RiwayatLayananModel {
  String? mppDepartmentName;
  String? mppUsername;
  String? mppServicesName;
  String? mppCounterName;
  String? mppStatusQueue;
  String? mppVerifiedStatus;
  String? mppProcessStatus;
  String? mppFinishStatus;
  String? mppCallingStatus;
  String? idQueue;
  String? createdDate;
  String? updateDate;
  String? createdId;
  String? updateId;
  String? userId;
  String? departmentId;
  String? unitId;
  String? servicesId;
  String? counterId;
  String? numberQueue;
  String? codeQueue;
  String? dateQueue;
  String? timeQueue;
  String? yearQueue;
  String? callingQueue;
  String? callingShow;
  String? callingQueueDate;
  String? statusQueue;
  String? statusId;
  String? statusDate;
  String? status;
  String? statusDescription;
  String? token;
  String? verifiedId;
  String? verifiedDate;
  String? verifiedStatus;
  String? verifiedDescription;
  String? processId;
  String? processDate;
  String? processStatus;
  String? processDescription;
  String? finishId;
  String? finishDate;
  String? finishStatus;
  String? finishCode;
  String? finishType;
  String? finishDescription;
  String? objectId;
  String? sendDate;
  String? sendId;
  String? rescheduleId;
  String? rescheduleDate;
  String? rescheduleStatus;
  String? rescheduleDescription;
  String? statusDownload;
  String? statusReview;
  String? numberQueueOffline;
  String? codeQueueOffline;
  String? callingQueueDateOffline;
  String? familyCode;

  RiwayatLayananModel({
    this.mppDepartmentName,
    this.mppUsername,
    this.mppServicesName,
    this.mppCounterName,
    this.mppStatusQueue,
    this.mppVerifiedStatus,
    this.mppProcessStatus,
    this.mppFinishStatus,
    this.mppCallingStatus,
    this.idQueue,
    this.createdDate,
    this.updateDate,
    this.createdId,
    this.updateId,
    this.userId,
    this.departmentId,
    this.unitId,
    this.servicesId,
    this.counterId,
    this.numberQueue,
    this.codeQueue,
    this.dateQueue,
    this.timeQueue,
    this.yearQueue,
    this.callingQueue,
    this.callingShow,
    this.callingQueueDate,
    this.statusQueue,
    this.statusId,
    this.statusDate,
    this.status,
    this.statusDescription,
    this.token,
    this.verifiedId,
    this.verifiedDate,
    this.verifiedStatus,
    this.verifiedDescription,
    this.processId,
    this.processDate,
    this.processStatus,
    this.processDescription,
    this.finishId,
    this.finishDate,
    this.finishStatus,
    this.finishCode,
    this.finishType,
    this.finishDescription,
    this.objectId,
    this.sendDate,
    this.sendId,
    this.rescheduleId,
    this.rescheduleDate,
    this.rescheduleStatus,
    this.rescheduleDescription,
    this.statusDownload,
    this.statusReview,
    this.numberQueueOffline,
    this.codeQueueOffline,
    this.callingQueueDateOffline,
    this.familyCode,
  });

  factory RiwayatLayananModel.fromJson(Map<String, dynamic> json) {
    return RiwayatLayananModel(
      mppDepartmentName: json["mpp_department_name"],
      mppUsername: json["mpp_username"],
      mppServicesName: json["mpp_services_name"],
      mppCounterName: json["mpp_counter_name"],
      mppStatusQueue: json["mpp_status_queue"],
      mppVerifiedStatus: json["mpp_verified_status"],
      mppProcessStatus: json["mpp_process_status"],
      mppFinishStatus: json["mpp_finish_status"],
      mppCallingStatus: json["mpp_calling_status"],
      idQueue: json["id_queue"],
      createdDate: json["created_date"],
      updateDate: json["update_date"],
      createdId: json["created_id"],
      updateId: json["update_id"],
      userId: json["user_id"],
      departmentId: json["department_id"],
      unitId: json["unit_id"],
      servicesId: json["services_id"],
      counterId: json["counter_id"],
      numberQueue: json["number_queue"],
      codeQueue: json["code_queue"],
      dateQueue: json["date_queue"],
      timeQueue: json["time_queue"],
      yearQueue: json["year_queue"],
      callingQueue: json["calling_queue"],
      callingShow: json["calling_show"],
      callingQueueDate: json["calling_queue_date"],
      statusQueue: json["status_queue"],
      statusId: json["status_id"],
      statusDate: json["status_date"],
      status: json["status"],
      statusDescription: json["status_description"],
      token: json["token"],
      verifiedId: json["verified_id"],
      verifiedDate: json["verified_date"],
      verifiedStatus: json["verified_status"],
      verifiedDescription: json["verified_description"],
      processId: json["process_id"],
      processDate: json["process_date"],
      processStatus: json["process_status"],
      processDescription: json["process_description"],
      finishId: json["finish_id"],
      finishDate: json["finish_date"],
      finishStatus: json["finish_status"],
      finishCode: json["finish_code"],
      finishType: json["finish_type"],
      finishDescription: json["finish_description"],
      objectId: json["object_id"],
      sendDate: json["send_date"],
      sendId: json["send_id"],
      rescheduleId: json["reschedule_id"],
      rescheduleDate: json["reschedule_date"],
      rescheduleStatus: json["reschedule_status"],
      rescheduleDescription: json["reschedule_description"],
      statusDownload: json["status_download"],
      statusReview: json["status_review"],
      numberQueueOffline: json["number_queue_offline"],
      codeQueueOffline: json["code_queue_offline"],
      callingQueueDateOffline: json["calling_queue_date_offline"],
      familyCode: json["family_code"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "update_id": updateId,
      "user_id": userId,
      "department_id": departmentId,
      "unit_id": unitId,
      "services_id": servicesId,
      "counter_id": counterId,
      "number_queue": numberQueue,
      "code_queue": codeQueue,
      "date_queue": dateQueue,
      "time_queue": timeQueue,
      "year_queue": yearQueue,
      "calling_queue": callingQueue,
      "calling_show": callingShow,
      "calling_queue_date": callingQueueDate,
      "status_queue": statusQueue,
      "status_id": statusId,
      "status_date": statusDate,
      "status": status,
      "status_description": statusDescription,
      "token": token,
      "verified_id": verifiedId,
      "verified_date": verifiedDate,
      "verified_status": verifiedStatus,
      "verified_description": verifiedDescription,
      "process_id": processId,
      "process_date": processDate,
      "process_status": processStatus,
      "process_description": processDescription,
      "finish_id": finishId,
      "finish_date": finishDate,
      "finish_status": finishStatus,
      "finish_code": finishCode,
      "finish_type": finishType,
      "finish_description": finishDescription,
      "object_id": objectId,
      "send_date": sendDate,
      "send_id": sendId,
      "reschedule_id": rescheduleId,
      "reschedule_date": rescheduleDate,
      "reschedule_status": rescheduleStatus,
      "reschedule_description": rescheduleDescription,
      "status_download": statusDownload,
      "status_review": statusReview,
      "number_queue_offline": numberQueueOffline,
      "code_queue_offline": codeQueueOffline,
      "calling_queue_date_offline": callingQueueDateOffline,
      "family_code": familyCode,
    };
  }
}
