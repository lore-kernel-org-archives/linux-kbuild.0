Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:36957 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbeICOXB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Sep 2018 10:23:01 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 1/3] kconfig: support an environment variable for non-interactive syncconfig
Date: Mon,  3 Sep 2018 19:01:54 +0900
Message-Id: <1535968916-9159-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
References: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>, Laura Abbott <labbott@redhat.com>, Jiri Kosina <jkosina@suse.cz>, Ben Hutchings <ben.hutchings@codethink.co.uk>, =?UTF-8?q?Michal=20Such=8F=AB=A1nek?= <msuchanek@suse.de>, Takashi Iwai <tiwai@suse.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

When Kconfig files are updated, or build environments etc. are changed,
'make syncconfig' is invoked, which will show prompts if new config
options are available.  Users must explicitly input values for all
new symbols.  This is the conventional behavior for the kernel build.

However, it would be useful to process this non-interactively in such
cases as package building.

Package maintainers create source packages with the .config configured
on their machines.  Package builders may work on different machine
environments, where different compilers are installed.

With the recent changes in Kconfig, the .config contents depend on
the compiler.  During package building, it is not sensible to show
prompts for new symbols; it would be just annoys script automation.

Add a new switch, KCONFIG_NONINTERACTIVE_UPDATE.  If this environment
variable is set, Kconfig will sync the configuration non-interactively.
All new symbols are silently set to their default values.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/kconfig.txt | 6 ++++++
 scripts/kconfig/conf.c           | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index 68c8291..5c29c3f 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -129,6 +129,12 @@ KCONFIG_NOSILENTUPDATE
 If this variable has a non-blank value, it prevents silent kernel
 config updates (requires explicit updates).
 
+KCONFIG_NONINTERACTIVE_UPDATE
+--------------------------------------------------
+If this variable has a non-blank value, it prevents user input prompts
+from showing up even when new symbols are available.  All new symbols
+are silently set to their default values.
+
 KCONFIG_AUTOCONFIG
 --------------------------------------------------
 This environment variable can be set to specify the path & name of the
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 7b2b372..b64bbc0 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -680,6 +680,11 @@ int main(int ac, char **av)
 	case oldconfig:
 	case listnewconfig:
 	case syncconfig:
+		if (input_mode == syncconfig) {
+			name = getenv("KCONFIG_NONINTERACTIVE_UPDATE");
+			if (name && *name)
+				break;
+		}
 		/* Update until a loop caused no more changes */
 		do {
 			conf_cnt = 0;
-- 
2.7.4
