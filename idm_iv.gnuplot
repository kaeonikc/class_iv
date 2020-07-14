#!/usr/bin/env gnuplot

set log x
set xlabel 'a'
set yrange [0:1.05]
set xrange [1e-8:2]
set key b l

# set terminal postscript
# set output  'idm_iv_plot.ps'

plot 'output/idm_iv_lcdm_background.dat' u (1/($1+1)):(($9+$13)/$14) w l lw 3 lc rgb 'red' t 'Omega_r (LCDM)', \
'output/idm_iv_lcdm_background.dat' u (1/($1+1)):(($10+$11)/$14) w l lw 3 lc rgb 'green' t 'Omega_m (LCDM)', \
'output/idm_iv_lcdm_background.dat' u (1/($1+1)):($12/$14) w l lw 3 lc rgb 'blue' t 'Omega_{de} (LCDM)', \
'output/idm_iv_separate_background.dat' u (1/($1+1)):(($9+$12)/$15) w l lw 1 lc rgb 'red' t 'Omega_r (IV sep)', \
'output/idm_iv_separate_background.dat' u (1/($1+1)):(($10+$11+$14)/$15) w l lw 1 lc rgb 'green' t 'Omega_m (IV sep)', \
'output/idm_iv_separate_background.dat' u (1/($1+1)):(($13)/$15) w l lw 1 lc rgb 'blue' t 'Omega_{de} (IV sep)'

pause -1
