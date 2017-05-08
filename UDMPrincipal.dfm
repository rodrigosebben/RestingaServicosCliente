object DMPrincipal: TDMPrincipal
  OldCreateOrder = False
  Height = 121
  Width = 588
  object UniConnPrincipal: TUniConnection
    ProviderName = 'mySQL'
    Port = 2020
    Database = 'RestingaServicos'
    Username = 'root'
    Server = 'ielb.no-ip.org'
    Connected = True
    LoginPrompt = False
    Left = 44
    Top = 2
    EncryptedPassword = 'CEFFC6FFCFFFCBFF'
  end
  object QueryProfissoes: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select id,nome from profissao '
      'order by nome limit 1000;')
    Left = 164
    Top = 2
    object QueryProfissoesid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryProfissoesnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 120
    end
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 44
    Top = 52
  end
  object QueryPessoa: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select p.id,p.nomepessoa,p.foto,'
      '       pro.nome as Profissao,'
      '       n.imagem as Avaliacao'
      
        ' from pessoa p left join pessoa_profissao pp on p.id = pp.pessoa' +
        '_id'
      
        '               left join profissao pro on pp.profissao_id = pro.' +
        'id'
      
        '               left join notas n on p.nota = n.nota             ' +
        '   '
      ' where pessoa_tipo_id<>1'
      
        'and pro.nome = :pProfissao or :pProfissao = '#39'SELECIONE A PROFISS' +
        #195'O'#39
      ' Order by nomepessoa;'
      '')
    Left = 164
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pProfissao'
        Value = nil
      end>
    object QueryPessoaid: TLongWordField
      FieldName = 'id'
    end
    object QueryPessoanomepessoa: TStringField
      FieldName = 'nomepessoa'
      Required = True
      Size = 250
    end
    object QueryPessoaProfissao: TStringField
      FieldName = 'Profissao'
      ReadOnly = True
      Size = 120
    end
    object QueryPessoaAvaliacao: TBlobField
      FieldName = 'Avaliacao'
      ReadOnly = True
    end
    object QueryPessoafoto: TBlobField
      FieldName = 'foto'
    end
  end
  object QueryLogradouro: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT num_cep,'
      'concat_ws('#39' '#39',desc_tipo,desc_logradouro) logradouro,'
      'b.desc_bairro Bairro,'
      'c.desc_cidade Cidade,'
      'c.flg_estado UF'
      
        'FROM logradouro l left join bairro b on l.bairro_id = b.bairro_i' +
        'd'
      
        '                  left join cidade c on b.cidade_id = c.cidade_i' +
        'd'
      ' where num_cep = :pCep;')
    Left = 268
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCep'
        Value = nil
      end>
    object QueryLogradouronum_cep: TLongWordField
      FieldName = 'num_cep'
      Required = True
    end
    object QueryLogradourologradouro: TStringField
      FieldName = 'logradouro'
      ReadOnly = True
      Size = 56
    end
    object QueryLogradouroBairro: TStringField
      FieldName = 'Bairro'
      ReadOnly = True
      Size = 45
    end
    object QueryLogradouroCidade: TStringField
      FieldName = 'Cidade'
      ReadOnly = True
      Size = 60
    end
    object QueryLogradouroUF: TStringField
      FieldName = 'UF'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object QueryProfissional: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT p.id,p.nomepessoa,'
      'p.Descricao,'
      'p.nota,'
      'p.foto,'
      'n.imagem as Avaliacao,'
      'concat_ws('#39' - '#39',c.desc_cidade,c.flg_estado) as CidadeUF,'
      
        '(select count(pessoa_contratada_id) from servicos_prestados wher' +
        'e pessoa_contratada_id = p.id group by pessoa_contratada_id) as ' +
        'TotalAtendimentos,'
      'pro.nome as Profissao'
      'FROM pessoa p left join notas n on p.nota = n.nota'
      
        '              left join logradouro l on p.logradouro_cep=l.num_c' +
        'ep'
      '              left join bairro b on l.bairro_id = b.bairro_id'
      '              left join cidade c on b.cidade_id = c.cidade_id'
      
        '              left join pessoa_profissao pp on p.id = pp.pessoa_' +
        'id and flg_principal = true'
      
        '              left join profissao pro on pro.id = pp.profissao_i' +
        'd'
      'where p.id = :pId;')
    Left = 268
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pId'
        Value = nil
      end>
    object QueryProfissionalid: TLongWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object QueryProfissionalnomepessoa: TStringField
      FieldName = 'nomepessoa'
      Required = True
      Size = 250
    end
    object QueryProfissionalDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object QueryProfissionalnota: TLongWordField
      FieldName = 'nota'
    end
    object QueryProfissionalfoto: TBlobField
      FieldName = 'foto'
    end
    object QueryProfissionalAvaliacao: TBlobField
      FieldName = 'Avaliacao'
      ReadOnly = True
    end
    object QueryProfissionalCidadeUF: TStringField
      FieldName = 'CidadeUF'
      ReadOnly = True
      Size = 65
    end
    object QueryProfissionalTotalAtendimentos: TLargeintField
      FieldName = 'TotalAtendimentos'
      ReadOnly = True
    end
    object QueryProfissionalProfissao: TStringField
      FieldName = 'Profissao'
      ReadOnly = True
      Size = 120
    end
  end
  object QueryServicosPrestados: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT s.pessoa_contratente_id CodContratante,'
      's.pessoa_contratada_id CodContratado,'
      'P.NomePessoa Contratante,'
      's.Descricao,'
      'S.Nota_contratado,'
      'S.Data_termino,'
      'p.foto,'
      'n.imagem'
      
        'FROM servicos_prestados s left join pessoa p on s.pessoa_contrat' +
        'ente_id = p.id'
      'left join notas n on s.Nota_contratado = n.nota'
      'where s.pessoa_contratada_id = :pContratado_id limit 5;')
    Left = 384
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pContratado_id'
        Value = nil
      end>
    object QueryServicosPrestadosCodContratante: TLongWordField
      FieldName = 'CodContratante'
      Required = True
    end
    object QueryServicosPrestadosCodContratado: TLongWordField
      FieldName = 'CodContratado'
      Required = True
    end
    object QueryServicosPrestadosContratante: TStringField
      FieldName = 'Contratante'
      ReadOnly = True
      Size = 250
    end
    object QueryServicosPrestadosDescricao: TMemoField
      FieldName = 'Descricao'
      BlobType = ftMemo
    end
    object QueryServicosPrestadosNota_contratado: TLongWordField
      FieldName = 'Nota_contratado'
      Required = True
    end
    object QueryServicosPrestadosData_termino: TDateTimeField
      FieldName = 'Data_termino'
      Required = True
    end
    object QueryServicosPrestadosfoto: TBlobField
      FieldName = 'foto'
      ReadOnly = True
    end
    object QueryServicosPrestadosimagem: TBlobField
      FieldName = 'imagem'
      ReadOnly = True
    end
  end
  object QueryBuscaUsuario: TUniQuery
    Connection = UniConnPrincipal
    SQL.Strings = (
      'SELECT id, nome, pessoa_id'
      'FROM usuario'
      'where email = :pEmail'
      'and senha = :pSenha;')
    Left = 384
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pEmail'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pSenha'
        Value = nil
      end>
    object QueryBuscaUsuarioid: TLongWordField
      FieldName = 'id'
    end
    object QueryBuscaUsuarionome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 150
    end
    object QueryBuscaUsuariopessoa_id: TLongWordField
      FieldName = 'pessoa_id'
    end
  end
  object QueryUsuario: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO usuario'
      '  (id, Nome, Email, Senha, CPFCNPJ, pessoa_id)'
      'VALUES'
      '  (:id, :Nome, :Email, :Senha, :CPFCNPJ, :pessoa_id)')
    SQLDelete.Strings = (
      'DELETE FROM usuario'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE usuario'
      'SET'
      
        '  id = :id, Nome = :Nome, Email = :Email, Senha = :Senha, CPFCNP' +
        'J = :CPFCNPJ, pessoa_id = :pessoa_id'
      'WHERE'
      '  id = :Old_id')
    SQLLock.Strings = (
      'SELECT * FROM usuario'
      'WHERE'
      '  id = :Old_id'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      'SELECT id, Nome, Email, Senha, CPFCNPJ, pessoa_id FROM usuario'
      'WHERE'
      '  id = :id')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM usuario')
    Connection = UniConnPrincipal
    SQL.Strings = (
      'select * from usuario')
    FilterOptions = [foCaseInsensitive]
    Left = 504
    Top = 4
    object QueryUsuarioid: TLongWordField
      FieldName = 'id'
    end
    object QueryUsuarioNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 150
    end
    object QueryUsuarioEmail: TStringField
      FieldName = 'Email'
      Required = True
      Size = 255
    end
    object QueryUsuarioSenha: TStringField
      FieldName = 'Senha'
      Required = True
      Size = 45
    end
    object QueryUsuarioCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Required = True
      Size = 14
    end
    object QueryUsuariopessoa_id: TLongWordField
      FieldName = 'pessoa_id'
    end
  end
end