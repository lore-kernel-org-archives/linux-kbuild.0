Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:39274 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbeBWLtF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 06:49:05 -0500
Received: by mail-lf0-f43.google.com with SMTP id f75so6951537lfg.6
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 03:49:04 -0800 (PST)
Date: Fri, 23 Feb 2018 12:49:01 +0100
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH v3] kconfig: only write '# CONFIG_FOO is not set' for visible
 symbols
Message-ID: <20180223114901.lg5syy5zrf75mndd@huvuddator>
References: <20180223060901.4052-1-ulfalizer@gmail.com>
 <CAFkk2KQPjeyE-E_TW3NBwFXbE-Q2mNnn1yAFkoA5w6xLQQ9hrw@mail.gmail.com>
 <CAK8P3a1jtOWVzJFQjSjqbGHZSGGMkii1Bi5qpdAG1AvWjPKbLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1jtOWVzJFQjSjqbGHZSGGMkii1Bi5qpdAG1AvWjPKbLg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Sam Ravnborg <sam@ravnborg.org>

=== Background ===

 - Visible n-valued bool/tristate symbols generate a
   '# CONFIG_FOO is not set' line in the .config file. The idea is to
   remember the user selection without having to set a Makefile
   variable. Having n correspond to the variable being undefined in the
   Makefiles makes for easy CONFIG_* tests.

 - Invisible n-valued bool/tristate symbols normally do not generate a
   '# CONFIG_FOO is not set' line, because user values from .config
   files have no effect on invisible symbols anyway.

Currently, there is one exception to this rule: Any bool/tristate symbol
that gets the value n through a 'default' property generates a
'# CONFIG_FOO is not set' line, even if the symbol is invisible.

Note that this only applies to explicitly given defaults, and not when
the symbol implicitly defaults to n (like bool/tristate symbols without
'default' properties do).

This is inconsistent, and seems redundant:

  - As mentioned, the '# CONFIG_FOO is not set' won't affect the symbol
    once the .config is read back in.

  - Even if the symbol is invisible at first but becomes visible later,
    there shouldn't be any harm in recalculating the default value
    rather than viewing the '# CONFIG_FOO is not set' as a previous
    user value of n.

=== Changes ===

Change sym_calc_value() to only set SYMBOL_WRITE (write to .config) for
non-n-valued 'default' properties.

Note that SYMBOL_WRITE is always set for visible symbols regardless of whether
they have 'default' properties or not, so this change only affects invisible
symbols.

This reduces the size of the x86 .config on my system by about 1% (due
to removed '# CONFIG_FOO is not set' entries).

One side effect of (and the main motivation for) this change is making
the following two definitions behave exactly the same:

	config FOO
		bool

	config FOO
		bool
		default n

With this change, neither of these will generate a
'# CONFIG_FOO is not set' line (assuming FOO isn't selected/implied).
That might make it clearer to people that a bare 'default n' is
redundant.

This change only affects generated .config files and not autoconf.h:
autoconf.h only includes #defines for non-n bool/tristate symbols.

=== Testing ===

The following testing was done with the x86 Kconfigs:

 - .config files generated before and after the change were compared to
   verify that the only difference is some '# CONFIG_FOO is not set'
   entries disappearing. A couple of these were inspected manually, and
   most turned out to be from redundant 'default n/def_bool n'
   properties.

 - The generated include/generated/autoconf.h was compared before and
   after the change and verified to be identical.

 - As a sanity check, the same modification was done to Kconfiglib.
   The Kconfiglib test suite was then run to check for any mismatches
   against the output of the C implementation.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
Changes in v3:
Mention that SYMBOL_WRITE is always set for visible symbols. It might look like
this change would affect those too otherwise.

Changes in v2:
Make it more explicit in the commit title and message that only invisible
symbols are affected by the change. The previous commit title was
"do not write 'n' defaults to .config".

 scripts/kconfig/symbol.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index cca9663be5dd..02eb8b10a83c 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -403,9 +403,10 @@ void sym_calc_value(struct symbol *sym)
 			if (!sym_is_choice(sym)) {
 				prop = sym_get_default_prop(sym);
 				if (prop) {
-					sym->flags |= SYMBOL_WRITE;
 					newval.tri = EXPR_AND(expr_calc_value(prop->expr),
 							      prop->visible.tri);
+					if (newval.tri != no)
+						sym->flags |= SYMBOL_WRITE;
 				}
 				if (sym->implied.tri != no) {
 					sym->flags |= SYMBOL_WRITE;
-- 
2.14.1

