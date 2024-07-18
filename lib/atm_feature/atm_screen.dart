import 'package:bankomat/atm_feature/user_notifier.dart';
import 'package:bankomat/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AtmScreen extends HookConsumerWidget {
  const AtmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userNotifierProvider);
    final amount = useState(0);
    final isButtonEnabled = amount.value > 0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.current.atm, style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Text(S.current.balance, style: Theme.of(context).textTheme.headlineSmall),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
            child: Text("${user.balance}${S.current.currencySuffix}", style: Theme.of(context).textTheme.displayMedium),
          ),
          _AmountTextField(amount),
          const Spacer(),
          TextButton.icon(
            onPressed: isButtonEnabled ? () => _cashOut(ref, context, amount) : null,
            label: Text(S.current.cashOut),
            icon: const Icon(Icons.attach_money),
            style: ButtonStyle(
                fixedSize: const WidgetStatePropertyAll(Size(300, 56)),
                foregroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.disabled)
                    ? Theme.of(context).colorScheme.surfaceDim
                    : Theme.of(context).colorScheme.surface),
                textStyle: WidgetStateTextStyle.resolveWith((states) => Theme.of(context).textTheme.labelLarge!),
                side: WidgetStateBorderSide.resolveWith((states) => BorderSide(
                    color: states.contains(WidgetState.disabled)
                        ? Theme.of(context).colorScheme.outlineVariant
                        : Theme.of(context).colorScheme.outline)),
                backgroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.disabled)
                    ? Theme.of(context).colorScheme.onInverseSurface
                    : Theme.of(context).colorScheme.onSurface)),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _cashOut(WidgetRef ref, BuildContext context, ValueNotifier<int> amount) {
    ref.read(userNotifierProvider.notifier).cashOut(
        amount.value,
        (title, description) => showDialog(
            context: context,
            builder: (context) => _Dialog(
                  isError: true,
                  title: title,
                  description: description,
                )), (banknotesCount) {
      showDialog(
          context: context,
          builder: (context) => _Dialog(
              isError: false,
              title: S.current.cashOutSuccessfulDialogTitle,
              description: S.current.cashOutSuccessfulDialogDesc(amount.value),
              banknotesCount: banknotesCount)).then((value) => amount.value = 0);
    });
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog({required this.isError, required this.title, required this.description, this.banknotesCount})
      : assert((!isError && banknotesCount != null) || isError,
            "If there was no error, banknotesCount argument must be present");

  final bool isError;
  final String title;
  final String description;
  final Map<int, int>? banknotesCount;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(description, style: Theme.of(context).textTheme.bodyMedium),
          ),
          if (!isError && banknotesCount != null)
            ...banknotesCount!.entries
                .where((banknote) => banknote.value != 0)
                .map((banknote) => Text("${banknote.value}x ${banknote.key}${S.current.currencySuffix}")),
          Container(
              margin: const EdgeInsets.only(top: 16),
              alignment: Alignment.bottomCenter,
              child: TextButton(onPressed: () => Navigator.pop(context), child: Text(S.current.ok)))
        ],
      ),
    );
  }
}

class _AmountTextField extends HookWidget {
  const _AmountTextField(this.amount);

  final ValueNotifier<int> amount;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    useEffect(() {
      listener() => controller.text = amount.value == 0 ? "" : amount.value.toString();
      amount.addListener(listener);
      return () => amount.removeListener(listener);
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => amount.value = value.isNotEmpty ? int.parse(value) : 0,
        keyboardType: TextInputType.number,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: S.current.textfieldHint,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
