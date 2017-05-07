Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:54741 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752739AbdEGX0B (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 19:26:01 -0400
Subject: Re: [PATCH v2] Fix ctype(3) usage in the kconfig code on NetBSD
References: <1457397085-10907-1-git-send-email-n54@gmx.com>
 <20170507134422.2666-1-n54@gmx.com>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <b2a75122-5762-542e-14b8-c6ef459b0825@gmx.com>
Date: Sun, 7 May 2017 15:59:36 +0200
MIME-Version: 1.0
In-Reply-To: <20170507134422.2666-1-n54@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="J8ieRP69BGcNMte3M6E4GNjx3SjVlJD22"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J8ieRP69BGcNMte3M6E4GNjx3SjVlJD22
Content-Type: multipart/mixed; boundary="X34L2ks919qmJGeElVUoow6NjWhsGnVd4";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr
Message-ID: <b2a75122-5762-542e-14b8-c6ef459b0825@gmx.com>
Subject: Re: [PATCH v2] Fix ctype(3) usage in the kconfig code on NetBSD
References: <1457397085-10907-1-git-send-email-n54@gmx.com>
 <20170507134422.2666-1-n54@gmx.com>
In-Reply-To: <20170507134422.2666-1-n54@gmx.com>

--X34L2ks919qmJGeElVUoow6NjWhsGnVd4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

I've rebased the patch to the current HEAD.

This is general yearly PING...

On 07.05.2017 15:44, Kamil Rytarowski wrote:
> The current code produces set of warnings on NetBSD-7.99.25 (GCC 4.8.5)=
:
>=20
> In file included from scripts/kconfig/zconf.tab.c:2576:0:
> scripts/kconfig/confdata.c: In function 'conf_expand_value':
> scripts/kconfig/confdata.c:97:3:
> warning: array subscript has type 'char' [-Wchar-subscripts]
>    while (isalnum(*src) || *src =3D=3D '_')
>    ^
> scripts/kconfig/confdata.c: In function 'conf_set_sym_val':
> scripts/kconfig/confdata.c:155:4:
> warning: array subscript has type 'char' [-Wchar-subscripts]
>     for (p2 =3D p; *p2 && !isspace(*p2); p2++)
>     ^
> scripts/kconfig/confdata.c: In function 'tristate_print_symbol':
> scripts/kconfig/confdata.c:617:3:
> warning: array subscript has type 'char' [-Wchar-subscripts]
>    fprintf(fp, "%s%s=3D%c\n", CONFIG_, sym->name, (char)toupper(*value)=
);
>    ^
>=20
> Fix this portability issue by explicit casting to unsigned char.
>=20
>  CAVEATS
>   The first argument of these functions is of type int, but only a very=

>   restricted subset of values are actually valid.  The argument must ei=
ther
>   be the value of the macro EOF (which has a negative value), or must b=
e a
>   non-negative value within the range representable as unsigned char.
>   Passing invalid values leads to undefined behavior.
>=20
>   --- The NetBSD ctype(3) man-page
>=20
>   This behavior is POSIX and Standard C:
>=20
>   The c argument is an int, the value of which the application shall en=
sure
>   is a character representable as an unsigned char or equal to the valu=
e of
>   the macro EOF. If the argument has any other value, the behavior is
>   undefined.
>=20
>     -- The Open Group Base Specifications Issue 6
>        IEEE Std 1003.1, 2004 Edition
>=20
>   The header declares several functions useful for classifying and mapp=
ing
>   characters In all cases the argument is an int, the value of which sh=
all
>   be representable as an unsigned char or shall equal the value of the
>   macro EOF. If the argument has any other value, the behavior is
>   undefined.
>=20
>     -- C11 standard 7.4 Character handling <ctype.h> paragraph 1
>=20
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
> ---
>  scripts/basic/fixdep.c               |  2 +-
>  scripts/kconfig/conf.c               |  6 +++---
>  scripts/kconfig/confdata.c           |  9 +++++----
>  scripts/kconfig/expr.c               |  3 ++-
>  scripts/kconfig/lxdialog/checklist.c |  3 ++-
>  scripts/kconfig/lxdialog/inputbox.c  |  3 ++-
>  scripts/kconfig/lxdialog/menubox.c   | 11 +++++++----
>  scripts/kconfig/lxdialog/util.c      |  5 +++--
>  scripts/kconfig/menu.c               |  4 ++--
>  scripts/kconfig/nconf.c              |  3 ++-
>  scripts/kconfig/nconf.gui.c          |  3 ++-
>  scripts/kconfig/symbol.c             |  8 ++++----
>  12 files changed, 35 insertions(+), 25 deletions(-)
>=20
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index fff818b92acb..d1e987364914 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -242,7 +242,7 @@ static void parse_config_file(const char *p)
>  	while ((p =3D strstr(p, "CONFIG_"))) {
>  		p +=3D 7;
>  		q =3D p;
> -		while (*q && (isalnum(*q) || *q =3D=3D '_'))
> +		while (*q && (isalnum((unsigned char)*q) || *q =3D=3D '_'))
>  			q++;
>  		if (memcmp(q - 7, "_MODULE", 7) =3D=3D 0)
>  			r =3D q - 7;
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 866369f10ff8..954f19fa3b70 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -60,7 +60,7 @@ static void strip(char *str)
>  	char *p =3D str;
>  	int l;
> =20
> -	while ((isspace(*p)))
> +	while ((isspace((unsigned char)*p)))
>  		p++;
>  	l =3D strlen(p);
>  	if (p !=3D str)
> @@ -68,7 +68,7 @@ static void strip(char *str)
>  	if (!l)
>  		return;
>  	p =3D str + l - 1;
> -	while ((isspace(*p)))
> +	while ((isspace((unsigned char)*p)))
>  		*p-- =3D 0;
>  }
> =20
> @@ -320,7 +320,7 @@ static int conf_choice(struct menu *menu)
>  			}
>  			if (!line[0])
>  				cnt =3D def;
> -			else if (isdigit(line[0]))
> +			else if (isdigit((unsigned char)line[0]))
>  				cnt =3D atoi(line);
>  			else
>  				continue;
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 297b079ae4d9..c0a7373ade00 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -94,7 +94,7 @@ static char *conf_expand_value(const char *in)
>  		strncat(res_value, in, src - in);
>  		src++;
>  		dst =3D name;
> -		while (isalnum(*src) || *src =3D=3D '_')
> +		while (isalnum((unsigned char)*src) || *src =3D=3D '_')
>  			*dst++ =3D *src++;
>  		*dst =3D 0;
>  		sym =3D sym_lookup(name, 0);
> @@ -152,7 +152,7 @@ static int conf_set_sym_val(struct symbol *sym, int=
 def, int def_flags, char *p)
>  		return 1;
>  	case S_OTHER:
>  		if (*p !=3D '"') {
> -			for (p2 =3D p; *p2 && !isspace(*p2); p2++)
> +			for (p2 =3D p; *p2 && !isspace((unsigned char)*p2); p2++)
>  				;
>  			sym->type =3D S_STRING;
>  			goto done;
> @@ -617,7 +617,8 @@ tristate_print_symbol(FILE *fp, struct symbol *sym,=
 const char *value, void *arg
>  {
> =20
>  	if (sym->type =3D=3D S_TRISTATE && *value !=3D 'n')
> -		fprintf(fp, "%s%s=3D%c\n", CONFIG_, sym->name, (char)toupper(*value)=
);
> +		fprintf(fp, "%s%s=3D%c\n", CONFIG_, sym->name,
> +			(char)toupper((unsigned char)*value));
>  }
> =20
>  static struct conf_printer tristate_printer_cb =3D
> @@ -910,7 +911,7 @@ static int conf_split_config(void)
>  		s =3D sym->name;
>  		d =3D path;
>  		while ((c =3D *s++)) {
> -			c =3D tolower(c);
> +			c =3D tolower((unsigned char)c);
>  			*d++ =3D (c =3D=3D '_') ? '/' : c;
>  		}
>  		strcpy(d, ".h");
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index cbf4996dd9c1..4bb98cd3ef58 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -910,7 +910,8 @@ static enum string_value_kind expr_parse_string(con=
st char *str,
>  	default:
>  		return k_invalid;
>  	}
> -	return !errno && !*tail && tail > str && isxdigit(tail[-1])
> +	return !errno && !*tail && tail > str &&
> +	       isxdigit((unsigned char)tail[-1])
>  	       ? kind : k_string;
>  }
> =20
> diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxd=
ialog/checklist.c
> index 8d016faa28d7..c358a7934445 100644
> --- a/scripts/kconfig/lxdialog/checklist.c
> +++ b/scripts/kconfig/lxdialog/checklist.c
> @@ -210,7 +210,8 @@ int dialog_checklist(const char *title, const char =
*prompt, int height,
> =20
>  		for (i =3D 0; i < max_choice; i++) {
>  			item_set(i + scroll);
> -			if (toupper(key) =3D=3D toupper(item_str()[0]))
> +			if (toupper((unsigned char)key) =3D=3D
> +			    toupper((unsigned char)item_str()[0]))
>  				break;
>  		}
> =20
> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdi=
alog/inputbox.c
> index d58de1dc5360..dc1092e0f2fa 100644
> --- a/scripts/kconfig/lxdialog/inputbox.c
> +++ b/scripts/kconfig/lxdialog/inputbox.c
> @@ -194,7 +194,8 @@ int dialog_inputbox(const char *title, const char *=
prompt, int height, int width
>  				}
>  				continue;
>  			default:
> -				if (key < 0x100 && isprint(key)) {
> +				if (key < 0x100 &&
> +				    isprint((unsigned char)key)) {
>  					if (len < MAX_LEN) {
>  						wattrset(dialog, dlg.inputbox.atr);
>  						if (pos < len) {
> diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdia=
log/menubox.c
> index 11ae9ad7ac7b..5d35c0f63a67 100644
> --- a/scripts/kconfig/lxdialog/menubox.c
> +++ b/scripts/kconfig/lxdialog/menubox.c
> @@ -282,8 +282,8 @@ int dialog_menu(const char *title, const char *prom=
pt,
>  	while (key !=3D KEY_ESC) {
>  		key =3D wgetch(menu);
> =20
> -		if (key < 256 && isalpha(key))
> -			key =3D tolower(key);
> +		if (key < 256 && isalpha((unsigned char)key))
> +			key =3D tolower((unsigned char)key);
> =20
>  		if (strchr("ynmh", key))
>  			i =3D max_choice;
> @@ -291,14 +291,17 @@ int dialog_menu(const char *title, const char *pr=
ompt,
>  			for (i =3D choice + 1; i < max_choice; i++) {
>  				item_set(scroll + i);
>  				j =3D first_alpha(item_str(), "YyNnMmHh");
> -				if (key =3D=3D tolower(item_str()[j]))
> +				if (key =3D=3D
> +				    tolower((unsigned char)item_str()[j]))
>  					break;
>  			}
>  			if (i =3D=3D max_choice)
>  				for (i =3D 0; i < max_choice; i++) {
>  					item_set(scroll + i);
>  					j =3D first_alpha(item_str(), "YyNnMmHh");
> -					if (key =3D=3D tolower(item_str()[j]))
> +					if (key =3D=3D
> +					    tolower((unsigned char)
> +						    item_str()[j]))
>  						break;
>  				}
>  		}
> diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog=
/util.c
> index f7abdeb92af0..0b4d858576ce 100644
> --- a/scripts/kconfig/lxdialog/util.c
> +++ b/scripts/kconfig/lxdialog/util.c
> @@ -534,14 +534,15 @@ int first_alpha(const char *string, const char *e=
xempt)
>  	int i, in_paren =3D 0, c;
> =20
>  	for (i =3D 0; i < strlen(string); i++) {
> -		c =3D tolower(string[i]);
> +		c =3D tolower((unsigned char)string[i]);
> =20
>  		if (strchr("<[(", c))
>  			++in_paren;
>  		if (strchr(">])", c) && in_paren > 0)
>  			--in_paren;
> =20
> -		if ((!in_paren) && isalpha(c) && strchr(exempt, c) =3D=3D 0)
> +		if ((!in_paren) && isalpha((unsigned char)c) &&
> +		    strchr(exempt, c) =3D=3D 0)
>  			return i;
>  	}
> =20
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index e9357931b47d..f05738be6191 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -134,9 +134,9 @@ static struct property *menu_add_prop(enum prop_typ=
e type, char *prompt, struct
>  	prop->visible.expr =3D menu_check_dep(dep);
> =20
>  	if (prompt) {
> -		if (isspace(*prompt)) {
> +		if (isspace((unsigned char)*prompt)) {
>  			prop_warn(prop, "leading whitespace ignored");
> -			while (isspace(*prompt))
> +			while (isspace((unsigned char)*prompt))
>  				prompt++;
>  		}
>  		if (current_entry->prompt && current_entry !=3D &rootmenu)
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index a9bc5334a478..37264b2aeef7 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -1034,7 +1034,8 @@ static int do_match(int key, struct match_state *=
state, int *ans)
>  	} else if (!state->in_search)
>  		return 1;
> =20
> -	if (isalnum(c) || isgraph(c) || c =3D=3D ' ') {
> +	if (isalnum((unsigned char)c) || isgraph((unsigned char)c) ||
> +	    c =3D=3D ' ') {
>  		state->pattern[strlen(state->pattern)] =3D c;
>  		state->pattern[strlen(state->pattern)] =3D '\0';
>  		adj_match_dir(&state->match_direction);
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 4b2f44c20caf..f1c9ce286036 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -481,7 +481,8 @@ int dialog_inputbox(WINDOW *main_window,
>  			cursor_form_win =3D min(cursor_position, prompt_width-1);
>  			break;
>  		default:
> -			if ((isgraph(res) || isspace(res))) {
> +			if ((isgraph((unsigned char)res) ||
> +			    isspace((unsigned char)res))) {
>  				/* one for new char, one for '\0' */
>  				if (len+2 > *result_len) {
>  					*result_len =3D len+2;
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 20136ffefb23..cd0ea3b4eaba 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -589,12 +589,12 @@ bool sym_string_valid(struct symbol *sym, const c=
har *str)
>  		ch =3D *str++;
>  		if (ch =3D=3D '-')
>  			ch =3D *str++;
> -		if (!isdigit(ch))
> +		if (!isdigit((unsigned char)ch))
>  			return false;
>  		if (ch =3D=3D '0' && *str !=3D 0)
>  			return false;
>  		while ((ch =3D *str++)) {
> -			if (!isdigit(ch))
> +			if (!isdigit((unsigned char)ch))
>  				return false;
>  		}
>  		return true;
> @@ -603,7 +603,7 @@ bool sym_string_valid(struct symbol *sym, const cha=
r *str)
>  			str +=3D 2;
>  		ch =3D *str++;
>  		do {
> -			if (!isxdigit(ch))
> +			if (!isxdigit((unsigned char)ch))
>  				return false;
>  		} while ((ch =3D *str++));
>  		return true;
> @@ -921,7 +921,7 @@ const char *sym_expand_string_value(const char *in)=

>  		src++;
> =20
>  		p =3D name;
> -		while (isalnum(*src) || *src =3D=3D '_')
> +		while (isalnum((unsigned char)*src) || *src =3D=3D '_')
>  			*p++ =3D *src++;
>  		*p =3D '\0';
> =20
>=20



--X34L2ks919qmJGeElVUoow6NjWhsGnVd4--

--J8ieRP69BGcNMte3M6E4GNjx3SjVlJD22
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZDyhOAAoJEEuzCOmwLnZsIHcP/3z9DcE10AdUrSBPJaRxZ3sD
CoJecKkVLvbRbvZ2uNd3F6qYB99Txoi8+T5n0oGMWYIETOyAAqZqWZ9z+RhTR4GF
UARPXCs+kaFE54786aDSMnw4KTZGFHvfYm9hP9ATalZD4McGPUvLJAOrrpre0qIC
OTGYY8sNKTsoQ7DJ4miPxalYJ9+j66DMj0r5qHemI7w9uUt4rIRr9eniXaHZ4FjI
8947TBKVwS+mqXGS6MEJw/yccV2lP+kv9myO/yvgCrepay3vUwQaQCYFlBJS/DGk
VSPBsk9ERnBbyko4m/WZl/JxeDeXtZCTfQK9UDjY0eO3k4JQb2VujHe3BlAHWnxJ
6ztT1wGNk1wZNwnliXNQNRC759Ne5EX8z4h/nScrhmLp1fj1I0qkCKzoDX7zfCDM
qhV/2tbwcnvRqMGKyWW8XiB5aJAz/nH+d2SuOVX2SC3z7Zq4LQ93RrQGnnDDsLkm
EMPOrFbHbLifZ6lcKTG1wSy0tuT+L6P7hmkPOAVyMI/ALkD+eY9ripqRbuiHXiyt
QIZseiuZaGX0d37/vLNytkWyr1sa8fnt4gNbDpYhLoY5k+yqCdrXkLHW7xDgHXdV
AKCb63goeZiG4nr+y2t476JdZz8hdQK5j9+1au8pFrpwJNbkQwTbsRTcXW3reewf
a3eurK7SY7+XD5n2rzlS
=7Jai
-----END PGP SIGNATURE-----

--J8ieRP69BGcNMte3M6E4GNjx3SjVlJD22--
