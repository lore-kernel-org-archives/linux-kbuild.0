Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:54355 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753878Ab3DVVbn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 17:31:43 -0400
Received: by mail-wi0-f180.google.com with SMTP id h11so5195313wiv.13
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2013 14:31:42 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 5/6] kconfig: implement KCONFIG_PROBABILITY for randconfig
Date: Mon, 22 Apr 2013 23:31:24 +0200
Message-Id: <e5fafd7ae13357e3d5cc604c89022982022a8909.1366665922.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1366665921.git.yann.morin.1998@free.fr>
References: <cover.1366665921.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1366665921.git.yann.morin.1998@free.fr>
References: <cover.1366665921.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Peter Korsgaard <jacmet@uclibc.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Introduce a KCONFIG_PROBABILITY environment variable to tweak the
probability between 0 (all options off) and 100 (all options on).

[Patch originally written by Peter for Buildroot, see:    ]
[http://git.buildroot.org/buildroot/commit/?id=3435c1afb5 ]

Signed-off-by: Peter Korsgaard <jacmet@uclibc.org>
[yann.morin.1998@free.fr: add to Documentation/]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Documentation/kbuild/kconfig.txt |   17 +++++++++++++++++
 scripts/kconfig/confdata.c       |   22 +++++++++++++++++++---
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index dbf746b..1817128 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -98,6 +98,23 @@ You can set this to the integer value used to seed the RNG, if you want
 to somehow debug the behaviour of the kconfig parser/frontends.
 If not set, the current time will be used.
 
+KCONFIG_PROBABILITY
+--------------------------------------------------
+If this variable is set and contains an integer in the range [0,100],
+then its value is used as a probability each variable is set. If the
+variable is a tristate, there is then a further 50% chance it is set
+to either 'M' or 'Y'. If KCONFIG_PROBABILITY is not set, then the
+default is 50. Examples (rounded figures):
+	KCONFIG_PROBABILITY=33
+		boolean     :     no : 67%                yes: 33%
+		tristrate   :     no : 67%    mod: 16%    yes: 16%
+	KCONFIG_PROBABILITY=50
+		boolean     :     no : 50%                yes: 50%
+		tristate    :     no : 50%    mod: 25%    yes: 25%
+	KCONFIG_PROBABILITY=67
+		boolean     :     no : 33%                yes: 67%
+		tristrate   :     no : 33%    mod: 33%    yes: 33%
+
 ______________________________________________________________________
 Environment variables for 'silentoldconfig'
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 13ddf11..8d8d853 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1106,7 +1106,16 @@ static void set_all_choice_values(struct symbol *csym)
 void conf_set_all_new_symbols(enum conf_def_mode mode)
 {
 	struct symbol *sym, *csym;
-	int i, cnt;
+	int i, cnt, prob = 50;
+
+	if (mode == def_random) {
+		char *endp, *env = getenv("KCONFIG_PROBABILITY");
+		if (env && *env) {
+			int tmp = (int)strtol(env, &endp, 10);
+			if (*endp == '\0' && tmp >= 0 && tmp <= 100)
+				prob = tmp;
+		}
+	}
 
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym))
@@ -1125,8 +1134,15 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 				sym->def[S_DEF_USER].tri = no;
 				break;
 			case def_random:
-				cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
-				sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
+				cnt = (rand() % 100) - (100 - prob);
+				if (cnt < 0)
+					sym->def[S_DEF_USER].tri = no;
+				else
+					if ((sym_get_type(sym) == S_TRISTATE)
+					    && (cnt > prob/2))
+						sym->def[S_DEF_USER].tri = mod;
+					else
+						sym->def[S_DEF_USER].tri = yes;
 				break;
 			default:
 				continue;
-- 
1.7.10.4

