library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_eventually is
  port (
    clk : in std_logic
  );
end entity psl_eventually;


architecture psl of psl_eventually is

  signal a, b : std_logic;

begin


  --                              0123456789012345
  SEQ_A : sequencer generic map ("__-__-____-_____") port map (clk, a);
  SEQ_B : sequencer generic map ("_______-______-_") port map (clk, b);


  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

  -- This assertion holds
  EVENTUALLY_a : assert always (a -> eventually! b);


end architecture psl;
