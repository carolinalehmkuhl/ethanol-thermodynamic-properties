function props = props_constantinou_gani()

[Tb, Tc, Pc, omega] = constantinou_gani();

  props = struct();

  props.Tb = Tb;
  props.Tc = Tc;
  props.Pc = Pc;
  props.omega = omega;

end