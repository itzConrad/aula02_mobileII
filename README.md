# Flutter Todo - Refatoração Arquitetural
Este repositório contém um projeto de lista de tarefas (TODO) que passou por uma reestruturação completa. O objetivo principal foi transformar um projeto desorganizado em uma aplicação escalável e testável utilizando a abordagem Feature-First com princípios de Clean Architecture.

# Objetivo da Atividade
Reorganizar a estrutura de pastas e responsabilidades, garantindo que:

A UI seja puramente reativa e não conheça detalhes de implementação (API/Local Storage).

O ViewModel/Controller gerencie o estado sem depender do BuildContext.

O Repository atue como a "única fonte de verdade", mediando a comunicação entre dados remotos e locais.

# Nova Estrutura de Pastas (Feature-First)
A organização segue o padrão modular por funcionalidade, facilitando a manutenção e o isolamento de erros:

``` Plaintext

lib/
 ├── core/              # Componentes globais, utilitários e constantes.
 └── features/          # Divisão por funcionalidades do app.
      └── todos/        # Feature de Tarefas.
           ├── data/          # Implementações: Models, DataSources e Repositories.
           ├── domain/        # Regras de Negócio: Entities e Interfaces de Repository.
           └── presentation/  # Camada Visual: Widgets e ViewModels (Gerência de Estado). 
```
# Checklist de Implementação
[x] Arquitetura Feature-First: Organização por funcionalidades.

[x] Desacoplamento de UI: Remoção de chamadas diretas a HTTP/SharedPreferences nos Widgets.

[x] ViewModel Puro: Lógica de estado independente de Widgets ou BuildContext.

[x] Padrão Repository: Centralização da lógica de dados (Remoto vs Local).

[x] Documentação Técnica: Criação do arquivo ARCH.md detalhando as decisões.

# Como Executar
``` Certifique-se de ter o Flutter instalado em sua máquina.

Clone este repositório.

Instale as dependências:

Bash

flutter pub get
Execute o projeto:

Bash

flutter run
API utilizada: JSONPlaceholder
