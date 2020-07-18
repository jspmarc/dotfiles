static const char norm_fg[] = "#f1efee";
static const char norm_bg[] = "#1b1918";
static const char norm_border[] = "#766e6b";

static const char sel_fg[] = "#f1efee";
static const char sel_bg[] = "#7b9726";
static const char sel_border[] = "#f1efee";

static const char urg_fg[] = "#f1efee";
static const char urg_bg[] = "#f22c40";
static const char urg_border[] = "#f22c40";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
