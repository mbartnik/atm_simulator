// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bankomat/app.dart';
import 'package:bankomat/atm_feature/user_notifier.dart';
import 'package:bankomat/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('try to withdraw money with an empty TextField', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    final element = tester.element(find.byType(MyApp));
    final container = ProviderScope.containerOf(element);
    final startingBalance = container.read(userNotifierProvider).balance;
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == "")),
        findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextButton && widget.onPressed == null), findsOneWidget);

    await tester.tap(find.text(S.current.cashOut));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
  });

  testWidgets('try to withdraw money lower than user balance', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    final element = tester.element(find.byType(MyApp));
    final container = ProviderScope.containerOf(element);
    final startingBalance = container.read(userNotifierProvider).balance;
    const amount = 580;
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == "")),
        findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextButton && widget.onPressed == null), findsOneWidget);
    await tester.enterText(find.byType(TextField), amount.toString());
    await tester.pumpAndSettle();
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == amount.toString())),
        findsOneWidget);
    await tester.tap(find.text(S.current.cashOut));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text(S.current.cashOutSuccessfulDialogTitle), findsOneWidget);
    expect(find.text(S.current.cashOutSuccessfulDialogDesc(amount)), findsOneWidget);
    expect(find.text("2x 200${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("1x 100${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("1x 50${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("1x 20${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("1x 10${S.current.currencySuffix}"), findsOneWidget);
    await tester.tap(find.text(S.current.ok));
    expect(find.text('${startingBalance - amount}${S.current.currencySuffix}'), findsOneWidget);
  });

  testWidgets('try to withdraw money higher than user balance', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    final element = tester.element(find.byType(MyApp));
    final container = ProviderScope.containerOf(element);
    final startingBalance = container.read(userNotifierProvider).balance;
    const amount = 3000;
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == "")),
        findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextButton && widget.onPressed == null), findsOneWidget);
    await tester.enterText(find.byType(TextField), amount.toString());
    await tester.pumpAndSettle();
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == amount.toString())),
        findsOneWidget);
    await tester.tap(find.text(S.current.cashOut));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text(S.current.insufficientFundsDialogTitle), findsOneWidget);
    expect(find.text(S.current.insufficientFundsDialogDesc), findsOneWidget);
    await tester.tap(find.text(S.current.ok));
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
  });

  testWidgets('try to withdraw amount of money not possible to be withdrawn, i.e. not divisible by 10', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    final element = tester.element(find.byType(MyApp));
    final container = ProviderScope.containerOf(element);
    final startingBalance = container.read(userNotifierProvider).balance;
    const amount = 123;
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == "")),
        findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextButton && widget.onPressed == null), findsOneWidget);
    await tester.enterText(find.byType(TextField), amount.toString());
    await tester.pumpAndSettle();
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == amount.toString())),
        findsOneWidget);
    await tester.tap(find.text(S.current.cashOut));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text(S.current.invalidNumberEnteredDialogTitle), findsOneWidget);
    expect(find.text(S.current.invalidNumberEnteredDialogDesc), findsOneWidget);
    await tester.tap(find.text(S.current.ok));
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
  });

  testWidgets('try to withdraw more money than available at ATM', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    final element = tester.element(find.byType(MyApp));
    final container = ProviderScope.containerOf(element);
    final startingBalance = container.read(userNotifierProvider).balance;
    const amount = 5000;
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == "")),
        findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextButton && widget.onPressed == null), findsOneWidget);
    await tester.enterText(find.byType(TextField), amount.toString());
    await tester.pumpAndSettle();
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == amount.toString())),
        findsOneWidget);
    await tester.tap(find.text(S.current.cashOut));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text(S.current.insufficientAtmFundsDialogTitle), findsOneWidget);
    expect(find.text(S.current.insufficientAtmFundsDialogDesc), findsOneWidget);
    await tester.tap(find.text(S.current.ok));
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
  });

  testWidgets('try to withdraw some money then more to confirm that banknotes at the ATM get depleted', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    final element = tester.element(find.byType(MyApp));
    final container = ProviderScope.containerOf(element);
    final startingBalance = container.read(userNotifierProvider).balance;
    const amount = 1900;
    expect(find.text('$startingBalance${S.current.currencySuffix}'), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == "")),
        findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextButton && widget.onPressed == null), findsOneWidget);
    await tester.enterText(find.byType(TextField), amount.toString());
    await tester.pumpAndSettle();
    expect(
        find.byWidgetPredicate(
            (widget) => widget is TextField && (widget.controller != null && widget.controller!.text == amount.toString())),
        findsOneWidget);
    await tester.tap(find.text(S.current.cashOut));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text(S.current.cashOutSuccessfulDialogTitle), findsOneWidget);
    expect(find.text(S.current.cashOutSuccessfulDialogDesc(amount)), findsOneWidget);
    expect(find.text("9x 200${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("1x 100${S.current.currencySuffix}"), findsOneWidget);
    await tester.tap(find.text(S.current.ok));
    expect(find.text('${startingBalance - amount}${S.current.currencySuffix}'), findsOneWidget);
    await tester.enterText(find.byType(TextField), amount.toString());
    await tester.pumpAndSettle();
    await tester.tap(find.text(S.current.cashOut));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text(S.current.cashOutSuccessfulDialogTitle), findsOneWidget);
    expect(find.text(S.current.cashOutSuccessfulDialogDesc(amount)), findsOneWidget);
    expect(find.text("1x 200${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("9x 100${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("10x 50${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("10x 20${S.current.currencySuffix}"), findsOneWidget);
    expect(find.text("10x 10${S.current.currencySuffix}"), findsOneWidget);
    await tester.tap(find.text(S.current.ok));
    await tester.enterText(find.byType(TextField), "10");
    await tester.pumpAndSettle();
    await tester.tap(find.text(S.current.cashOut));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text(S.current.insufficientAtmFundsDialogTitle), findsOneWidget);
    expect(find.text(S.current.insufficientAtmFundsDialogDesc), findsOneWidget);
    await tester.tap(find.text(S.current.ok));
  });
}
