Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:41452 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753777AbeGEL4L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 07:56:11 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH 3/3] kconfig: add debugconfig target for debugging purposes
In-Reply-To: <CAK7LNASmsxSszpLLUc9u4LVAyJK-gozkMk6GoU_A7BhzvnQ-HA@mail.gmail.com>
        (Masahiro Yamada's message of "Thu, 5 Jul 2018 18:31:43 +0900")
References: <20180622192739.5327-1-dirk@gouders.net>
        <20180622192739.5327-4-dirk@gouders.net>
        <CAK7LNASmsxSszpLLUc9u4LVAyJK-gozkMk6GoU_A7BhzvnQ-HA@mail.gmail.com>
Date: Thu, 05 Jul 2018 13:51:37 +0200
Message-ID: <ghzhz5yk6u.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

--=-=-=

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> 2018-06-23 4:27 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
>> Currently, we need to modify existing kconfig targets to generate debugging
>> information from the parser.  That information then has to be filtered
>> somehow, automated tests are at least complicated to implement.
>>
>> Add a debugconfig target for pure debugging purposes; the initial
>> version of this target dumps the menu tree and with the --debug option
>> activates the parsers debugging output via it's global variable
>> cdebug.  The environment variable ZCONF_DEBUG can be used to generate
>> even more detailed debugging information.
>>
>> Sample output for a simple Kconfig file:
>>
>> $ scripts/kconfig/dconf --debug Kconfig.dconfig
>> Kconfig.dconfig:1:config a
>> Kconfig.dconfig:2:type(1)
>> Kconfig.dconfig:4:endconfig
>> Kconfig.dconfig:5:if
>> Kconfig.dconfig:5:config b
>> Kconfig.dconfig:6:type(1)
>> Kconfig.dconfig:7:endconfig
>> Kconfig.dconfig:7:endif
>>
>> config a
>>   bool
>>   symbol a
>>   prompt "a"
>>
>> config b
>>   bool
>>   symbol b
>>   prompt "b" if a
>>
>> endmenu
>>
>> Signed-off-by: Dirk Gouders <dirk@gouders.net>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> ---
>>  scripts/kconfig/Makefile | 10 ++++++++-
>>  scripts/kconfig/dconf.c  | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 64 insertions(+), 1 deletion(-)
>>  create mode 100644 scripts/kconfig/dconf.c
>>
>> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
>> index a3ac2c91331c..19906ff25392 100644
>> --- a/scripts/kconfig/Makefile
>> +++ b/scripts/kconfig/Makefile
>> @@ -4,7 +4,7 @@
>>  # These targets are used from top-level makefile
>>
>>  PHONY += xconfig gconfig menuconfig config syncconfig \
>> -       localmodconfig localyesconfig
>> +       localmodconfig localyesconfig debugconfig
>>
>>  ifdef KBUILD_KCONFIG
>>  Kconfig := $(KBUILD_KCONFIG)
>> @@ -34,6 +34,9 @@ config: $(obj)/conf
>>  nconfig: $(obj)/nconf
>>         $< $(silent) $(Kconfig)
>>
>> +debugconfig: $(obj)/dconf
>> +       $< $(silent) $(Kconfig)
>> +
>>  # This has become an internal implementation detail and is now deprecated
>>  # for external use.
>>  syncconfig: $(obj)/conf
>> @@ -149,6 +152,7 @@ help:
>>         @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
>>         @echo  '  tinyconfig      - Configure the tiniest possible kernel'
>>         @echo  '  testconfig      - Run Kconfig unit tests (requires python3 and pytest)'
>> +       @echo  '  debugconfig     - Debugging tool for developers'
>>
>>  # ===========================================================================
>>  # Shared Makefile for the various kconfig executables:
>> @@ -165,6 +169,10 @@ targets            += zconf.lex.c
>>  HOSTCFLAGS_zconf.lex.o := -I$(src)
>>  HOSTCFLAGS_zconf.tab.o := -I$(src)
>>
>> +# dconf: Used for kconfig debugging
>> +hostprogs-y    += dconf
>> +dconf-objs     := dconf.o zconf.tab.o
>> +
>>  # nconf: Used for the nconfig target based on ncurses
>>  hostprogs-y    += nconf
>>  nconf-objs     := nconf.o zconf.tab.o nconf.gui.o
>> diff --git a/scripts/kconfig/dconf.c b/scripts/kconfig/dconf.c
>> new file mode 100644
>> index 000000000000..ed1edf607d80
>> --- /dev/null
>> +++ b/scripts/kconfig/dconf.c
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (C) 2018 Dirk Gouders <dirk@gouders.net>
>> +
>> +#include <stdlib.h>
>> +#include <stdio.h>
>> +#include <getopt.h>
>> +
>> +#include "lkc.h"
>> +
>> +extern int cdebug;
>> +
>> +void usage(const char *progname);
>> +void usage(const char *progname)
>> +{
>> +       printf("Usage: %s --help | [--debug] <kconfig-file>\n", progname);
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +       int c;
>> +       int opt_index = 0;
>> +       char *filename;
>> +
>> +       struct option long_opts[] = {
>> +               {"debug", no_argument, NULL, 0},
>> +               {"help", no_argument, NULL, 1},
>> +               {0, 0, 0, 0}
>> +       };
>> +
>> +       while (1 ) {
>> +               c = getopt_long(argc, argv, "", long_opts, &opt_index);
>> +
>> +               if (c == -1)
>> +                       break;
>> +               if (c == 0) {
>> +                       cdebug = 0x02;
>> +               }
>> +               if (c == 1) {
>> +                       usage(argv[0]);
>> +                       exit(EXIT_SUCCESS);
>> +               }
>> +       }
>> +
>> +       if (optind == argc) {
>> +               usage(argv[0]);
>> +               exit(EXIT_FAILURE);
>> +       } else
>> +               filename = argv[optind];
>> +
>> +       conf_parse(filename);
>> +       zconfdump(stdout);
>> +
>> +       exit(EXIT_SUCCESS);
>> +}
>> --
>> 2.13.6
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> You mentioned ZCONF_DEBUG in the log.
>
> So, another possibility is to use
> an environment variable to turn on debug features.
>
>        name = getenv("KCONFIG_DEBUG");
>        if (name && name[0] == '1')
>                zconfdump(stdout);

Yes, that would also be a possibility.  Perhaps even more flexibility
would be gained if a path is allowed for the content of the environment
variable to specify where the dump should go, e.g.
KCONFIG_DEBUG="./zconfdump-%d.out".  This way, we could dump without
disturbing std{err,out}.

Since some days, I am thinking about the possibility of a "knob" for
*config targets, once triggered, a dump will be produced to the
specified location.  But thinking of menuconfig, for example, I have not
yet an idea what this "knob" could be -- we don't have many unused keys
left.  Perhaps a signal...





The following is only meant for exchange of ideas -- I currently do some
debugging this way but chances are that all of it is not thought trough,
very well and too complicated:

I am wondering if -- instead of providing a debugging tool --
it would be more practical to offer developers a hook to enable easy use
of personal debugging tools through make(1) without disturbing git and
the need to trimm the mainstream Makefile every time:

1) Add a hook to scripts/kconfig/Makefile to allow developers to add
   own tools if they want to:
#
# Include optional Makefile that developers can trimm without
# disturbing git to make use of tools that are still under development
# or not adequate for mainstream.
#
-include scripts/kconfig/Makefile.devel

2) My Makefile.devel then looks like

PHONY += debugconfig

debugconfig: $(obj)/dconf
	$< $(silent) $(dconfargs) $(Kconfig)

# dconf: Used for kconfig debugging
hostprogs-y	+= dconf
dconf-objs	:= dconf.o zconf.tab.o


3) This allows me to call debugconfig like this:

   make dconfargs="--symdump=symdump" Kconfig=Kconfig_for_testing debugconfig

4) In case you are interested, my current debugging tool is attached.
   It grew a bit and it is bigger than it could be, because (for now) I
   want it to be standalone, without disturbing files that are
   controlled by git.

   The tool now also produces a dump of all symbols, a bit different
   compared to walking symbols via the menu.

Dirk


--=-=-=
Content-Disposition: inline; filename=dconf.c
Content-Description: Personal debugging tool

// SPDX-License-Identifier: GPL-2.0
//
// Copyright (C) 2018 Dirk Gouders <dirk@gouders.net>

#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <string.h>

#include "lkc.h"
#include "expr.h"

extern int cdebug;

#define SYMBOL_NO_WRITE       0x1000

void usage(const char *progname);
void usage(const char *progname)
{
	printf("Usage: %s --help | [--debug] [--menudump[=file]] [--symdump[=file]] <kconfig-file>\n", progname);
}

static void dconf_check_types()
{
}

static void print_quoted_string(FILE *out, const char *str)
{
	const char *p;
	int len;

	putc('"', out);
	while ((p = strchr(str, '"'))) {
		len = p - str;
		if (len)
			fprintf(out, "%.*s", len, str);
		fputs("\\\"", out);
		str = p + 1;
	}
	fputs(str, out);
	putc('"', out);
}

static void sym_print_flags(FILE *out, struct symbol *sym)
{
	char *space = "";

	fprintf(out, "Flags: ");

	if (!sym->flags) {
		fprintf(out, "\n");
		return;
	}

	if (sym->flags & SYMBOL_CONST) {
		fprintf(out, "CONST");
		space = ", ";
	}
	if (sym->flags & SYMBOL_CHECK) {
		fprintf(out, "%sCHECK", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_CHOICE) {
		fprintf(out, "%sCHOICE", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_CHOICEVAL) {
		fprintf(out, "%sCHOICEVAL", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_VALID) {
		fprintf(out, "%sVALID", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_OPTIONAL) {
		fprintf(out, "%sOPTIONAL", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_WRITE) {
		fprintf(out, "%sWRITE", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_CHANGED) {
		fprintf(out, "%sCHANGED", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_NO_WRITE) {
		fprintf(out, "%sNO_WRITE", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_CHECKED) {
		fprintf(out, "%sCHECKED", space);
		space = ", ";
	}
	if (sym->flags & SYMBOL_WARNED) {
		fprintf(out, "%sWARNED", space);
	}
	fprintf(out, "\n");
}
static void print_symbol(FILE *out, struct symbol *sym)
{
	struct property *prop;

	if (sym_is_choice(sym))
		fprintf(out, "\nchoice\n");
	else
		fprintf(out, "\nconfig %s\n", sym->name);

	sym_print_flags(out, sym);

	switch (sym->type) {
	case S_BOOLEAN:
		fputs("  bool\n", out);
		break;
	case S_TRISTATE:
		fputs("  tristate\n", out);
		break;
	case S_STRING:
		fputs("  string\n", out);
		break;
	case S_INT:
		fputs("  integer\n", out);
		break;
	case S_HEX:
		fputs("  hex\n", out);
		break;
	default:
		fputs("  unknown\n", out);
		break;
	}

	fprintf(out, "Value: %s\n", sym_get_string_value(sym));

	for (prop = sym->prop; prop; prop = prop->next) {
		switch (prop->type) {
		case P_PROMPT:
			fputs("  prompt ", out);
			print_quoted_string(out, prop->text);
			if (!expr_is_yes(prop->visible.expr)) {
				fputs(" if ", out);
				expr_fprint(prop->visible.expr, out);
			}
			fputc('\n', out);
			break;
		case P_DEFAULT:
			fputs( "  default ", out);
			expr_fprint(prop->expr, out);
			if (!expr_is_yes(prop->visible.expr)) {
				fputs(" if ", out);
				expr_fprint(prop->visible.expr, out);
			}
			fputc('\n', out);
			break;
		case P_CHOICE:
			fputs("  #choice value\n", out);
			break;
		case P_SELECT:
			fputs( "  select ", out);
			expr_fprint(prop->expr, out);
			if (!expr_is_yes(prop->visible.expr)) {
				fputs(" if ", out);
				expr_fprint(prop->visible.expr, out);
			}
			fputc('\n', out);
			break;
		case P_IMPLY:
			fputs( "  imply ", out);
			expr_fprint(prop->expr, out);
			if (!expr_is_yes(prop->visible.expr)) {
				fputs(" if ", out);
				expr_fprint(prop->visible.expr, out);
			}
			fputc('\n', out);
			break;
		case P_RANGE:
			fputs( "  range ", out);
			expr_fprint(prop->expr, out);
			if (!expr_is_yes(prop->visible.expr)) {
				fputs(" if ", out);
				expr_fprint(prop->visible.expr, out);
			}
			fputc('\n', out);
			break;
		case P_MENU:
			fputs( "  menu ", out);
			print_quoted_string(out, prop->text);
			fputc('\n', out);
			break;
		case P_SYMBOL:
			fputs( "  symbol ", out);
			if (prop->sym)
				fprintf(out, "%s (file %s:%d)\n", prop->sym->name,
					prop->file->name, prop->lineno);
			break;
		default:
			fprintf(out, "  unknown prop %d!\n", prop->type);
			break;
		}
	}

	fprintf(out, "  Depends on: ");
	if (!expr_is_yes(sym->dir_dep.expr))
		expr_fprint(sym->dir_dep.expr, out);

	fprintf(out, "\n  Selected by: ");
	if (!expr_is_yes(sym->rev_dep.expr))
		expr_fprint(sym->rev_dep.expr, out);

	fprintf(out, "\n  Implied by: ");
	if (!expr_is_yes(sym->implied.expr))
		expr_fprint(sym->implied.expr, out);

	fputc('\n', out);
}

void sym_dump(FILE *);
void sym_dump(FILE *out)
{
	struct symbol *sym;
	int i;

	print_symbol(out, &symbol_yes);
	print_symbol(out, &symbol_mod);
	print_symbol(out, &symbol_no);

	for_all_symbols(i, sym) {
		print_symbol(out, sym);
	}
}

int main(int argc, char *argv[])
{
	int c;
	int opt_index = 0;
	char *filename;

	int menudump = 0;	/* Print menu structure */
	FILE *menudump_out;

	int symdump = 0;	/* Print all symbols */
	FILE *symdump_out;

	struct option long_opts[] = {
		{"debug", no_argument, NULL, 0},
		{"help", no_argument, NULL, 1},
		{"menudump", optional_argument, NULL, 2},
		{"symdump", optional_argument, NULL, 3},
		{0, 0, 0, 0}
	};

	while (1 ) {
		c = getopt_long(argc, argv, "", long_opts, &opt_index);

		if (c == -1)
			break;
		if (c == 0) {
			cdebug = 0x02;
		}
		if (c == 1) {
			usage(argv[0]);
			exit(EXIT_SUCCESS);
		}
		if (c == 2) {
			menudump = 1;
			if (optarg) {
				if (!strcmp(optarg, "stdout"))
					menudump_out = stdout;
				else if (!strcmp(optarg, "stderr"))
					menudump_out = stderr;
				else {
					menudump_out = fopen(optarg, "w");
					if (!menudump_out) {
						perror(optarg);
					}
				}
			} else
				menudump_out = stdout;
		}
		if (c == 3) {
			symdump = 1;
			if (optarg) {
				if (!strcmp(optarg, "stdout"))
					symdump_out = stdout;
				else if (!strcmp(optarg, "stderr"))
					symdump_out = stderr;
				else {
					symdump_out = fopen(optarg, "w");
					if (!symdump_out) {
						perror(optarg);
					}
				}
			} else
				symdump_out = stdout;
		}
	}

	if (optind == argc) {
		usage(argv[0]);
		exit(EXIT_FAILURE);
	} else
		filename = argv[optind];

	//getc(stdin);
	conf_parse(filename);
	//conf_read(NULL);

	if (menudump)
		zconfdump(menudump_out);

	if (symdump)
		sym_dump(symdump_out);

	exit(EXIT_SUCCESS);
}

--=-=-=--
