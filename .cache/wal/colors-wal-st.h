const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1b1918", /* black   */
  [1] = "#f22c40", /* red     */
  [2] = "#7b9726", /* green   */
  [3] = "#c38418", /* yellow  */
  [4] = "#407ee7", /* blue    */
  [5] = "#6666ea", /* magenta */
  [6] = "#3d97b8", /* cyan    */
  [7] = "#a8a19f", /* white   */

  /* 8 bright colors */
  [8]  = "#766e6b",  /* black   */
  [9]  = "#f22c40",  /* red     */
  [10] = "#7b9726", /* green   */
  [11] = "#c38418", /* yellow  */
  [12] = "#407ee7", /* blue    */
  [13] = "#6666ea", /* magenta */
  [14] = "#3d97b8", /* cyan    */
  [15] = "#f1efee", /* white   */

  /* special colors */
  [256] = "#1b1918", /* background */
  [257] = "#a8a19f", /* foreground */
  [258] = "#a8a19f",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
