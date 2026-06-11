# 🎲 Ficha de RPG — ASP.NET MVC

Sistema web para **criação e gerenciamento de fichas de personagens** para jogos de RPG (Role-Playing Game), desenvolvido com o padrão arquitetural **MVC (Model-View-Controller)** usando **ASP.NET Core**.

---

## ✨ Funcionalidades

- **Criar fichas** de personagens com campos completos: nome, raça, classe, atributos, habilidades e mais
- **Editar e atualizar** informações de personagens existentes
- **Excluir** fichas de personagens
- **Visualização detalhada** de todas as informações do personagem
- **Autenticação de usuários** para acesso seguro e privado às fichas
- Armazenamento em banco de dados **SQL Server**

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia        | Uso                                      |
|-------------------|------------------------------------------|
| ASP.NET Core MVC  | Framework principal (back-end e views)   |
| SQL Server        | Banco de dados relacional                |
| Bootstrap         | Estilização e responsividade             |
| jQuery            | Interatividade no front-end              |
| Font Awesome      | Ícones da interface                      |
| JavaScript/CSS    | Comportamento e estilos customizados     |
| T-SQL             | Scripts de banco de dados                |

---

## 📋 Pré-requisitos

- [.NET SDK](https://dotnet.microsoft.com/download)
- [SQL Server](https://www.microsoft.com/pt-br/sql-server) instalado e configurado
- [Visual Studio](https://visualstudio.microsoft.com/) ou outra IDE compatível

---

## 🚀 Como Executar

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/Dravvos/FichaRPG.git
   ```

2. **Configure o banco de dados:**
   - Navegue até a pasta `Database Project`
   - Execute os scripts SQL no seu SQL Server

3. **Configure a string de conexão:**
   - Abra o arquivo `ConexaoBD.cs` no projeto
   - Atualize com as informações de conexão do seu servidor SQL

4. **Execute o projeto:**
   - Abra no Visual Studio e pressione `F5`, ou via CLI:
     ```bash
     cd FichaRPG
     dotnet run
     ```

5. **Acesse no navegador:**
   - `https://localhost:{porta}`

---

## 📁 Estrutura do Projeto

```
FichaRPG/
├── .github/workflows/    # Configurações de CI/CD (GitHub Actions)
├── FichaRPG/             # Código-fonte MVC (Controllers, Models, Views)
├── Database Project/     # Scripts de banco de dados (T-SQL)
├── .gitignore
├── LICENSE               # Licença Apache 2.0
└── README.md
```

---

## 🤝 Contribuições

Contribuições são muito bem-vindas! Para contribuir:

1. Faça um **fork** do repositório
2. Crie uma nova branch: `git checkout -b minha-feature`
3. Implemente suas alterações
4. Envie um **pull request** descrevendo o que foi feito

---

## 📄 Licença

Este projeto está licenciado sob a [Apache License 2.0](LICENSE).

---

Desenvolvido por [Daniel Oliveira Dias (Dravvos)](https://github.com/Dravvos)
