-- View: rl_esus."VISITA_FAMILIAR"

DROP VIEW if exists rl_esus."VISITA_FAMILIAR";

CREATE OR REPLACE VIEW rl_esus."VISITA_FAMILIAR" AS 
 SELECT tb_cds_prof.nu_cnes,
    ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))) AS no_municipio,
    tb_dim_unidade_saude.no_unidade_saude,
    tb_cds_prof.nu_cns,
    pp.no_profissional AS no_pessoa_fisica,
    tb_cbo.co_cbo_2002,
    tb_cbo.no_cbo,
    tb_cds_visita_domiciliar.nu_prontuario,
    to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'YYYY-MM'::text) AS comp,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '01'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_1,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '02'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_2,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '03'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_3,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '04'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_4,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '05'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_5,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '06'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_6,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '07'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_7,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '08'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_8,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '09'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_9,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '10'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_10,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '11'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_11,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '12'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_12,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '13'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_13,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '14'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_14,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '15'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_15,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '16'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_16,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '17'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_17,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '18'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_18,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '19'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_19,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '20'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_20,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '21'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_21,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '22'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_22,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '23'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_23,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '24'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_24,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '25'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_25,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '26'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_26,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '27'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_27,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '28'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_28,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '29'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_29,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '30'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_30,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '31'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS dia_31,
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '01'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '02'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '03'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '04'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '05'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '06'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '07'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '08'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '09'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '10'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '11'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '12'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '13'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '14'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '15'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '16'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '17'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '18'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '19'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '20'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '21'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '22'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '23'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '24'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '25'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '26'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '27'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '28'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '29'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '30'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END +
        CASE
            WHEN count(
            CASE
                WHEN to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'DD'::text) = '31'::text THEN 1
                ELSE NULL::integer
            END) >= 1 THEN 1
            ELSE 0
        END AS familias
   FROM tb_cds_visita_domiciliar
     LEFT JOIN tb_cds_ficha_visita_domiciliar ON tb_cds_visita_domiciliar.co_cds_ficha_visita_domiciliar = tb_cds_ficha_visita_domiciliar.co_seq_cds_ficha_visita_dom
     LEFT JOIN tb_cds_prof ON tb_cds_ficha_visita_domiciliar.co_cds_prof = tb_cds_prof.co_seq_cds_prof
     LEFT JOIN tb_dim_unidade_saude ON tb_cds_prof.nu_cnes::text = tb_dim_unidade_saude.nu_cnes::text
     JOIN tb_dim_profissional pp ON tb_cds_prof.nu_cns::text = pp.nu_cns::text
     JOIN tb_cbo ON tb_cds_prof.nu_cbo_2002::text = tb_cbo.co_cbo_2002::text
  WHERE tb_cds_visita_domiciliar.nu_prontuario IS NOT NULL
  GROUP BY ( SELECT tb_localidade.no_localidade AS no_municipio
           FROM tb_localidade
          WHERE tb_localidade.co_localidade = (( SELECT tb_adm_municipal.co_localidade
                   FROM tb_adm_municipal
                 LIMIT 1))), tb_cbo.co_cbo_2002, tb_cbo.no_cbo, tb_cds_visita_domiciliar.nu_prontuario, tb_cds_prof.nu_cnes, tb_dim_unidade_saude.no_unidade_saude, tb_cds_prof.nu_cns, pp.no_profissional, to_char(tb_cds_ficha_visita_domiciliar.dt_ficha, 'YYYY-MM'::text)
  ORDER BY tb_cds_prof.nu_cnes, tb_cds_prof.nu_cns, tb_cds_visita_domiciliar.nu_prontuario;

ALTER TABLE rl_esus."VISITA_FAMILIAR"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."VISITA_FAMILIAR" TO postgres;
GRANT ALL ON TABLE rl_esus."VISITA_FAMILIAR" TO pmaq;
GRANT ALL ON TABLE rl_esus."VISITA_FAMILIAR" TO relatorio;
