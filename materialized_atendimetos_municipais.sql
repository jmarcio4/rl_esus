-- Materialized View: rl_esus."ATENDIMENTOS_MUNICIPAL"

DROP MATERIALIZED VIEW if exists rl_esus."ATENDIMENTOS_MUNICIPAL";

CREATE MATERIALIZED VIEW rl_esus."ATENDIMENTOS_MUNICIPAL" AS 
 SELECT tb_dim_municipio.no_municipio,
    tb_dim_tempo.nu_ano,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS puerijan,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS puerifev,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS puerimar,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS pueriabr,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS puerimai,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS puerijun,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS puerijul,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS pueriago,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS pueriset,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS pueriout,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS puerinov,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'PUERICULTURA%'::text AND tb_dim_tempo.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS pueridez,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS prejan,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS prefev,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS premar,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS preabr,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS premai,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS prejun,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS prejul,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS preago,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS preset,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS preout,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS prenov,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'GRAVIDEZ%'::text AND tb_dim_tempo.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) + count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text = 'PRÉ-NATAL'::text AND tb_dim_tempo.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS predez,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS diabetesjan,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS diabetesfev,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS diabetesmar,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS diabetesabr,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS diabetesmai,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS diabetesjun,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS diabetesjul,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS diabetesago,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS diabetesset,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS diabetesout,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS diabetesnov,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'DIABETES%'::text AND tb_dim_tempo.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS diabetesdez,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS hiperjan,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS hiperfev,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS hipermar,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS hiperabr,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS hipermai,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS hiperjun,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS hiperjul,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS hiperago,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS hiperset,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS hiperout,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS hipernov,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'HIPERTENSÃO%'::text AND tb_dim_tempo.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS hiperdez,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 1 THEN 1
            ELSE NULL::integer
        END) AS obesidadejan,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 2 THEN 1
            ELSE NULL::integer
        END) AS obesidadefev,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 3 THEN 1
            ELSE NULL::integer
        END) AS obesidademar,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 4 THEN 1
            ELSE NULL::integer
        END) AS obesidadeabr,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 5 THEN 1
            ELSE NULL::integer
        END) AS obesidademai,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 6 THEN 1
            ELSE NULL::integer
        END) AS obesidadejun,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 7 THEN 1
            ELSE NULL::integer
        END) AS obesidadejul,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 8 THEN 1
            ELSE NULL::integer
        END) AS obesidadeago,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 9 THEN 1
            ELSE NULL::integer
        END) AS obesidadeset,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 10 THEN 1
            ELSE NULL::integer
        END) AS obesidadeout,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 11 THEN 1
            ELSE NULL::integer
        END) AS obesidadenov,
    count(
        CASE
            WHEN tb_dim_ciap.no_ciap::text ~~ 'OBESIDADE%'::text AND tb_dim_tempo.nu_mes = 12 THEN 1
            ELSE NULL::integer
        END) AS obesidadedez,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 1 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_jan,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 2 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_fev,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 3 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_mar,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 4 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_abr,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 5 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_mai,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 6 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_jun,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 7 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_jul,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 8 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_ago,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 9 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_set,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 10 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_out,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 11 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_nov,
    ( SELECT count(
                CASE
                    WHEN tb_dim_local_atendimento.ds_local_atendimento::text = 'Domicílio'::text AND t.nu_mes = 12 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_local_atendimento ON tb_fat_atendimento_individual.co_dim_local_atendimento = tb_dim_local_atendimento.co_seq_dim_local_atendimento
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS domi_dez,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 1 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_jan,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 2 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_fev,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 3 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_mar,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 4 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_abr,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 5 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_mai,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 6 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_jun,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 7 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_jul,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 8 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_ago,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 9 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_set,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 10 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_out,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 11 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_nov,
    ( SELECT count(
                CASE
                    WHEN t.nu_mes = 12 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS atendimento_dez,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 1 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_jan,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 2 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_fev,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 3 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_mar,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 4 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_abr,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 5 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_mai,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 6 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_jun,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 7 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_jul,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 8 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_ago,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 9 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_set,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 10 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_out,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 11 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_nov,
    ( SELECT count(
                CASE
                    WHEN tb_fat_atendimento_individual.st_encaminhamento_serv_special = 1 AND t.nu_mes = 12 THEN 1
                    ELSE NULL::integer
                END) AS count
           FROM tb_fat_atendimento_individual
             JOIN tb_dim_tempo t ON tb_fat_atendimento_individual.co_dim_tempo = t.co_seq_dim_tempo
             JOIN tb_dim_municipio tb_dim_municipio_1 ON tb_fat_atendimento_individual.co_dim_municipio = tb_dim_municipio_1.co_seq_dim_municipio
             JOIN tb_dim_tipo_atendimento ON tb_fat_atendimento_individual.co_dim_tipo_atendimento = tb_dim_tipo_atendimento.co_seq_dim_tipo_atendimento
          WHERE tb_dim_municipio_1.no_municipio::text = tb_dim_municipio.no_municipio::text AND tb_dim_tempo.nu_ano = t.nu_ano) AS encaminha_dez
   FROM tb_fat_atd_ind_problemas
     JOIN tb_dim_ciap ON tb_fat_atd_ind_problemas.co_dim_ciap = tb_dim_ciap.co_seq_dim_ciap
     JOIN tb_dim_tempo ON tb_fat_atd_ind_problemas.co_dim_tempo = tb_dim_tempo.co_seq_dim_tempo
     JOIN tb_dim_municipio ON tb_fat_atd_ind_problemas.co_dim_municipio = tb_dim_municipio.co_seq_dim_municipio
  GROUP BY tb_dim_municipio.no_municipio, tb_dim_tempo.nu_ano
WITH DATA;

ALTER TABLE rl_esus."ATENDIMENTOS_MUNICIPAL"
  OWNER TO postgres;
GRANT ALL ON TABLE rl_esus."ATENDIMENTOS_MUNICIPAL" TO postgres;
GRANT ALL ON TABLE rl_esus."ATENDIMENTOS_MUNICIPAL" TO pmaq;
GRANT ALL ON TABLE rl_esus."ATENDIMENTOS_MUNICIPAL" TO relatorio;
