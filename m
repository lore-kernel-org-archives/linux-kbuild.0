Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:61881 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966Ab3CJQCB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Mar 2013 12:02:01 -0400
Received: by mail-wi0-f182.google.com with SMTP id hi18so493176wib.3
        for <linux-kbuild@vger.kernel.org>; Sun, 10 Mar 2013 09:02:00 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH] kconfig: do randomise choice entries in presence of KCONFIG_ALLCONFIG
Date: Sun, 10 Mar 2013 17:01:53 +0100
Message-Id: <1362931313-31829-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <20130227214102.6d63544d@skate>
References: <20130227214102.6d63544d@skate>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>

Currently, randconfig does randomise choice entries, unless KCONFIG_ALLCONFIG
is specified.

For example, given those two files (Thomas' test-case):

    ---8<--- Config.test.in
    config OPTIONA
        bool "Option A"

    choice
        prompt "This is a choice"

    config CHOICE_OPTIONA
        bool "Choice Option A"

    config CHOICE_OPTIONB
        bool "Choice Option B"

    endchoice

    config OPTIONB
        bool "Option B"
    ---8<---

    ---8<--- config.defaults
    CONFIG_OPTIONA=y
    ---8<---

And running:
    ./scripts/kconfig/conf --randconfig Config.test.in

does properly randomise the two choice symbols (and the two booleans).

However, running:
    KCONFIG_ALLCONFIG=config.defaults \
    ./scripts/kconfig/conf --randconfig Config.test.in

does *not* reandomise the two choice entries, and only CHOICE_OPTIONA
will ever be selected. (OPTIONA will always be set (expected), and
OPTIONB will be be properly randomised (expected).)

This patch defers setting that a choice has a value until a symbol for
that choice is indeed set, so that choices are properly randomised when
KCONFIG_ALLCONFIG is set, but not if a symbol for that choice is set.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>

---
I'm not requestiong this change to go in -rc-fixes for now.
I would first like some review on this change.
---
 scripts/kconfig/confdata.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 13ddf11..17c0816 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -288,8 +288,6 @@ load:
 	for_all_symbols(i, sym) {
 		sym->flags |= SYMBOL_CHANGED;
 		sym->flags &= ~(def_flags|SYMBOL_VALID);
-		if (sym_is_choice(sym))
-			sym->flags |= def_flags;
 		switch (sym->type) {
 		case S_INT:
 		case S_HEX:
@@ -389,6 +387,7 @@ setsym:
 				break;
 			}
 			cs->def[def].tri = EXPR_OR(cs->def[def].tri, sym->def[def].tri);
+			cs->flags |= def_flags;
 		}
 	}
 	free(line);
-- 
1.7.2.5

