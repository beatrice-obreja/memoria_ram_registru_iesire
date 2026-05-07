 Descriere
Acest proiect implementează o memorie RAM Dual-Port în SystemVerilog. Designul este optimizat pentru stabilitate prin utilizarea unui registru pe portul de ieșire, eliminând riscul de "glitch-uri" de sincronizare.

 Specificații Tehnice
Capacitate: 64 locații x 8 biți.

Arhitectură: Porturi separate pentru adresa de citire și scriere.

Sincronizare: Toate operațiile au loc pe frontul crescător al ceasului (posedge clock).

Latență: 1 ciclu de ceas la citire (datorită registrului de ieșire).

Fișiere
ram_reg_iesire.sv: Codul sursă.

tb_ram_reg_iesire.sv: Testbench pentru simulare.

simulare_mem_ram_registru_iesire.jpeg: Rezultatul simulării în Vivado.

Simulare (Vivado)
Simularea confirmă logica de scriere (we) și faptul că datele sunt disponibile la ieșire cu o latență de un ciclu de ceas, conform specificațiilor.
