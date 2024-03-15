import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<List<String>> _board;
  late String _currentPlayer;
  String? _winner;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    _board = List.generate(3, (_) => List.filled(3, ''));
    _currentPlayer = 'X';
    _winner = null;
  }

  void _resetBoard() {
    setState(() {
      _initializeBoard();
    });
  }

  void _markCell(int row, int col) {
    if (_board[row][col] == '' && _winner == null) {
      setState(() {
        _board[row][col] = _currentPlayer;
        _checkWinner();
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      });
    }
  }

  void _checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] != '' &&
          _board[i][0] == _board[i][1] &&
          _board[i][1] == _board[i][2]) {
        _winner = _board[i][0];
        break;
      }
      if (_board[0][i] != '' &&
          _board[0][i] == _board[1][i] &&
          _board[1][i] == _board[2][i]) {
        _winner = _board[0][i];
        break;
      }
    }
    if (_board[0][0] != '' &&
        _board[0][0] == _board[1][1] &&
        _board[1][1] == _board[2][2]) {
      _winner = _board[0][0];
    }
    if (_board[0][2] != '' &&
        _board[0][2] == _board[1][1] &&
        _board[1][1] == _board[2][0]) {
      _winner = _board[0][2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 193),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 255, 238),
        centerTitle: true,
        title: Text(
          'Tic Tac Toe',
          style: GoogleFonts.lobster(
              color: const Color.fromARGB(255, 246, 212, 111)),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _winner != null
                  ? Text('Winner: $_winner',
                      style: GoogleFonts.pacifico(
                          fontSize: 24.0,
                          color: const Color.fromARGB(255, 255, 119, 0)))
                  : const SizedBox(),
              const SizedBox(height: 20.0),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () => _markCell(row, col),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 249, 249, 249)
                                .withOpacity(0.5),
                            spreadRadius: 6,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 249, 216, 179),
                      ),
                      child: Center(
                        child: Text(
                          _board[row][col],
                          style: GoogleFonts.lobster(
                              fontSize: 48.0,
                              color: const Color.fromARGB(255, 255, 119, 0)),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: _resetBoard,
                child: Text(
                  'Reset Game',
                  style: GoogleFonts.lobster(
                      color: const Color.fromARGB(255, 255, 119, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
