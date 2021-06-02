

class Records {
    Records({
        this.total,
        this.records,
    });

    int total;
    List<Record> records;

    factory Records.fromJson(Map<String, dynamic> json) => Records(
        total: json["total"],
        records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
    };
}

class Record {
    Record({
        this.status,
        this.id,
        this.idUser,
        this.firstname,
        this.secondname,
        this.firstlastname,
        this.secondlastname,
        this.documentType,
        this.document,
        this.eventType,
        this.date,
    });

    bool status;
    String id;
    String idUser;
    String firstname;
    String secondname;
    String firstlastname;
    String secondlastname;
    String documentType;
    String document;
    String eventType;
    String date;

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        status: json["status"],
        id: json["_id"],
        idUser: json["id_user"],
        firstname: json["firstname"],
        secondname: json["secondname"],
        firstlastname: json["firstlastname"],
        secondlastname: json["secondlastname"]==null?' ':json["secondlastname"],
        documentType: json["documentType"],
        document: json["document"],
        eventType: json["eventType"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "id_user": idUser,
        "firstname": firstname,
        "secondname": secondname,
        "firstlastname": firstlastname,
        "documentType": documentType,
        "document": document,
        "eventType": eventType,
        "date": date,
    };
}
