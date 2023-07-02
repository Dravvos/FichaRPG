using FichaRPG.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using FichaRPG.Services;

namespace FichaRPG.DAO
{
    public class PersonagemDAO : PadraoDAO<PersonagemViewModel>
    {
        protected override SqlParameter[] CriaParametros(PersonagemViewModel model)
        {
            object trilha = model.TrilhaId;
            object doencaManiaFobia = model.DoencaFobiaMania;
            object historia = model.Historia;
            object anotacoes = model.Anotacoes;
            object localNascimento = model.LocalNascimento;
            object aparencia = model.Aparencia;
            object favoritos = model.Favoritos;
            object personalidade = model.Personalidade;

            if (localNascimento == null)
                localNascimento = DBNull.Value;
            if (favoritos == null)
                favoritos = DBNull.Value;
            if (anotacoes == null)
                anotacoes = DBNull.Value;
            if (aparencia == null)
                aparencia = DBNull.Value;
            if (personalidade == null)
                personalidade = DBNull.Value;
            if (doencaManiaFobia == null)
                doencaManiaFobia = DBNull.Value;
            if (historia == null)
                historia = DBNull.Value;
            if (trilha == null)
                trilha = DBNull.Value;


            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("idade",model.Idade),
                new SqlParameter("local_nascimento",localNascimento),
                new SqlParameter("nex",model.Nex),
                new SqlParameter("historia",historia),
                new SqlParameter("aparencia",aparencia),
                new SqlParameter("personalidade",personalidade),
                new SqlParameter("doenca_fobia_mania",doencaManiaFobia),
                new SqlParameter("favoritos",favoritos),
                new SqlParameter("anotacoes",anotacoes),
                new SqlParameter("origem_id",model.OrigemId),
                new SqlParameter("pv_max",model.PontosDeVidaMaximo),
                new SqlParameter("sanidade_max",model.SanidadeMaxima),
                new SqlParameter("pe_max",model.PontosDeEsforcoMaximo),
                new SqlParameter("deslocamento",model.Deslocamento),
                new SqlParameter("patente_id",model.PatenteId),
                new SqlParameter("classe_id",model.ClasseId),
                new SqlParameter("trilha_id",trilha),
                new SqlParameter("forca",model.Forca),
                new SqlParameter("vigor",model.Vigor),
                new SqlParameter("intelecto",model.Intelecto),
                new SqlParameter("presenca",model.Presenca),
                new SqlParameter("agilidade",model.Agilidade),
                new SqlParameter("acrobacia",model.Acrobacia),
                new SqlParameter("adestramento",model.Adestramento),
                new SqlParameter("artes",model.Artes),
                new SqlParameter("atletismo",model.Atletismo),
                new SqlParameter("atualidades",model.Atualidades),
                new SqlParameter("ciencias",model.Ciencias),
                new SqlParameter("crime",model.Crime),
                new SqlParameter("diplomacia",model.Diplomacia),
                new SqlParameter("enganacao",model.Enganacao),
                new SqlParameter("fortitude",model.Fortitude),
                new SqlParameter("furtividade",model.Furtividade),
                new SqlParameter("iniciativa",model.Iniciativa),
                new SqlParameter("intimidacao",model.Intimidacao),
                new SqlParameter("intuicao",model.Intuicao),
                new SqlParameter("investigacao",model.Investigacao),
                new SqlParameter("luta",model.Luta),
                new SqlParameter("medicina",model.Medicina),
                new SqlParameter("ocultismo",model.Ocultismo),
                new SqlParameter("percepcao",model.Percepcao),
                new SqlParameter("pilotagem",model.Pilotagem),
                new SqlParameter("pontaria",model.Pontaria),
                new SqlParameter("profissao",model.Profissao),
                new SqlParameter("reflexos",model.Reflexos),
                new SqlParameter("religiao",model.Religiao),
                new SqlParameter("sobrevivencia",model.Sobrevivencia),
                new SqlParameter("tatica",model.Tatica),
                new SqlParameter("tecnologia",model.Tecnologia),
                new SqlParameter("vontade",model.Vontade)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(PersonagemViewModel model)
        {
            object trilha = model.TrilhaId;
            object doencaManiaFobia = model.DoencaFobiaMania;
            object historia = model.Historia;
            object anotacoes = model.Anotacoes;
            object localNascimento = model.LocalNascimento;
            object aparencia = model.Aparencia;
            object favoritos = model.Favoritos;
            object personalidade = model.Personalidade;

            if (localNascimento == null)
                localNascimento = DBNull.Value;
            if (favoritos == null)
                favoritos = DBNull.Value;
            if (anotacoes == null)
                anotacoes = DBNull.Value;
            if (aparencia == null)
                aparencia = DBNull.Value;
            if (personalidade == null)
                personalidade = DBNull.Value;
            if (doencaManiaFobia == null)
                doencaManiaFobia = DBNull.Value;
            if (historia == null)
                historia = DBNull.Value;
            if (trilha == null)
                trilha = DBNull.Value;

            model.PontosDeVidaAtual = model.PontosDeVidaMaximo;
            model.PontosDeEsforcoAtual = model.PontosDeEsforcoMaximo;
            model.SanidadeAtual = model.SanidadeMaxima;

            SqlParameter[] parametros =
            {
                new SqlParameter("nome",model.Nome),
                new SqlParameter("personalidade",personalidade),
                new SqlParameter("nex",model.Nex),
                new SqlParameter("deslocamento",model.Deslocamento),
                new SqlParameter("anotacoes",anotacoes),
                new SqlParameter("aparencia",aparencia),
                new SqlParameter("classe_id",model.ClasseId),
                new SqlParameter("doenca_fobia_mania",doencaManiaFobia),
                new SqlParameter("favoritos",favoritos),
                new SqlParameter("local_nascimento",localNascimento),
                new SqlParameter("origem_id",model.OrigemId),
                new SqlParameter("patente_id",model.PatenteId),
                new SqlParameter("historia",historia),
                new SqlParameter("idade",model.Idade),
                new SqlParameter("pe_atual",model.PontosDeEsforcoAtual),
                new SqlParameter("pe_max",model.PontosDeEsforcoMaximo),
                new SqlParameter("sanidade_atual",model.SanidadeAtual),
                new SqlParameter("sanidade_max",model.SanidadeMaxima),
                new SqlParameter("pv_max",model.PontosDeVidaMaximo),
                new SqlParameter("pv_atual",model.PontosDeVidaAtual),
                new SqlParameter("trilha_id",trilha),
                new SqlParameter("usuario_id",model.UsuarioId),
                new SqlParameter("forca",model.Forca),
                new SqlParameter("agilidade",model.Agilidade),
                new SqlParameter("intelecto",model.Intelecto),
                new SqlParameter("vigor",model.Vigor),
                new SqlParameter("presenca",model.Presenca),
                new SqlParameter("acrobacia",model.Acrobacia),
                new SqlParameter("adestramento",model.Adestramento),
                new SqlParameter("artes",model.Artes),
                new SqlParameter("atletismo",model.Atletismo),
                new SqlParameter("atualidades",model.Atualidades),
                new SqlParameter("ciencias",model.Ciencias),
                new SqlParameter("crime",model.Crime),
                new SqlParameter("diplomacia",model.Diplomacia),
                new SqlParameter("enganacao",model.Enganacao),
                new SqlParameter("fortitude",model.Fortitude),
                new SqlParameter("furtividade",model.Furtividade),
                new SqlParameter("iniciativa",model.Iniciativa),
                new SqlParameter("intimidacao",model.Intimidacao),
                new SqlParameter("intuicao",model.Intuicao),
                new SqlParameter("investigacao",model.Investigacao),
                new SqlParameter("luta",model.Luta),
                new SqlParameter("medicina",model.Medicina),
                new SqlParameter("ocultismo",model.Ocultismo),
                new SqlParameter("percepcao",model.Percepcao),
                new SqlParameter("pilotagem",model.Pilotagem),
                new SqlParameter("pontaria",model.Pontaria),
                new SqlParameter("profissao",model.Profissao),
                new SqlParameter("reflexos",model.Reflexos),
                new SqlParameter("religiao",model.Religiao),
                new SqlParameter("sobrevivencia",model.Sobrevivencia),
                new SqlParameter("tatica",model.Tatica),
                new SqlParameter("tecnologia",model.Tecnologia),
                new SqlParameter("vontade",model.Vontade)
            };
            return parametros;
        }

        protected override PersonagemViewModel MontaModel(DataRow registro)
        {
            var model = new PersonagemViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                ClasseId = Convert.ToInt32(registro["classe_id"]),
                Idade = Convert.ToInt16(registro["idade"]),
                PontosDeVidaMaximo = Convert.ToInt16(registro["pv_max"]),
                PontosDeVidaAtual = Convert.ToInt16(registro["pv_atual"]),
                SanidadeMaxima = Convert.ToInt16(registro["sanidade_max"]),
                SanidadeAtual = Convert.ToInt16(registro["sanidade_atual"]),
                PontosDeEsforcoMaximo = Convert.ToInt16(registro["pe_max"]),
                PontosDeEsforcoAtual = Convert.ToInt16(registro["pe_atual"]),
                Deslocamento = Convert.ToInt16(registro["deslocamento"]),
                Nex = Convert.ToInt16(registro["nex"]),
                OrigemId = Convert.ToInt32(registro["origem_id"]),
                PatenteId = Convert.ToInt32(registro["patente_id"]),
                Agilidade = Convert.ToInt16(registro["agilidade"]),
                Forca = Convert.ToInt16(registro["forca"]),
                Vigor = Convert.ToInt16(registro["vigor"]),
                Presenca = Convert.ToInt16(registro["presenca"]),
                Intelecto = Convert.ToInt16(registro["intelecto"]),
                Acrobacia = Convert.ToInt16(registro["acrobacia"]),
                Adestramento = Convert.ToInt16(registro["adestramento"]),
                Artes = Convert.ToInt16(registro["artes"]),
                Atletismo = Convert.ToInt16(registro["atletismo"]),
                Atualidades = Convert.ToInt16(registro["atualidades"]),
                Ciencias = Convert.ToInt16(registro["ciencias"]),
                Crime = Convert.ToInt16(registro["crime"]),
                Diplomacia = Convert.ToInt16(registro["diplomacia"]),
                Enganacao = Convert.ToInt16(registro["enganacao"]),
                Fortitude = Convert.ToInt16(registro["fortitude"]),
                Furtividade = Convert.ToInt16(registro["furtividade"]),
                Iniciativa = Convert.ToInt16(registro["iniciativa"]),
                Intimidacao = Convert.ToInt16(registro["intimidacao"]),
                Intuicao = Convert.ToInt16(registro["intuicao"]),
                Investigacao = Convert.ToInt16(registro["investigacao"]),
                Luta = Convert.ToInt16(registro["luta"]),
                Medicina = Convert.ToInt16(registro["medicina"]),
                Ocultismo = Convert.ToInt16(registro["ocultismo"]),
                Percepcao = Convert.ToInt16(registro["percepcao"]),
                Pilotagem = Convert.ToInt16(registro["pilotagem"]),
                Pontaria = Convert.ToInt16(registro["pontaria"]),
                Profissao = Convert.ToInt16(registro["profissao"]),
                Reflexos = Convert.ToInt16(registro["reflexos"]),
                Religiao = Convert.ToInt16(registro["religiao"]),
                Sobrevivencia = Convert.ToInt16(registro["sobrevivencia"]),
                Tatica = Convert.ToInt16(registro["tatica"]),
                Tecnologia = Convert.ToInt16(registro["tecnologia"]),
                Vontade = Convert.ToInt16(registro["vontade"]),
                UsuarioId = Convert.ToInt32(registro["usuario_id"])
            };

            if (registro["anotacoes"] != DBNull.Value)
                model.Anotacoes = registro["anotacoes"].ToString();
            if (registro["aparencia"] != DBNull.Value)
                model.Aparencia = registro["aparencia"].ToString();
            if (registro["doenca_fobia_mania"] != DBNull.Value)
                model.DoencaFobiaMania = registro["doenca_fobia_mania"].ToString();
            if (registro["favoritos"] != DBNull.Value)
                model.Favoritos = registro["favoritos"].ToString();
            if (registro["historia"] != DBNull.Value)
                model.Historia = registro["historia"].ToString();
            if (registro["trilha_id"] != DBNull.Value)
                model.TrilhaId = Convert.ToInt32(registro["trilha_id"]);
            if (registro["local_nascimento"] != DBNull.Value)
                model.LocalNascimento = registro["local_nascimento"].ToString();
            if (registro["personalidade"] != DBNull.Value)
                model.Personalidade = registro["personalidade"].ToString();


            return model;
        }

        public List<PersonagemViewModel> ListarPersonagensPorUsuario(int usuarioId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("id", usuarioId),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaPersonagens", parametro);
            var lista = new List<PersonagemViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        public List<short> ListarValoresDePericias(int personagemId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("id", personagemId)
            };

            var listaDeValores = new List<short>();
            DataTable pericias = HelperDAO.ExecutaProcedureSelect("spRetornaPericias", parametro);

            if (pericias.Rows.Count == 0)
            {
                return null;
            }
            else
            {
                object[] linha = pericias.Rows[0].ItemArray;

                for (int i = 0; i < linha.Length; i++)
                {
                    listaDeValores.Add(Convert.ToInt16(linha[i]));
                }
                return listaDeValores;
            }
        }
        public List<string> ListarNomesDePericias(int personagemId)
        {

            var parametro = new SqlParameter[]
            {
                new SqlParameter("id", personagemId)
            };

            var listaDeNomes = new List<string>();
            DataTable pericias = HelperDAO.ExecutaProcedureSelect("spRetornaPericias", parametro);

            if (pericias.Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataColumnCollection colunas = pericias.Columns;

                for (int i = 1; i < colunas.Count; i++)
                {
                    listaDeNomes.Add(colunas[i].ColumnName);
                }
                return listaDeNomes;
            }

        }
        protected override void SetTabela()
        {
            Tabela = "Personagem";
        }
      
        public void UpdateVida(PersonagemViewModel model)
        {
            var parametros = new SqlParameter[]
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("vida",model.PontosDeVidaAtual)
            };
            HelperDAO.ExecutaProcedure("spUpdate_Vida", parametros);

        }
        public void UpdateSanidade(PersonagemViewModel model)
        {
            var parametros = new SqlParameter[]
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("sanidade",model.SanidadeAtual)
            };
            HelperDAO.ExecutaProcedure("spUpdate_Sanidade", parametros);

        }
        public void UpdatePontosDeEsforco(PersonagemViewModel model)
        {
            var parametros = new SqlParameter[]
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("pe",model.PontosDeEsforcoAtual)
            };
            HelperDAO.ExecutaProcedure("spUpdate_Pe", parametros);

        }
    }
}
