library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_logical_iff is
  port (
    clk : in std_logic
  );
end entity psl_logical_iff;


architecture psl of psl_logical_iff is

  signal a, b, c : std_logic;

  -- All is sensitive to rising edge of clk
  default clock is rising_edge(clk);

begin


  --                              01234567890
  SEQ_A : sequencer generic map ("_-__-___-__") port map (clk, a);
  SEQ_B : sequencer generic map ("_-______-__") port map (clk, b);
  SEQ_C : sequencer generic map ("_-__-______") port map (clk, c);


  -- This assertion holds
  IFF_0_a : assert always (a <-> b);



  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
