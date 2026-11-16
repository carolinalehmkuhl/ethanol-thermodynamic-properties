function props = props_jap()

[Tb, Tc, Pc] = joback();
Pr_sat = antoine(Tc, Pc);
omega = pitzer(Pr_sat);
  
  props = struct();

  props.Tb = Tb;
  props.Tc = Tc;
  props.Pc = Pc;
  props.omega = omega;

end