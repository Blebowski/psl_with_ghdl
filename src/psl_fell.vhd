library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity psl_fell is
  port (
    clk : in std_logic
  );
end entity psl_fell;


architecture psl of psl_fell is

  signal a, b, c : std_logic;

  signal vect : std_logic_vector(7 downto 0);

  default clock is rising_edge(clk);

begin

  --                              01234567890
  SEQ_A : sequencer generic map ("--__-_---__") port map (clk, a);
  SEQ_B : sequencer generic map ("_-__-_---__") port map (clk, b);
  SEQ_C : sequencer generic map ("__-__-___-_") port map (clk, c);

  -- This assertion doesn't in formal tests
  -- in the 1st cycle. Problem is the value of
  -- a in the 0th cycle. So fell() can be safely
  -- used from the 2nd cycle on only
  FELL_5_a : assert never (fell(b));

  -- Stop simulation after longest running sequencer is finished
  -- Simulation only code by using pragmas
  -- synthesis translate_off
  stop_sim(clk, 11);
  -- synthesis translate_on


end architecture psl;
