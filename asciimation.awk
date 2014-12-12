#!/usr/bin/awk -f
BEGIN {
  DELAY_TIME=1;
  LINES_PER_FRAME=14;
}

{
  if (0 == (FNR - 1) % LINES_PER_FRAME) {
    rc = system("sleep "DELAY_TIME);
    if (rc) {
      exit rc
    }
    DELAY_TIME=(0.06 * $1.0);
    printf "\x1b[2J\n"; 
  } else {
    print $0
  }
}

