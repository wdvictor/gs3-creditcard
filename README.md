# 📱 Aplicativo de Cartão de Crédito

Aqui você encontrará instruções sobre como configurar e executar o projeto corretamente.

## 🛠️ Configuração do Ambiente

Antes de rodar o aplicativo, certifique-se de que seu ambiente está pronto. Você precisará de:

- **Flutter SDK** (versão mais recente)
- **Dart** (vem incluído no Flutter)
- **Android Studio**
- **Dispositivo físico ou emulador rodando Android 5.0 (API 21) ou superior**

## 🚀 Como Rodar o Projeto

1. **Clone este repositório**
   ```sh
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```

2. **Instale as dependências do Flutter**
   ```sh
   flutter pub get
   ```

3. **Conecte um dispositivo ou inicie um emulador**
   ```sh
   flutter devices
   ```
   Verifique se seu dispositivo aparece na lista.

4. **Execute o aplicativo**
   ```sh
   flutter run
   ```

## 📌 Restrições do Projeto

- O aplicativo **exige Android 5.0 (API 21) ou superior** para funcionar.
- Ele foi projetado e testado para **Android 14 (API 35)**.
- O projeto usa **compileSdkVersion 35** e **targetSdkVersion 35** para compatibilidade.
- Certifique-se de que o **Flutter SDK está atualizado** para evitar erros.

## 🐛 Solução de Problemas

Se você encontrar erros ao rodar o projeto, tente:
- Atualizar o Flutter:
  ```sh
  flutter upgrade
  ```
- Limpar o cache e reconstruir o projeto:
  ```sh
  flutter clean
  flutter pub get
  ```
- Atualizar as dependências do Flutter:
  ```sh
  flutter pub upgrade
  ```

Caso o problema persista, abra uma *issue* no repositório. 🛠️

---

Feito com ❤️ e Flutter! 🚀

