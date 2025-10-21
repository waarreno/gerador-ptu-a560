# Gerador PTU A560 - Lote de NDC

Sistema automatizado para geração de arquivos XML no padrão PTU A560 (Unimed) para Notas de Débito e Crédito (NDC) a partir de planilhas Excel.

## 📋 Descrição

Este projeto permite a geração em lote de arquivos XML PTU A560, facilitando o processo de criação de Notas de Débito e Crédito no padrão Unimed. O sistema lê dados de uma planilha Excel e gera automaticamente os arquivos XML com hash MD5, além de compactá-los em formato ZIP.

## ✨ Características

- ✅ Geração automática de XML no padrão PTU A560
- ✅ Processamento em lote de múltiplos registros
- ✅ Leitura de dados a partir de planilha Excel (.xlsx/.xls)
- ✅ Cálculo automático de hash MD5
- ✅ Compactação automática em formato ZIP
- ✅ Tratamento de caracteres especiais e acentuação
- ✅ Formatação automática de datas e valores monetários
- ✅ Suporte para até 2 documentos por arquivo
- ✅ Validação de dados e relatório de erros
- ✅ Interface interativa via linha de comando
- ✅ Nomenclatura de arquivos conforme padrão PTU
- ✅ **Instalação automática** de Node.js e dependências (Windows)

## 🚀 Instalação e Uso

### 🪟 Método 1: Windows - Executável Automatizado (RECOMENDADO)

**Este é o método mais simples e não requer conhecimento técnico!**

1. Faça o download ou clone este repositório
2. Crie/edite o arquivo `dados.xlsx` na pasta raiz com seus dados
3. **Execute o arquivo `executar.bat`**
4. Pronto! O sistema irá automaticamente:
   - ✅ Baixar o Node.js v22.12.0 (se necessário)
   - ✅ Instalar todas as dependências (se necessário)
   - ✅ Iniciar a aplicação

**Requisitos:** Apenas Windows 7 ou superior com PowerShell

---

### 💻 Método 2: Instalação Manual (Qualquer Sistema Operacional)

#### Pré-requisitos
- Node.js 14.0.0 ou superior
- npm (geralmente incluído com Node.js)

#### Passos de Instalação

1. Clone ou baixe este repositório
2. Abra o terminal na pasta do projeto
3. Instale as dependências:

```bash
npm install
```

4. Execute o aplicativo:

```bash
npm start
```

---

## 📊 Estrutura do Projeto

```
gerador-ptu-a560/
│
├── src/
│   ├── config.js              # Configurações da aplicação
│   ├── index.js               # Arquivo principal
│   ├── excelProcessor.js      # Processamento de arquivos Excel
│   ├── xmlGenerator.js        # Geração de XML
│   ├── zipCompressor.js       # Compactação de arquivos
│   └── utils.js               # Funções utilitárias
│
├── nodejs-portable/           # Node.js portátil (Windows - auto instalado)
├── node_modules/              # Dependências (auto instaladas)
├── output/                    # Diretório de saída (gerado automaticamente)
├── dados.xlsx                 # Arquivo Excel padrão com seus dados
├── executar.bat               # Script automatizado para Windows
├── package.json               # Configuração e dependências
├── .gitignore                 # Arquivos ignorados pelo Git
└── README.md                  # Este arquivo
```

## 🎯 Como Usar

### Passo 1: Preparar os Dados

Crie ou edite o arquivo `dados.xlsx` na pasta raiz do projeto com seus dados seguindo a estrutura descrita na seção "Estrutura da Planilha Excel".

### Passo 2: Executar

**Windows:**
```
Duplo clique em executar.bat
```

**Outros sistemas:**
```bash
npm start
```

### Passo 3: Escolher Opções

Quando solicitado:
1. Confirme se deseja usar o arquivo `dados.xlsx` (ou informe outro caminho)
2. Escolha se deseja compactar os arquivos em ZIP

### Passo 4: Coletar Resultados

Os arquivos gerados estarão na pasta `output/`:
- Arquivos XML (se não compactados)
- Arquivos ZIP contendo os XMLs (se compactados)

---

## 📝 Estrutura da Planilha Excel

A planilha deve conter as seguintes colunas (os nomes exatos são importantes):

### Cabeçalho PTU
| Coluna | Descrição | Formato | Obrigatório |
|--------|-----------|---------|-------------|
| `nrVerTra_PTU` | Versão da transação | Texto (padrão: "02") | Não* |
| `cd_Uni_Destino` | Código Unimed destino | Numérico (4 dígitos) | Sim |
| `cd_Uni_Origem` | Código Unimed origem | Numérico (4 dígitos) | Sim |
| `tp_arquivoNDC` | Tipo de arquivo NDC | Numérico (1-2) | Sim |
| `tp_arq_parcial` | Tipo arquivo parcial | Numérico (1 ou 2) | Não |

*Se não informado, usa valor padrão "02"

### Documento 1 - Nota de Débito (Obrigatório)
| Coluna | Descrição | Formato | Obrigatório |
|--------|-----------|---------|-------------|
| `nr_Doc_Cob` | Número do documento | Texto/Numérico | Sim |
| `nr_Nota_Debito` | Número da nota de débito | Texto/Numérico | Sim |
| `dt_Emissao_NDC` | Data de emissão | DD/MM/YYYY | Sim |
| `dt_Ven_NDC` | Data de vencimento | DD/MM/YYYY | Sim |
| `vl_NDC` | Valor da nota | Numérico (ex: 1500.00) | Sim |
| `linha_1` a `linha_32` | Linhas descritivas | Texto | Não |

### Documento 1 - Boleto (Opcional)
| Coluna | Descrição | Obrigatório |
|--------|-----------|-------------|
| `boleto_nr_Banco` | Número do banco | Condicional* |
| `boleto_agencia_Cd_Cedente` | Agência e código cedente | Condicional* |
| `boleto_nosso_Numero` | Nosso número | Condicional* |
| `boleto_linha_digitavel` | Linha digitável | Condicional* |
| `boleto_cd_barras` | Código de barras | Condicional* |
| `boleto_local_pgto` | Local de pagamento | Condicional* |
| `boleto_obs_local_pagto` | Observação local pgto | Condicional* |
| `boleto_instrucao_1` a `boleto_instrucao_3` | Instruções | Não |
| `boleto_observacao_1` a `boleto_observacao_5` | Observações | Não |

*Se informar `boleto_nr_Banco`, todos os campos marcados como "Condicional" tornam-se obrigatórios.

### Documento 2 (Opcional - Mesmo padrão do Documento 1)
Prefixe todas as colunas do Documento 1 com `doc2_`:
- `doc2_nr_Doc_Cob`
- `doc2_nr_Nota_Debito`
- `doc2_dt_Emissao_NDC`
- E assim por diante...

### Dados da Credora (Obrigatório)
| Coluna | Descrição | Obrigatório |
|--------|-----------|-------------|
| `credora_nm_credora` | Nome da credora | Sim |
| `credora_tp_logradouro` | Tipo logradouro | Sim |
| `credora_ds_lograd` | Logradouro | Sim |
| `credora_nr_lograd` | Número | Sim |
| `credora_compl_lograd` | Complemento | Não |
| `credora_ds_bairro` | Bairro | Não |
| `credora_cd_munic` | Código município | Sim |
| `credora_nr_cep` | CEP | Sim |
| `credora_cpf_cnpj` | CPF ou CNPJ | Sim |
| `credora_nr_ddd` | DDD | Não |
| `credora_nr_fone` | Telefone | Não |

### Dados da Devedora (Obrigatório)
Mesmo padrão da Credora, prefixado com `devedora_`:
- `devedora_nm_devedora`
- `devedora_tp_logradouro`
- E assim por diante...

### Carimbo CMB (Opcional)
| Coluna | Descrição | Obrigatório |
|--------|-----------|-------------|
| `cmb_dt_postagem` | Data de postagem | Não |
| `cmb_nr_protocolo` | Número do protocolo | Não |

---

## ⚙️ Configuração

Edite o arquivo `src/config.js` para personalizar:

```javascript
{
  // Diretório de saída
  diretorioSaida: './output',
  
  // Compactação
  compactacao: {
    ativar: true,
    nivel: 9,
    removerOriginal: true
  },
  
  // Logs
  log: {
    intervaloProgresso: 10,
    verbose: false
  },
  
  // Validações
  validacao: {
    validarDatas: true
  }
}
```

---

## 📤 Arquivos Gerados

### Nomenclatura Padrão PTU A560

```
ND{tipo}_{documento}{sufixo}.{codOrigem}
```

**Exemplos:**
- `ND1_0012345.0123` 
- `ND2_0067890_1.0456`
- `ND1__000123.0789`

**Onde:**
- `{tipo}` = Tipo do arquivo NDC (1 ou 2)
- `{documento}` = Últimos 7 dígitos do número do documento
- `{sufixo}` = `_1` ou `_2` se for arquivo parcial
- `{codOrigem}` = Código da Unimed de origem

### Estrutura de Saída

```
output/
├── ND1_0012345.zip          # Arquivo compactado
│   └── ND1_0012345.0123     # XML dentro do ZIP
├── ND1_0012346.zip
├── ND2_0067890.zip
└── ...
```

---

## 🔧 Funcionalidades Técnicas

### Tratamento de Dados
- ✅ Remove acentos e caracteres especiais automaticamente
- ✅ Formata datas (aceita DD/MM/YYYY, YYYY-MM-DD, números seriais do Excel)
- ✅ Converte valores monetários (aceita vírgula ou ponto)
- ✅ Preenche zeros à esquerda quando necessário
- ✅ Identifica CPF (11 dígitos) ou CNPJ (14 dígitos) automaticamente
- ✅ Encoding Latin1 (ISO-8859-1) conforme padrão PTU

### Validações
- ✅ Verifica campos obrigatórios
- ✅ Valida formato de datas
- ✅ Gera relatório detalhado de erros por linha
- ✅ Continua processamento mesmo com erros individuais

### Segurança e Integridade
- ✅ Cálculo de hash MD5 para cada arquivo
- ✅ Validação de estrutura XML
- ✅ Nomenclatura conforme especificação PTU

---

## 📊 Relatório de Processamento

Ao final do processamento, o sistema exibe:

```
╔═══════════════════════════════════╗
║        RELATÓRIO FINAL            ║
╚═══════════════════════════════════╝

  📊 Total de registros: 50
  ✅ Processados com sucesso: 48
  ❌ Erros encontrados: 2

⚠️ Detalhes dos erros:

  • Linha 15: Campo obrigatório 'nr_Nota_Debito' não preenchido
  • Linha 23: Data inválida em 'dt_Emissao_NDC'

📁 Arquivos salvos em: C:\projeto\output\
```

---

## 🐛 Solução de Problemas

### ❌ Erro: "Arquivo não encontrado"
**Solução:**
- Verifique se o arquivo `dados.xlsx` está na pasta raiz do projeto
- Confirme que o caminho do arquivo está correto
- Certifique-se de que a extensão é `.xlsx` ou `.xls`

### ❌ Erro: "Nenhum registro encontrado"
**Solução:**
- Verifique se a planilha possui dados (além do cabeçalho)
- Confirme que a primeira linha contém os nomes corretos das colunas
- Certifique-se de estar na primeira aba da planilha

### ❌ Erro ao processar linha específica
**Solução:**
- Verifique os dados da linha indicada no relatório de erros
- Confirme que todos os campos obrigatórios estão preenchidos
- Valide o formato das datas (DD/MM/YYYY)
- Verifique se valores numéricos não contêm caracteres inválidos

### ❌ Arquivos não são gerados
**Solução:**
- Verifique permissões de escrita na pasta `output/`
- Confirme que há espaço em disco disponível
- Execute o programa como Administrador (Windows)

### ❌ Erro na instalação (Windows)
**Solução:**
- Verifique sua conexão com a internet
- Execute o `executar.bat` como Administrador
- Desative temporariamente o antivírus
- Limpe a pasta `nodejs-portable` e tente novamente

### ❌ Caracteres especiais aparecem incorretos
**Solução:**
- O sistema remove automaticamente acentos conforme padrão PTU
- Isso é intencional e correto para o formato

---

## 📚 Dependências

| Pacote | Versão | Descrição |
|--------|--------|-----------|
| **xlsx** | ^0.18.5 | Leitura de arquivos Excel |
| **xmlbuilder2** | ^3.1.1 | Construção de XML |
| **archiver** | ^6.0.1 | Compactação ZIP |
| **inquirer** | ^8.2.6 | Interface interativa CLI |
| **chalk** | ^4.1.2 | Colorização de texto |
| **ora** | ^5.4.1 | Spinners de progresso |

---

## 📄 Licença

ISC License

Copyright (c) 2025 Wárreno Hendrick Costa Lima Guimarães

---

## 👨‍💻 Autor

**Wárreno Hendrick Costa Lima Guimarães**

Coordenador de Contas Médicas  


---

## 🤝 Contribuições

Contribuições são bem-vindas! Para contribuir:

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

---

## 📞 Suporte

Para dúvidas, problemas ou sugestões:
- 🐛 Abra uma issue no repositório
- 💬 Entre em contato com o desenvolvedor

---

## 📋 Changelog

### v1.0.0 (2025)
- ✅ Versão inicial
- ✅ Geração de XML PTU A560
- ✅ Processamento em lote
- ✅ Instalação automática (Windows)
- ✅ Compactação ZIP
- ✅ Relatório de erros

---

**Versão:** 1.0.0  
**Última atualização:** Outubro 2025  
**Node.js recomendado:** v22.12.0

Feito com ❤️ para a área de Contas Médicas da Unimed Cerrado