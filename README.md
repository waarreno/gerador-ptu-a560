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

## 🚀 Instalação

### Pré-requisitos

- Node.js 14.0.0 ou superior
- npm (geralmente incluído com Node.js)

### Passos de Instalação

1. Clone ou baixe este repositório
2. Abra o terminal na pasta do projeto
3. Instale as dependências:

```bash
npm install
```

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
├── output/                    # Diretório de saída (gerado automaticamente)
├── logs/                      # Logs de processamento (opcional)
├── dados.xlsx                 # Arquivo Excel padrão (não incluído)
├── executar.bat               # Script para Windows (Node.js portátil)
├── package.json               # Dependências do projeto
├── .gitignore                 # Arquivos ignorados pelo Git
└── README.md                  # Este arquivo
```

## 🎯 Uso

### Método 1: Arquivo Padrão (dados.xlsx)

1. Crie um arquivo `dados.xlsx` na pasta raiz do projeto
2. Preencha os dados conforme o template (veja seção "Estrutura da Planilha")
3. Execute o aplicativo:

```bash
npm start
```

### Método 2: Arquivo Personalizado

1. Execute o aplicativo:

```bash
npm start
```

2. Quando solicitado, informe o caminho do seu arquivo Excel
3. Escolha se deseja compactar os arquivos em ZIP

### Método 3: Windows (Node.js Portátil)

1. Baixe o Node.js portátil e extraia na pasta `nodejs-portable/`
2. Execute o arquivo `executar.bat`

## 📝 Estrutura da Planilha Excel

A planilha deve conter as seguintes colunas (os nomes exatos são importantes):

### Cabeçalho PTU
- `nrVerTra_PTU` - Versão da transação (padrão: 02)
- `cd_Uni_Destino` - Código da Unimed de destino (4 dígitos)
- `cd_Uni_Origem` - Código da Unimed de origem (4 dígitos)
- `tp_arquivoNDC` - Tipo de arquivo NDC
- `tp_arq_parcial` - Tipo de arquivo parcial (opcional: 1 ou 2)

### Documento 1 (Obrigatório)
- `nr_Doc_Cob` - Número do documento de cobrança
- `nr_Nota_Debito` - Número da nota de débito
- `dt_Emissao_NDC` - Data de emissão (DD/MM/YYYY)
- `dt_Ven_NDC` - Data de vencimento (DD/MM/YYYY)
- `vl_NDC` - Valor da nota de débito
- `linha_1` até `linha_32` - Linhas da nota de débito

### Boleto 1 (Opcional)
- `boleto_nr_Banco` - Número do banco
- `boleto_agencia_Cd_Cedente` - Agência e código do cedente
- `boleto_nosso_Numero` - Nosso número
- `boleto_linha_digitavel` - Linha digitável
- `boleto_cd_barras` - Código de barras
- `boleto_instrucao_1` até `boleto_instrucao_3` - Instruções
- `boleto_observacao_1` até `boleto_observacao_5` - Observações
- (outros campos opcionais do boleto)

### Documento 2 (Opcional)
- `doc2_nr_Doc_Cob` - Número do documento 2
- `doc2_nr_Nota_Debito` - Número da nota de débito 2
- `doc2_dt_Emissao_NDC` - Data de emissão
- `doc2_dt_Ven_NDC` - Data de vencimento
- `doc2_vl_NDC` - Valor
- `doc2_linha_1` até `doc2_linha_32` - Linhas
- (campos do boleto 2 seguem o mesmo padrão com prefixo `doc2_`)

### Dados da Credora (Obrigatório)
- `credora_nm_credora` - Nome da credora
- `credora_tp_logradouro` - Tipo de logradouro (2 dígitos)
- `credora_ds_lograd` - Descrição do logradouro
- `credora_nr_lograd` - Número do logradouro
- `credora_compl_lograd` - Complemento (opcional)
- `credora_ds_bairro` - Bairro (opcional)
- `credora_cd_munic` - Código do município
- `credora_nr_cep` - CEP
- `credora_cpf_cnpj` - CPF ou CNPJ
- `credora_nr_ddd` - DDD (opcional)
- `credora_nr_fone` - Telefone (opcional)

### Dados da Devedora (Obrigatório)
- `devedora_nm_devedora` - Nome da devedora
- `devedora_tp_logradouro` - Tipo de logradouro
- `devedora_ds_lograd` - Descrição do logradouro
- `devedora_nr_lograd` - Número
- `devedora_compl_lograd` - Complemento (opcional)
- `devedora_ds_bairro` - Bairro (opcional)
- `devedora_cd_munic` - Código do município
- `devedora_nr_cep` - CEP
- `devedora_cpf_cnpj` - CPF ou CNPJ
- `devedora_nr_ddd` - DDD (opcional)
- `devedora_nr_fone` - Telefone (opcional)

### Carimbo CMB (Opcional)
- `cmb_dt_postagem` - Data de postagem
- `cmb_nr_protocolo` - Número do protocolo

## ⚙️ Configuração

Edite o arquivo `src/config.js` para personalizar:

- Diretório de saída
- Compactação automática
- Nível de compressão
- Validações de dados
- Formatos de data aceitos
- Logs e relatórios

## 📤 Saída

Os arquivos gerados seguem o padrão de nomenclatura PTU A560:

```
ND{tipo}_{documento}{sufixo}.{codOrigem}
```

Exemplo: `ND1_0012345.0123` ou `ND2_0067890_1.0456`

### Estrutura de Saída

```
output/
├── ND1_0012345.zip
├── ND1_0012346.zip
├── ND2_0067890.zip
└── ...
```

Cada arquivo ZIP contém o arquivo XML correspondente.

## 🔧 Funcionalidades Técnicas

### Tratamento de Dados
- Remove acentos e caracteres especiais
- Formata datas automaticamente (DD/MM/YYYY, YYYY-MM-DD, etc.)
- Converte valores monetários
- Preenche zeros à esquerda quando necessário
- Identifica automaticamente CPF ou CNPJ pelo tamanho

### Validações
- Verifica existência de campos obrigatórios
- Valida formato de datas
- Detecta erros de codificação
- Gera relatório de erros por linha

### Segurança
- Cálculo de hash MD5 para integridade
- Encoding Latin1 (ISO-8859-1) conforme padrão PTU
- Validação de estrutura XML

## 📊 Relatório de Processamento

Ao final do processamento, o sistema exibe:

- Total de registros processados
- Número de arquivos gerados com sucesso
- Quantidade de erros encontrados
- Detalhamento de erros por linha
- Caminho dos arquivos de saída

## 🐛 Solução de Problemas

### Erro: "Arquivo não encontrado"
- Verifique se o caminho do arquivo Excel está correto
- Certifique-se de que o arquivo tem extensão .xlsx ou .xls

### Erro: "Nenhum registro encontrado"
- Verifique se a planilha possui dados
- Confirme que a primeira linha contém os cabeçalhos
- Certifique-se de estar na aba correta da planilha

### Erro ao processar linha específica
- Verifique os dados da linha indicada no relatório
- Confirme que campos obrigatórios estão preenchidos
- Valide o formato de datas e valores

### Arquivos não são gerados
- Verifique permissões de escrita na pasta `output/`
- Confirme que há espaço em disco disponível

## 📚 Dependências

- **xlsx** (^0.18.5) - Leitura de arquivos Excel
- **xmlbuilder2** (^3.1.1) - Construção de XML
- **archiver** (^6.0.1) - Compactação ZIP
- **inquirer** (^8.2.6) - Interface interativa CLI
- **chalk** (^4.1.2) - Colorização de texto no terminal
- **ora** (^5.4.1) - Spinners e indicadores de progresso

## 📄 Licença

MIT License

## 👨‍💻 Autor

**Wárreno Hendrick Costa Lima Guimarães**

Coordenador de Contas Médicas

---

## 🤝 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abrir um Pull Request

## 📞 Suporte

Para dúvidas, problemas ou sugestões:
- Abra uma issue no repositório
- Entre em contato com o desenvolvedor

---

**Versão:** 1.0.0  
**Última atualização:** 20/10/2025

Feito com ❤️ para a área de Contas Médicas da Unimed Cerrado