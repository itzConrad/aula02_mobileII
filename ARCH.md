# ARCH — Preencha após refatoração

## Estrutura final (cole a árvore de pastas)
lib/
  core/
    app_errors.dart

  features/
    todos/
      data/
        datasources/
          todo_local_datasource.dart
          todo_remote_datasource.dart
        models/
          todo_model.dart
        repositories/
          todo_repository_impl.dart

      domain/
        entities/
          todo.dart
        repositories/
          todo_repository.dart

      presentation/
        pages/
          todos_page.dart
        viewmodels/
          todo_viewmodel.dart
        widgets/
          add_todo_dialog.dart

  ui/
    app_root.dart

  main.dart

## Fluxo de dependências
UI → ViewModel → UseCase → Repository → (RemoteDataSource, LocalDataSource)

## Decisões
- Onde ficou a validação?
As validações simples de entrada (por exemplo, verificar se o título do todo está vazio) ficaram no ViewModel.

Esse tipo de validação está diretamente relacionado à interação do usuário com a tela, portanto faz mais sentido permanecer na camada de apresentação.

- Onde ficou o parsing JSON?
O parsing de JSON ficou exclusivamente na camada data, dentro dos arquivos de model.

- Como você tratou erros?
O arquivo core/app_errors.dart foi utilizado para centralizar tipos de erro que podem ser reaproveitados no projeto.
