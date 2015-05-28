Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:36559 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753704AbbE1SRh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 14:17:37 -0400
Message-ID: <1432837051.1354.24.camel@x220>
Subject: Re: [PATCH 4/5] kconfig: Introduce "showif" to factor out
 conditions on visibility
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 28 May 2015 20:17:31 +0200
In-Reply-To: <760264ebf529ba3b0aa007144e2862bc73807dad.1431589089.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
	 <760264ebf529ba3b0aa007144e2862bc73807dad.1431589089.git.josh@joshtriplett.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2015-05-14 at 08:36 -0700, Josh Triplett wrote:
> kconfig implicitly creates a submenu whenever a series of symbols all
> have dependencies or prompt-visibility expressions that all depend on a
> preceeding symbol.  For instance, the series of symbols following
> "menuconfig EXPERT" that all have "if EXPERT" on their prompt will all
> appear as a submenu of EXPERT.
> 
> However, this implicit submenuing will break if any intervening symbol
> loses its "if EXPERT"; doing so causes the subsequent symbols to appear
> in the parent menu ("General setup").  This has happened many times, and
> it's easy to miss that the entire block should have that same
> expression.
> 
> For submenus created from "depends" dependencies, these can be converted
> to a single wrapping "if expr ... endif" block around all the submenu
> items.  However, there's no equivalent for invisible items, for which
> the prompt is hidden but the symbol may potentially be enabled.  For
> instance, many items in the EXPERT menu are hidden if EXPERT is
> disabled, but they have "default y" or are determined by some other
> expression.
> 
> To handle this case, introduce a new kconfig construct, "showif", which
> does the same thing as "if" but for visibility expressions rather than
> dependencies.  Every symbol in a "showif expr ... endif" block
> effectively has "if expr" added to its prompt.
> 
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>
> Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> ---
>  scripts/kconfig/menu.c               |   4 +-
>  scripts/kconfig/zconf.gperf          |   1 +
>  scripts/kconfig/zconf.hash.c_shipped | 258 ++++++++--------
>  scripts/kconfig/zconf.tab.c_shipped  | 561 +++++++++++++++++++----------------
>  scripts/kconfig/zconf.y              |  28 +-
>  5 files changed, 459 insertions(+), 393 deletions(-)

Documentation/kbuild/kconfig-language.txt is suspiciously absent from
this list.

> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -344,7 +344,9 @@ void menu_finalize(struct menu *parent)
>  		basedep = expr_eliminate_dups(expr_transform(basedep));
>  		last_menu = NULL;
>  		for (menu = parent->next; menu; menu = menu->next) {
> -			dep = menu->prompt ? menu->prompt->visible.expr : menu->dep;
> +			dep = menu->prompt ? menu->prompt->visible.expr
> +			    : menu->visibility ? menu->visibility
> +			    : menu->dep;
>  			if (!expr_contains_symbol(dep, sym))
>  				break;
>  			if (expr_depends_symbol(dep, sym))

If this hunk was obvious to you, and not the result of some trial and
error, then I think there's an update to MAINTAINERS I should send.

> --- a/scripts/kconfig/zconf.hash.c_shipped
> +++ b/scripts/kconfig/zconf.hash.c_shipped

I was happy to see gperf embeds the command-line to create this file in
the output. Is there some option to bison that does that too?

> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
>  static struct menu *current_menu, *current_entry;
>  
>  %}
> -%expect 30
> +%expect 31

As above: if you didn't add this just to shut up bison there's a patch
to MAINTAINERS I'd like to submit.

>  %union
>  {
> @@ -55,6 +55,7 @@ static struct menu *current_menu, *current_entry;
>  %token <id>T_HELP
>  %token <string> T_HELPTEXT
>  %token <id>T_IF
> +%token <id>T_SHOWIF
>  %token <id>T_ENDIF
>  %token <id>T_DEPENDS
>  %token <id>T_OPTIONAL
> @@ -84,7 +85,7 @@ static struct menu *current_menu, *current_entry;
>  %type <expr> if_expr
>  %type <id> end
>  %type <id> option_name
> -%type <menu> if_entry menu_entry choice_entry
> +%type <menu> if_entry showif_entry menu_entry choice_entry
>  %type <string> symbol_option_arg word_opt
>  
>  %destructor {
> @@ -92,7 +93,7 @@ static struct menu *current_menu, *current_entry;
>  		$$->file->name, $$->lineno);
>  	if (current_menu == $$)
>  		menu_end_menu();
> -} if_entry menu_entry choice_entry
> +} if_entry showif_entry menu_entry choice_entry
>  
>  %{
>  /* Include zconf.hash.c here so it can see the token constants. */
> @@ -125,6 +126,7 @@ option_name:
>  common_stmt:
>  	  T_EOL
>  	| if_stmt
> +	| showif_stmt
>  	| comment_stmt
>  	| config_stmt
>  	| menuconfig_stmt
> @@ -321,6 +323,14 @@ if_entry: T_IF expr nl
>  	$$ = menu_add_menu();
>  };
>  
> +showif_entry: T_SHOWIF expr nl

Naive question: nl and not T_EOL?

> +{
> +	printd(DEBUG_PARSE, "%s:%d:showif\n", zconf_curname(), zconf_lineno());
> +	menu_add_entry(NULL);
> +	menu_add_visibility($2);
> +	$$ = menu_add_menu();

This is what "if FOO" "endif" does too: add a, say, anonymous menu. That
_feels_ wrong, but I don't dare to dive deeper in the yacc code.

> +};
> +
>  if_end: end
>  {
>  	if (zconf_endtoken($1, T_IF, T_ENDIF)) {
> @@ -329,9 +339,20 @@ if_end: end
>  	}
>  };
>  
> +showif_end: end
> +{
> +	if (zconf_endtoken($1, T_SHOWIF, T_ENDIF)) {
> +		menu_end_menu();
> +		printd(DEBUG_PARSE, "%s:%d:endif\n", zconf_curname(), zconf_lineno());
> +	}
> +};
> +
>  if_stmt: if_entry if_block if_end
>  ;
>  
> +showif_stmt: showif_entry if_block showif_end
> +;
> +
>  if_block:
>  	  /* empty */
>  	| if_block common_stmt
> @@ -524,6 +545,7 @@ static const char *zconf_tokenname(int token)
>  	case T_CHOICE:		return "choice";
>  	case T_ENDCHOICE:	return "endchoice";
>  	case T_IF:		return "if";
> +	case T_SHOWIF:		return "showif";
>  	case T_ENDIF:		return "endif";
>  	case T_DEPENDS:		return "depends";
>  	case T_VISIBLE:		return "visible";

So this seems to work. I'd like to kick this around for some more time,
but unless some of the people that actually understand yacc and the
funky logic on which kconfig stands, start to shout something like this
should probably go in.

That being said, I'd like to bicycle-shed "showif". I'd rather reuse
"visibility", which is obscure but already used, apparently for the same
reason, and neatly matches the code this touches. I'll paste a (rough)
diff that uses "visibility" (and "endvisibility") at the end of this
message for people to play with, just to show what I mean. Please note
that this draft patch is just what zconf.y confessed after I tortured it
to say what I need.

Thanks,


Paul Bolle

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b05cc3d4a9be..75b7467efaab 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -344,7 +344,9 @@ void menu_finalize(struct menu *parent)
 		basedep = expr_eliminate_dups(expr_transform(basedep));
 		last_menu = NULL;
 		for (menu = parent->next; menu; menu = menu->next) {
-			dep = menu->prompt ? menu->prompt->visible.expr : menu->dep;
+			dep = menu->prompt ? menu->prompt->visible.expr
+			    : menu->visibility ? menu->visibility
+			    : menu->dep;
 			if (!expr_contains_symbol(dep, sym))
 				break;
 			if (expr_depends_symbol(dep, sym))
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 0f683cfa53e9..67c853474af8 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 static struct menu *current_menu, *current_entry;
 
 %}
-%expect 30
+%expect 32
 
 %union
 {
@@ -64,6 +64,7 @@ static struct menu *current_menu, *current_entry;
 %token <id>T_SELECT
 %token <id>T_RANGE
 %token <id>T_VISIBLE
+%token <id>T_ENDVISIBLE
 %token <id>T_OPTION
 %token <id>T_ON
 %token <string> T_WORD
@@ -84,7 +85,7 @@ static struct menu *current_menu, *current_entry;
 %type <expr> if_expr
 %type <id> end
 %type <id> option_name
-%type <menu> if_entry menu_entry choice_entry
+%type <menu> if_entry visible_entry menu_entry choice_entry
 %type <string> symbol_option_arg word_opt
 
 %destructor {
@@ -92,7 +93,7 @@ static struct menu *current_menu, *current_entry;
 		$$->file->name, $$->lineno);
 	if (current_menu == $$)
 		menu_end_menu();
-} if_entry menu_entry choice_entry
+} if_entry visible_entry menu_entry choice_entry
 
 %{
 /* Include zconf.hash.c here so it can see the token constants. */
@@ -125,6 +126,7 @@ option_name:
 common_stmt:
 	  T_EOL
 	| if_stmt
+	| visible_stmt
 	| comment_stmt
 	| config_stmt
 	| menuconfig_stmt
@@ -332,6 +334,27 @@ if_end: end
 if_stmt: if_entry if_block if_end
 ;
 
+/* visible entry */
+
+visible_entry: T_VISIBLE if_expr nl
+{
+	printd(DEBUG_PARSE, "%s:%d:visible\n", zconf_curname(), zconf_lineno());
+	menu_add_entry(NULL);
+	menu_add_visibility($2);
+	$$ = menu_add_menu();
+};
+
+visible_end: end
+{
+	if (zconf_endtoken($1, T_VISIBLE, T_ENDVISIBLE)) {
+		menu_end_menu();
+		printd(DEBUG_PARSE, "%s:%d:endvisible\n", zconf_curname(), zconf_lineno());
+	}
+};
+
+visible_stmt: visible_entry if_block visible_end
+;
+
 if_block:
 	  /* empty */
 	| if_block common_stmt
@@ -455,6 +478,7 @@ prompt:	  T_WORD
 end:	  T_ENDMENU T_EOL	{ $$ = $1; }
 	| T_ENDCHOICE T_EOL	{ $$ = $1; }
 	| T_ENDIF T_EOL		{ $$ = $1; }
+	| T_ENDVISIBLE T_EOL	{ $$ = $1; }
 ;
 
 nl:
@@ -527,6 +551,7 @@ static const char *zconf_tokenname(int token)
 	case T_ENDIF:		return "endif";
 	case T_DEPENDS:		return "depends";
 	case T_VISIBLE:		return "visible";
+	case T_ENDVISIBLE:	return "endvisible";
 	}
 	return "<token>";
 }

