-- View: rl_esus."TIPO_CONSULT_ODONTO_MES"

DROP VIEW if exists rl_esus."TIPO_CONSULT_ODONTO_MES";

CREATE OR REPLACE VIEW rl_esus."TIPO_CONSULT_ODONTO_MES" AS 
 SELECT tb_dim_municipio.no_municipio,
    uu.nu_cnes,
    uu.no_unidade_saude,
    pp.nu_cns,
    pp.no_profissional,
    cc.no_cbo,
    cc.nu_cbo,
    tt.nu_ano,
    tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto,
    count(
        CASE
            WHEN tt.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS atendimento_jan,
    count(
        CASE
            WHEN tt.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS atendimento_fev,
    count(
        CASE
            WHEN tt.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS atendimento_mar,
    count(
        CASE
            WHEN tt.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS atendimento_abr,
    count(
        CASE
            WHEN tt.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS atendimento_mai,
    count(
        CASE
            WHEN tt.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS atendimento_jun,
    count(
        CASE
            WHEN tt.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS atendimento_jul,
    count(
        CASE
            WHEN tt.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS atendimento_ago,
    count(
        CASE
            WHEN tt.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS atendimento_set,
    count(
        CASE
            WHEN tt.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS atendimento_out,
    count(
        CASE
            WHEN tt.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS atendimento_nov,
    count(
        CASE
            WHEN tt.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS atendimento_dez
   FROM tb_fat_atendimento_odonto
     JOIN tb_dim_profissional pp ON tb_fat_atendimento_odonto.co_dim_profissional_1 = pp.co_seq_dim_profissional
     JOIN tb_dim_tempo tt ON tb_fat_atendimento_odonto.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_cbo cc ON tb_fat_atendimento_odonto.co_dim_cbo_1 = cc.co_seq_dim_cbo
     JOIN tb_dim_municipio ON tb_fat_atendimento_odonto.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
     JOIN tb_dim_unidade_saude uu ON tb_fat_atendimento_odonto.co_dim_unidade_saude_1 = uu.co_seq_dim_unidade_saude
     JOIN tb_dim_tipo_consulta_odonto ON tb_fat_atendimento_odonto.co_dim_tipo_consulta = tb_dim_tipo_consulta_odonto.co_seq_dim_tipo_cnsulta_odonto
  WHERE cc.nu_cbo::text = '223293'::text
  GROUP BY tb_dim_municipio.no_municipio, tb_dim_tipo_consulta_odonto.ds_tipo_consulta_odonto, uu.no_unidade_saude, pp.nu_cns, pp.no_profissional, cc.nu_cbo, cc.no_cbo, tt.nu_ano, uu.nu_cnes;

ALTER TABLE rl_esus."TIPO_CONSULT_ODONTO_MES"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."TIPO_CONSULT_ODONTO_MES" TO postgres;
GRANT ALL ON TABLE rl_esus."TIPO_CONSULT_ODONTO_MES" TO pmaq;
GRANT ALL ON TABLE rl_esus."TIPO_CONSULT_ODONTO_MES" TO relatorio;
