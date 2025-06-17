# Mão a Obra

## Case 1 – Biblioteca

Cenário:

**Uma biblioteca deseja cadastrar informações sobre seus livros e autores.**

Cada livro pode ter um ou mais autores, e um autor pode ter escrito vários livros.
Tarefa:
Identifique as entidades e seus atributos.
Modele o relacionamento entre elas.
Determine a cardinalidade.
Inclua uma entidade associativa, se necessário.

### **Entidades e Seus Atributos**

**Livro**

- **id_livro** (Chave Primária): Identificador único para cada livro.

- **titulo**: O título do livro.

- **editora**: A editora que publicou o livro.

- **ano_publicacao**: O ano em que o livro foi publicado.

**Autor**

- **id_autor**(Chave Primária): Identificador único para cada autor.

- **nome_autor**: O nome completo do autor.

- **nacionalidade**: A nacionalidade do autor (opcional, mas bom para completar a informação).


### **Relacionamento e Cardinalidade**

O relacionamento entre Livro e Autor é "Escreve".

Um Livro pode ter um ou muitos Autores.
Um Autor pode escrever um ou muitos Livros.
Isso descreve um relacionamento de muitos-para-muitos.

### **Entidade Associativa**

Devido ao relacionamento de muitos-para-muitos, precisamos de uma entidade associativa (também conhecida como tabela de junção ou ponte) para resolver isso. Essa entidade irá ligar os registros das tabelas Livro e Autor.

**Livro_Autor**

- **id_livro**(Chave Estrangeira): Faz referência a Livro.id_livro.
  
- **id_autor**(Chave Estrangeira): Faz referência a Autor.id_autor.
  
A combinação de (id_livro, id_autor) formará a chave primária composta para esta tabela. Isso garante que cada par único de livro-autor seja registrado apenas uma vez.
Modelo (Estrutura da Tabela)
Veja como as tabelas seriam estruturadas:

### Modelo Lógico 

````SQL
CREATE TABLE Livro (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    editora VARCHAR(100),
    ano_publicacao INT
);

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY,
    nome_autor VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(100)
);

CREATE TABLE Livro_Autor (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro),
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);
````

````txt
+---------------+           +-----------------+           +------------+
|     LIVRO     |           |   LIVRO_AUTOR   |           |    AUTOR   |
+---------------+           +-----------------+           +------------+
| *id_livro (PK)|<---------| *id_livro (FK)  |           | *id_autor (PK)|
| titulo        |           | *id_autor (FK)  |--------->| nome_autor |
| editora       |           +-----------------+           | nacionalidade|
| ano_publicacao|                                         +------------+
+---------------+
````


## Case 2 – Clínica Médica
Cenário:
Uma clínica deseja armazenar dados sobre os pacientes e suas consultas.

Cada paciente pode ter várias consultas, mas cada consulta é relacionada a apenas um paciente.
Tarefa:
Modele o MER com entidades e atributos.
Determine a cardinalidade entre as entidades.
Adicione possíveis atributos ao relacionamento.

---

### Entidades e Atributos

Para a clínica médica, identificamos duas entidades principais e seus respectivos atributos:

**Paciente**

- **id\_paciente** (Chave Primária): Identificador único para cada paciente.
  
- **nome\_paciente**: Nome completo do paciente.
  
- **data\_nascimento**: Data de nascimento do paciente.
  
- **telefone**: Número de telefone para contato.
  
- **endereco**: Endereço completo do paciente.

**Consulta**

- **id\_consulta** (Chave Primária): Identificador único para cada consulta.

- **data\_consulta**: Data em que a consulta foi realizada.

- **hora\_consulta**: Hora em que a consulta foi realizada.

- **diagnostico**: Descrição do diagnóstico feito na consulta.

- **receita**: Informações sobre a receita médica (se houver).

- **id\_paciente** (Chave Estrangeira): Faz referência a `Paciente.id_paciente`, ligando a consulta ao paciente.

### Relacionamento e Cardinalidade

O relacionamento entre **Paciente** e **Consulta** é "Realiza" (ou "Tem").

* Um **Paciente** pode ter **várias** **Consultas**.
* Cada **Consulta** é relacionada a **apenas um** **Paciente**.

Isso define um relacionamento de **um-para-muitos (1:N)**, onde o lado "um" é o **Paciente** e o lado "muitos" é a **Consulta**. A chave estrangeira `id_paciente` na tabela `Consulta` é quem estabelece essa ligação.

### Atributos do Relacionamento (e do Modelo)

Neste caso, não precisamos de uma entidade associativa, pois o relacionamento é um-para-muitos. Os atributos que poderiam estar "no relacionamento" já foram incorporados diretamente na entidade **Consulta**, como a **data\_consulta**, **hora\_consulta**, **diagnostico** e **receita**. Estes são detalhes específicos de cada consulta e, por estarem relacionados a um único paciente, pertencem à entidade `Consulta`.

### Modelo (Estrutura da Tabela)

```sql
CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nome_paciente VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE Consulta (
    id_consulta INT PRIMARY KEY,
    id_paciente INT NOT NULL, -- Chave estrangeira para o Paciente
    data_consulta DATE NOT NULL,
    hora_consulta TIME,
    diagnostico TEXT,
    receita TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);
```

````txt
+-----------------+       +---------------------+
|    PACIENTE     |       |       CONSULTA      |
+-----------------+       +---------------------+
| *id_paciente (PK)|       | *id_consulta (PK)  |
| nome_paciente   |       | id_paciente (FK)   |
| data_nascimento |-------| data_consulta      |
| telefone        |  1:N  | hora_consulta      |
| endereco        |       | diagnostico        |
+-----------------+       | receita            |
                          +---------------------+
````
