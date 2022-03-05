#define TAG bork_suomipuhe
#define DOUBLES(var1,var2) var1##_##var2
#define TRIPLES(var1,var2,var3) var1##_##var2##_##var3
#define TAGGED(var1) DOUBLES(TAG,var1)
#define FUNC(var) TRIPLES(TAG,fnc,var)
#define QUOTE(var) #var
#define FACTION_FIN QUOTE(ffp_finland)
