import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/localizations.dart';

class SfLocalizationsNe extends SfLocalizations {
  @override
  // TODO: implement allDayLabel
  String get allDayLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewDayLabel
  String get allowedViewDayLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewMonthLabel
  String get allowedViewMonthLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewScheduleLabel
  String get allowedViewScheduleLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewTimelineDayLabel
  String get allowedViewTimelineDayLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewTimelineMonthLabel
  String get allowedViewTimelineMonthLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewTimelineWeekLabel
  String get allowedViewTimelineWeekLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewTimelineWorkWeekLabel
  String get allowedViewTimelineWorkWeekLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewWeekLabel
  String get allowedViewWeekLabel => throw UnimplementedError();

  @override
  // TODO: implement allowedViewWorkWeekLabel
  String get allowedViewWorkWeekLabel => throw UnimplementedError();

  @override
  // TODO: implement daySpanCountLabel
  String get daySpanCountLabel => throw UnimplementedError();

  @override
  // TODO: implement dhualhiLabel
  String get dhualhiLabel => 'Dec';

  @override
  // TODO: implement dhualqiLabel
  String get dhualqiLabel => 'Nov';

  @override
  // TODO: implement jumada1Label
  String get jumada1Label => 'Mei';

  @override
  // TODO: implement jumada2Label
  String get jumada2Label => 'Juni';

  @override
  // TODO: implement muharramLabel
  String get muharramLabel => "Jan";

  @override
  // TODO: implement noEventsCalendarLabel
  String get noEventsCalendarLabel => 'Geen Evenementen';

  @override
  // TODO: implement noSelectedDateCalendarLabel
  String get noSelectedDateCalendarLabel => 'geen geselecteerde datum';

  @override
  // TODO: implement ofDataPagerLabel
  String get ofDataPagerLabel => throw UnimplementedError();

  @override
  // TODO: implement pagesDataPagerLabel
  String get pagesDataPagerLabel => throw UnimplementedError();

  @override
  // TODO: implement passwordDialogContentLabel
  String get passwordDialogContentLabel => throw UnimplementedError();

  @override
  // TODO: implement passwordDialogHeaderTextLabel
  String get passwordDialogHeaderTextLabel => throw UnimplementedError();

  @override
  // TODO: implement passwordDialogHintTextLabel
  String get passwordDialogHintTextLabel => throw UnimplementedError();

  @override
  // TODO: implement passwordDialogInvalidPasswordLabel
  String get passwordDialogInvalidPasswordLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfBookmarksLabel
  String get pdfBookmarksLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfEnterPageNumberLabel
  String get pdfEnterPageNumberLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfGoToPageLabel
  String get pdfGoToPageLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfInvalidPageNumberLabel
  String get pdfInvalidPageNumberLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfNoBookmarksLabel
  String get pdfNoBookmarksLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfPaginationDialogCancelLabel
  String get pdfPaginationDialogCancelLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfPaginationDialogOkLabel
  String get pdfPaginationDialogOkLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfPasswordDialogCancelLabel
  String get pdfPasswordDialogCancelLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfPasswordDialogOpenLabel
  String get pdfPasswordDialogOpenLabel => throw UnimplementedError();

  @override
  // TODO: implement pdfScrollStatusOfLabel
  String get pdfScrollStatusOfLabel => throw UnimplementedError();

  @override
  // TODO: implement rabi1Label
  String get rabi1Label => "Mrt";

  @override
  // TODO: implement rabi2Label
  String get rabi2Label => 'Apr';

  @override
  // TODO: implement rajabLabel
  String get rajabLabel => 'Jul';

  @override
  // TODO: implement ramadanLabel
  String get ramadanLabel => 'Sept';

  @override
  // TODO: implement rowsPerPageDataPagerLabel
  String get rowsPerPageDataPagerLabel => throw UnimplementedError();

  @override
  // TODO: implement safarLabel
  String get safarLabel => 'Feb';

  @override
  // TODO: implement series
  String get series => throw UnimplementedError();

  @override
  // TODO: implement shaabanLabel
  String get shaabanLabel => 'Aug';

  @override
  // TODO: implement shawwalLabel
  String get shawwalLabel => 'Oct';

  @override
  // TODO: implement shortDhualhiLabel
  String get shortDhualhiLabel => 'Dec';

  @override
  // TODO: implement shortDhualqiLabel
  String get shortDhualqiLabel => throw UnimplementedError();

  @override
  // TODO: implement shortJumada1Label
  String get shortJumada1Label => throw UnimplementedError();

  @override
  // TODO: implement shortJumada2Label
  String get shortJumada2Label => throw UnimplementedError();

  @override
  // TODO: implement shortMuharramLabel
  String get shortMuharramLabel => throw UnimplementedError();

  @override
  // TODO: implement shortRabi1Label
  String get shortRabi1Label => throw UnimplementedError();

  @override
  // TODO: implement shortRabi2Label
  String get shortRabi2Label => throw UnimplementedError();

  @override
  // TODO: implement shortRajabLabel
  String get shortRajabLabel => throw UnimplementedError();

  @override
  // TODO: implement shortRamadanLabel
  String get shortRamadanLabel => throw UnimplementedError();

  @override
  // TODO: implement shortSafarLabel
  String get shortSafarLabel => throw UnimplementedError();

  @override
  // TODO: implement shortShaabanLabel
  String get shortShaabanLabel => throw UnimplementedError();

  @override
  // TODO: implement shortShawwalLabel
  String get shortShawwalLabel => throw UnimplementedError();

  @override
  // TODO: implement todayLabel
  String get todayLabel => throw UnimplementedError();

  @override
  // TODO: implement weeknumberLabel
  String get weeknumberLabel => throw UnimplementedError();
}

class SfLocalizationsNeDelegate extends LocalizationsDelegate<SfLocalizations> {
  const SfLocalizationsNeDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ne';

  @override
  Future<SfLocalizations> load(Locale locale) {
    return SynchronousFuture<SfLocalizations>(SfLocalizationsNe());
  }

  @override
  bool shouldReload(LocalizationsDelegate<SfLocalizations> old) => false;
}
