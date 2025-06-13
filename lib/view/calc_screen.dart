import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../l10n/app_localizations.dart';
import '../logic/calc_state.dart';
import '../logic/calc_event.dart';
import '../logic/calc_bloc.dart';
import 'history_screen.dart';

class CalculatorScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const CalculatorScreen({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _valueController = TextEditingController();
  final _percentController = TextEditingController();

  @override
  void dispose() {
    _valueController.dispose();
    _percentController.dispose();
    super.dispose();
  }

  void _onCalculate() {
    final value = double.tryParse(_valueController.text);
    final percent = double.tryParse(_percentController.text);

    if (value == null || percent == null || value <= 0 || percent <= 0) {
      context.read<CalculatorBloc>().add(CalculatePressed(-1, -1));
    } else {
      context.read<CalculatorBloc>().add(CalculatePressed(value, percent));
    }
  }

  void _onReset() {
    _valueController.clear();
    _percentController.clear();
    context.read<CalculatorBloc>().add(ResetPressed());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HistoryScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
                labelText: l10n.valueHint,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _percentController,
              decoration: InputDecoration(
                labelText: l10n.percentHint,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _onCalculate,
                  child: Text(l10n.calculate),
                ),
                OutlinedButton(
                  onPressed: _onReset,
                  child: Text(l10n.reset),
                ),
              ],
            ),
            const SizedBox(height: 24),
            BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                if (state is CalculatorSuccess) {
                  return Text('100% = ${state.result.toStringAsFixed(2)}');
                } else if (state is CalculatorError) {
                  return Text(
                    l10n.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
