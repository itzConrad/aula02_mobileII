# Respostas do Questionário - Atividade 2 (Arquitetura)

**1. Em qual camada foi implementado o mecanismo de cache? Explique por que essa decisão é adequada dentro da arquitetura proposta.**
O mecanismo de cache foi implementado na camada de Dados (Data Layer), especificamente em um DataSource local (`LocalDataSource`), sendo orquestrado pelo `ProductRepository`. Essa decisão é adequada porque isola a lógica de armazenamento da camada de Apresentação (UI e ViewModel). O Repository atua como uma única fonte de verdade: ele abstrai a complexidade e decide de forma transparente se os dados devem vir do RemoteDataSource (API) ou do LocalDataSource (Cache), entregando a informação limpa para o ViewModel.

**2. Por que o ViewModel não deve realizar chamadas HTTP diretamente?**
Porque isso fere o princípio da Responsabilidade Única (SRP). O papel do ViewModel é exclusivamente gerenciar o estado da interface (carregando, sucesso, erro) e preparar os dados para exibição na View. Colocar chamadas HTTP diretamente nele criaria um forte acoplamento com a infraestrutura externa, tornando o código difícil de testar, de reutilizar e de manter caso a forma de comunicação mude.

**3. O que poderia acontecer se a interface acessasse diretamente o DataSource?**
A interface (UI) ficaria intimamente acoplada à implementação técnica de busca de dados. Se o DataSource mudasse de uma API REST para o Firebase, ou se a regra de negócio exigisse buscar do cache antes da API, todo o código visual da tela precisaria ser reescrito. Além disso, a UI ficaria poluída com lógicas complexas de requisição e conversão de dados, dificultando a leitura, a manutenção e impossibilitando a realização de testes unitários apenas na regra de negócios.

**4. Como essa arquitetura facilitaria a substituição da API por um banco de dados local?**
Como a UI se comunica apenas com o ViewModel, e o ViewModel se comunica apenas com a

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
