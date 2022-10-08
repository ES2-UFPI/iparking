import 'package:iparking_app/ui/pages/pagamento/pagamento_controller.dart';

import 'package:test/test.dart';

void main() {
  group("Validação de Informações", () {
    test('Deve ser inválido - Teste 1', () {
    final teste = TesteValidadeInformacoes("2", "300", "Alo alo 5", "1/08");

    teste.realizar_teste();

    expect(teste.valido, false);
    });
    
    test('Deve ser inválido - Teste 2', () {
    final teste = TesteValidadeInformacoes("0000000000000000", "30", "Jonas La do Rancho", "10/08");

    teste.realizar_teste();

    expect(teste.valido, false);
    });
    
    test('Deve ser inválido - Teste 3', () {
    final teste = TesteValidadeInformacoes("", "", "", "");

    teste.realizar_teste();

    expect(teste.valido, false);
    });

    test('Deve ser inválido - Teste 4', () {
    final teste = TesteValidadeInformacoes("", "", "8", "");

    teste.realizar_teste();

    expect(teste.valido, false);
    });
    
    test('Deve ser válido - Teste 5', () {
    final teste = TesteValidadeInformacoes("9999888877776666", "222", "Geraldo de Rívia", "08/06");

    teste.realizar_teste();

    expect(teste.valido, false);
    });

    test('Deve ser válido - Teste 6', () {
    final teste = TesteValidadeInformacoes("9999111177776666", "999", "Geraldo de Alexandria", "08/01");

    teste.realizar_teste();

    expect(teste.valido, false);
    });
  });
}