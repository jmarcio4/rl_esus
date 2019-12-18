-- View: rl_esus."INCONSISTENCIAS"

DROP VIEW if exists rl_esus."INCONSISTENCIAS";

CREATE OR REPLACE VIEW rl_esus."INCONSISTENCIAS" AS 
 SELECT ( SELECT count(*) AS count
           FROM tb_fat_cidadao_pec tb_fat_cidadao_pec
             JOIN tb_fat_cidadao_territorio tb_fat_cidadao_territorio ON tb_fat_cidadao_territorio.co_fat_cidadao_pec = tb_fat_cidadao_pec.co_seq_fat_cidadao_pec
             LEFT JOIN tb_fat_cidadao_territorio tbfatcidadaoterritorioresp ON tb_fat_cidadao_territorio.co_fat_ciddo_terrtrio_resp = tbfatcidadaoterritorioresp.co_seq_fat_cidadao_territorio
             LEFT JOIN tb_fat_cidadao_pec tbfatcidadaopecresponsavel ON tbfatcidadaoterritorioresp.co_fat_cidadao_pec = tbfatcidadaopecresponsavel.co_seq_fat_cidadao_pec
             LEFT JOIN tb_fat_familia_territorio tb_fat_familia_territorio ON tb_fat_familia_territorio.co_seq_fat_familia_territorio = tb_fat_cidadao_territorio.co_fat_familia_territorio
             LEFT JOIN tb_dim_equipe tb_dim_equipe ON tb_dim_equipe.co_seq_dim_equipe = tb_fat_cidadao_territorio.co_dim_equipe
             LEFT JOIN tb_dim_unidade_saude tb_dim_unidade_saude ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = tb_fat_cidadao_territorio.co_dim_unidade_saude
             LEFT JOIN tb_dim_tempo tb_dim_tempo ON tb_fat_cidadao_pec.co_dim_tempo_nascimento = tb_dim_tempo.co_seq_dim_tempo
          WHERE (tb_fat_cidadao_territorio.st_cidadao_consistente = 0 OR tbfatcidadaoterritorioresp.st_cidadao_consistente = 0) AND (tbfatcidadaoterritorioresp.co_seq_fat_cidadao_territorio IS NOT NULL AND tbfatcidadaoterritorioresp.st_mudou_se = 1 AND tb_fat_cidadao_territorio.st_responsavel = 0 OR tbfatcidadaoterritorioresp.co_seq_fat_cidadao_territorio IS NOT NULL AND tbfatcidadaoterritorioresp.st_vivo = 0 AND tb_fat_cidadao_territorio.st_responsavel = 0 OR tb_fat_cidadao_territorio.st_responsavel_informado = 0 AND tb_fat_cidadao_territorio.st_responsavel = 0 OR tb_fat_cidadao_territorio.co_fat_familia_territorio IS NULL AND tb_fat_cidadao_territorio.st_vivo = 1 AND tb_fat_cidadao_territorio.st_mudou_se = 0 AND tb_fat_cidadao_territorio.co_fat_cad_individual IS NOT NULL)) AS total_inconsistencias;

ALTER TABLE rl_esus."INCONSISTENCIAS"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."INCONSISTENCIAS" TO postgres;
GRANT ALL ON TABLE rl_esus."INCONSISTENCIAS" TO pmaq;
GRANT ALL ON TABLE rl_esus."INCONSISTENCIAS" TO relatorio;
