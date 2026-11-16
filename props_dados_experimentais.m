function props = props_dados_experimentais()

[Tb, Tc, Pc, omega] = dados_experimentais();

  props = struct();

  props.Tb = Tb;
  props.Tc = Tc;
  props.Pc = Pc;
  props.omega = omega;

end