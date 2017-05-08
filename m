Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:57788 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751367AbdEHAEZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 20:04:25 -0400
Subject: Re: [PATCH v2] Fix ctype(3) usage in the kconfig code on NetBSD
References: <1457397085-10907-1-git-send-email-n54@gmx.com>
 <20170507134422.2666-1-n54@gmx.com>
 <b2a75122-5762-542e-14b8-c6ef459b0825@gmx.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0857dbdf-d62f-c290-37ca-727fc2b1696b@infradead.org>
Date: Sun, 7 May 2017 17:04:13 -0700
MIME-Version: 1.0
In-Reply-To: <b2a75122-5762-542e-14b8-c6ef459b0825@gmx.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kamil Rytarowski <n54@gmx.com>, linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>


Patch makes sense to me. I haven't tested it but I can.

A bigger problem is who will merge it.  Yann has relinquished the
maintainership of kconfig (see http://marc.info/?l=linux-kbuild&m=149185505605964&w=2).
(That patch needs to be merged also.)

and the kbuild maintainer is not maintaining kconfig IIRC.

Andrew, would you push this patch?  and the one for the MAINTAINERS file?
(http://marc.info/?l=linux-kbuild&m=149419921910871&w=2)



On 05/07/17 06:59, Kamil Rytarowski wrote:
> I've rebased the patch to the current HEAD.
> 
> This is general yearly PING...
> 
> On 07.05.2017 15:44, Kamil Rytarowski wrote:
>> The current code produces set of warnings on NetBSD-7.99.25 (GCC 4.8.5):
>>
>> In file included from scripts/kconfig/zconf.tab.c:2576:0:
>> scripts/kconfig/confdata.c: In function 'conf_expand_value':
>> scripts/kconfig/confdata.c:97:3:
>> warning: array subscript has type 'char' [-Wchar-subscripts]
>>    while (isalnum(*src) || *src == '_')
>>    ^
>> scripts/kconfig/confdata.c: In function 'conf_set_sym_val':
>> scripts/kconfig/confdata.c:155:4:
>> warning: array subscript has type 'char' [-Wchar-subscripts]
>>     for (p2 = p; *p2 && !isspace(*p2); p2++)
>>     ^
>> scripts/kconfig/confdata.c: In function 'tristate_print_symbol':
>> scripts/kconfig/confdata.c:617:3:
>> warning: array subscript has type 'char' [-Wchar-subscripts]
>>    fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
>>    ^
>>
>> Fix this portability issue by explicit casting to unsigned char.
>>
>>  CAVEATS
>>   The first argument of these functions is of type int, but only a very
>>   restricted subset of values are actually valid.  The argument must either
>>   be the value of the macro EOF (which has a negative value), or must be a
>>   non-negative value within the range representable as unsigned char.
>>   Passing invalid values leads to undefined behavior.
>>
>>   --- The NetBSD ctype(3) man-page
>>
>>   This behavior is POSIX and Standard C:
>>
>>   The c argument is an int, the value of which the application shall ensure
>>   is a character representable as an unsigned char or equal to the value of
>>   the macro EOF. If the argument has any other value, the behavior is
>>   undefined.
>>
>>     -- The Open Group Base Specifications Issue 6
>>        IEEE Std 1003.1, 2004 Edition
>>
>>   The header declares several functions useful for classifying and mapping
>>   characters In all cases the argument is an int, the value of which shall
>>   be representable as an unsigned char or shall equal the value of the
>>   macro EOF. If the argument has any other value, the behavior is
>>   undefined.
>>
>>     -- C11 standard 7.4 Character handling <ctype.h> paragraph 1
>>
>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>> ---
>>  scripts/basic/fixdep.c               |  2 +-
>>  scripts/kconfig/conf.c               |  6 +++---
>>  scripts/kconfig/confdata.c           |  9 +++++----
>>  scripts/kconfig/expr.c               |  3 ++-
>>  scripts/kconfig/lxdialog/checklist.c |  3 ++-
>>  scripts/kconfig/lxdialog/inputbox.c  |  3 ++-
>>  scripts/kconfig/lxdialog/menubox.c   | 11 +++++++----
>>  scripts/kconfig/lxdialog/util.c      |  5 +++--
>>  scripts/kconfig/menu.c               |  4 ++--
>>  scripts/kconfig/nconf.c              |  3 ++-
>>  scripts/kconfig/nconf.gui.c          |  3 ++-
>>  scripts/kconfig/symbol.c             |  8 ++++----
>>  12 files changed, 35 insertions(+), 25 deletions(-)
>>
>> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
>> index fff818b92acb..d1e987364914 100644
>> --- a/scripts/basic/fixdep.c
>> +++ b/scripts/basic/fixdep.c
>> @@ -242,7 +242,7 @@ static void parse_config_file(const char *p)
>>  	while ((p = strstr(p, "CONFIG_"))) {
>>  		p += 7;
>>  		q = p;
>> -		while (*q && (isalnum(*q) || *q == '_'))
>> +		while (*q && (isalnum((unsigned char)*q) || *q == '_'))
>>  			q++;
>>  		if (memcmp(q - 7, "_MODULE", 7) == 0)
>>  			r = q - 7;
>> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
>> index 866369f10ff8..954f19fa3b70 100644
>> --- a/scripts/kconfig/conf.c
>> +++ b/scripts/kconfig/conf.c
>> @@ -60,7 +60,7 @@ static void strip(char *str)
>>  	char *p = str;
>>  	int l;
>>  
>> -	while ((isspace(*p)))
>> +	while ((isspace((unsigned char)*p)))
>>  		p++;
>>  	l = strlen(p);
>>  	if (p != str)
>> @@ -68,7 +68,7 @@ static void strip(char *str)
>>  	if (!l)
>>  		return;
>>  	p = str + l - 1;
>> -	while ((isspace(*p)))
>> +	while ((isspace((unsigned char)*p)))
>>  		*p-- = 0;
>>  }
>>  
>> @@ -320,7 +320,7 @@ static int conf_choice(struct menu *menu)
>>  			}
>>  			if (!line[0])
>>  				cnt = def;
>> -			else if (isdigit(line[0]))
>> +			else if (isdigit((unsigned char)line[0]))
>>  				cnt = atoi(line);
>>  			else
>>  				continue;
>> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
>> index 297b079ae4d9..c0a7373ade00 100644
>> --- a/scripts/kconfig/confdata.c
>> +++ b/scripts/kconfig/confdata.c
>> @@ -94,7 +94,7 @@ static char *conf_expand_value(const char *in)
>>  		strncat(res_value, in, src - in);
>>  		src++;
>>  		dst = name;
>> -		while (isalnum(*src) || *src == '_')
>> +		while (isalnum((unsigned char)*src) || *src == '_')
>>  			*dst++ = *src++;
>>  		*dst = 0;
>>  		sym = sym_lookup(name, 0);
>> @@ -152,7 +152,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
>>  		return 1;
>>  	case S_OTHER:
>>  		if (*p != '"') {
>> -			for (p2 = p; *p2 && !isspace(*p2); p2++)
>> +			for (p2 = p; *p2 && !isspace((unsigned char)*p2); p2++)
>>  				;
>>  			sym->type = S_STRING;
>>  			goto done;
>> @@ -617,7 +617,8 @@ tristate_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg
>>  {
>>  
>>  	if (sym->type == S_TRISTATE && *value != 'n')
>> -		fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
>> +		fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name,
>> +			(char)toupper((unsigned char)*value));
>>  }
>>  
>>  static struct conf_printer tristate_printer_cb =
>> @@ -910,7 +911,7 @@ static int conf_split_config(void)
>>  		s = sym->name;
>>  		d = path;
>>  		while ((c = *s++)) {
>> -			c = tolower(c);
>> +			c = tolower((unsigned char)c);
>>  			*d++ = (c == '_') ? '/' : c;
>>  		}
>>  		strcpy(d, ".h");
>> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
>> index cbf4996dd9c1..4bb98cd3ef58 100644
>> --- a/scripts/kconfig/expr.c
>> +++ b/scripts/kconfig/expr.c
>> @@ -910,7 +910,8 @@ static enum string_value_kind expr_parse_string(const char *str,
>>  	default:
>>  		return k_invalid;
>>  	}
>> -	return !errno && !*tail && tail > str && isxdigit(tail[-1])
>> +	return !errno && !*tail && tail > str &&
>> +	       isxdigit((unsigned char)tail[-1])
>>  	       ? kind : k_string;
>>  }
>>  
>> diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdialog/checklist.c
>> index 8d016faa28d7..c358a7934445 100644
>> --- a/scripts/kconfig/lxdialog/checklist.c
>> +++ b/scripts/kconfig/lxdialog/checklist.c
>> @@ -210,7 +210,8 @@ int dialog_checklist(const char *title, const char *prompt, int height,
>>  
>>  		for (i = 0; i < max_choice; i++) {
>>  			item_set(i + scroll);
>> -			if (toupper(key) == toupper(item_str()[0]))
>> +			if (toupper((unsigned char)key) ==
>> +			    toupper((unsigned char)item_str()[0]))
>>  				break;
>>  		}
>>  
>> diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
>> index d58de1dc5360..dc1092e0f2fa 100644
>> --- a/scripts/kconfig/lxdialog/inputbox.c
>> +++ b/scripts/kconfig/lxdialog/inputbox.c
>> @@ -194,7 +194,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
>>  				}
>>  				continue;
>>  			default:
>> -				if (key < 0x100 && isprint(key)) {
>> +				if (key < 0x100 &&
>> +				    isprint((unsigned char)key)) {
>>  					if (len < MAX_LEN) {
>>  						wattrset(dialog, dlg.inputbox.atr);
>>  						if (pos < len) {
>> diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
>> index 11ae9ad7ac7b..5d35c0f63a67 100644
>> --- a/scripts/kconfig/lxdialog/menubox.c
>> +++ b/scripts/kconfig/lxdialog/menubox.c
>> @@ -282,8 +282,8 @@ int dialog_menu(const char *title, const char *prompt,
>>  	while (key != KEY_ESC) {
>>  		key = wgetch(menu);
>>  
>> -		if (key < 256 && isalpha(key))
>> -			key = tolower(key);
>> +		if (key < 256 && isalpha((unsigned char)key))
>> +			key = tolower((unsigned char)key);
>>  
>>  		if (strchr("ynmh", key))
>>  			i = max_choice;
>> @@ -291,14 +291,17 @@ int dialog_menu(const char *title, const char *prompt,
>>  			for (i = choice + 1; i < max_choice; i++) {
>>  				item_set(scroll + i);
>>  				j = first_alpha(item_str(), "YyNnMmHh");
>> -				if (key == tolower(item_str()[j]))
>> +				if (key ==
>> +				    tolower((unsigned char)item_str()[j]))
>>  					break;
>>  			}
>>  			if (i == max_choice)
>>  				for (i = 0; i < max_choice; i++) {
>>  					item_set(scroll + i);
>>  					j = first_alpha(item_str(), "YyNnMmHh");
>> -					if (key == tolower(item_str()[j]))
>> +					if (key ==
>> +					    tolower((unsigned char)
>> +						    item_str()[j]))
>>  						break;
>>  				}
>>  		}
>> diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
>> index f7abdeb92af0..0b4d858576ce 100644
>> --- a/scripts/kconfig/lxdialog/util.c
>> +++ b/scripts/kconfig/lxdialog/util.c
>> @@ -534,14 +534,15 @@ int first_alpha(const char *string, const char *exempt)
>>  	int i, in_paren = 0, c;
>>  
>>  	for (i = 0; i < strlen(string); i++) {
>> -		c = tolower(string[i]);
>> +		c = tolower((unsigned char)string[i]);
>>  
>>  		if (strchr("<[(", c))
>>  			++in_paren;
>>  		if (strchr(">])", c) && in_paren > 0)
>>  			--in_paren;
>>  
>> -		if ((!in_paren) && isalpha(c) && strchr(exempt, c) == 0)
>> +		if ((!in_paren) && isalpha((unsigned char)c) &&
>> +		    strchr(exempt, c) == 0)
>>  			return i;
>>  	}
>>  
>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index e9357931b47d..f05738be6191 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -134,9 +134,9 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
>>  	prop->visible.expr = menu_check_dep(dep);
>>  
>>  	if (prompt) {
>> -		if (isspace(*prompt)) {
>> +		if (isspace((unsigned char)*prompt)) {
>>  			prop_warn(prop, "leading whitespace ignored");
>> -			while (isspace(*prompt))
>> +			while (isspace((unsigned char)*prompt))
>>  				prompt++;
>>  		}
>>  		if (current_entry->prompt && current_entry != &rootmenu)
>> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
>> index a9bc5334a478..37264b2aeef7 100644
>> --- a/scripts/kconfig/nconf.c
>> +++ b/scripts/kconfig/nconf.c
>> @@ -1034,7 +1034,8 @@ static int do_match(int key, struct match_state *state, int *ans)
>>  	} else if (!state->in_search)
>>  		return 1;
>>  
>> -	if (isalnum(c) || isgraph(c) || c == ' ') {
>> +	if (isalnum((unsigned char)c) || isgraph((unsigned char)c) ||
>> +	    c == ' ') {
>>  		state->pattern[strlen(state->pattern)] = c;
>>  		state->pattern[strlen(state->pattern)] = '\0';
>>  		adj_match_dir(&state->match_direction);
>> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
>> index 4b2f44c20caf..f1c9ce286036 100644
>> --- a/scripts/kconfig/nconf.gui.c
>> +++ b/scripts/kconfig/nconf.gui.c
>> @@ -481,7 +481,8 @@ int dialog_inputbox(WINDOW *main_window,
>>  			cursor_form_win = min(cursor_position, prompt_width-1);
>>  			break;
>>  		default:
>> -			if ((isgraph(res) || isspace(res))) {
>> +			if ((isgraph((unsigned char)res) ||
>> +			    isspace((unsigned char)res))) {
>>  				/* one for new char, one for '\0' */
>>  				if (len+2 > *result_len) {
>>  					*result_len = len+2;
>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>> index 20136ffefb23..cd0ea3b4eaba 100644
>> --- a/scripts/kconfig/symbol.c
>> +++ b/scripts/kconfig/symbol.c
>> @@ -589,12 +589,12 @@ bool sym_string_valid(struct symbol *sym, const char *str)
>>  		ch = *str++;
>>  		if (ch == '-')
>>  			ch = *str++;
>> -		if (!isdigit(ch))
>> +		if (!isdigit((unsigned char)ch))
>>  			return false;
>>  		if (ch == '0' && *str != 0)
>>  			return false;
>>  		while ((ch = *str++)) {
>> -			if (!isdigit(ch))
>> +			if (!isdigit((unsigned char)ch))
>>  				return false;
>>  		}
>>  		return true;
>> @@ -603,7 +603,7 @@ bool sym_string_valid(struct symbol *sym, const char *str)
>>  			str += 2;
>>  		ch = *str++;
>>  		do {
>> -			if (!isxdigit(ch))
>> +			if (!isxdigit((unsigned char)ch))
>>  				return false;
>>  		} while ((ch = *str++));
>>  		return true;
>> @@ -921,7 +921,7 @@ const char *sym_expand_string_value(const char *in)
>>  		src++;
>>  
>>  		p = name;
>> -		while (isalnum(*src) || *src == '_')
>> +		while (isalnum((unsigned char)*src) || *src == '_')
>>  			*p++ = *src++;
>>  		*p = '\0';
>>  
>>
> 
> 


-- 
~Randy
