-- View: rl_esus."ATEND_ODONTO_GRAFICO_MES"

DROP VIEW if exists rl_esus."ATEND_ODONTO_GRAFICO_MES";

CREATE OR REPLACE VIEW rl_esus."ATEND_ODONTO_GRAFICO_MES" AS 
 SELECT 'ATENDIMENTO POR PESSOA ODONTOLOGICO' AS odonto,
    cc.nu_cbo,
    to_date((tt.nu_ano || '-'::text) || tt.nu_mes, 'yyyy-MM'::text) AS data,
    count(*) AS count
   FROM tb_fat_atendimento_odonto
     JOIN tb_dim_tempo tt ON tb_fat_atendimento_odonto.co_dim_tempo = tt.co_seq_dim_tempo
     JOIN tb_dim_cbo cc ON tb_fat_atendimento_odonto.co_dim_cbo_1 = cc.co_seq_dim_cbo
     JOIN tb_dim_profissional p ON tb_fat_atendimento_odonto.co_dim_profissional_1 = p.co_seq_dim_profissional
     JOIN tb_dim_municipio ON tb_fat_atendimento_odonto.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
  GROUP BY to_date((tt.nu_ano || '-'::text) || tt.nu_mes, 'yyyy-MM'::text), cc.nu_cbo;

ALTER TABLE rl_esus."ATEND_ODONTO_GRAFICO_MES"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."ATEND_ODONTO_GRAFICO_MES" TO postgres;
GRANT ALL ON TABLE rl_esus."ATEND_ODONTO_GRAFICO_MES" TO pmaq;
GRANT ALL ON TABLE rl_esus."ATEND_ODONTO_GRAFICO_MES" TO relatorio;
