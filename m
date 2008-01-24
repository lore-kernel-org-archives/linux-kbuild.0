Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37476 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758940AbYAXWDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:53 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 17/77] kconfig: use getopt() in conf.c for handling command line arguments
Date: Thu, 24 Jan 2008 23:02:58 +0100
Message-Id: <1201212238-4369-17-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andres Salomon <dilinger@debian.org>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: Andres Salomon <dilinger@debian.org>

Switch from doing our own parsing of command line arguments to
using getopt(3) to do it.  Aside from simplifying things, this allows us to
specify multiple arguments; the old code could only accept two arguments
(input_mode and kconfig name).

Note some subtle changes:
 - The argument '-?' is no longer supported.
 - '-h' is not treated as an error, so output goes to stdout, and we
   exit with '0'.
 - There is no compatibility checking amongst arguments; the last option
   will simply override earlier options.  For example, 'conf -n -y foo'
   is perfectly valid now (input_mode will be set_yes).  Previously, that
   would have been an error ("can't find file -y").

Signed-off-by: Andres Salomon <dilinger@debian.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/conf.c |   24 +++++++++++-------------
 1 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 8d6f174..d4737d3 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -495,12 +495,12 @@ static void check_conf(struct menu *menu)
 
 int main(int ac, char **av)
 {
-	int i = 1;
+	int opt;
 	const char *name;
 	struct stat tmpstat;
 
-	if (ac > i && av[i][0] == '-') {
-		switch (av[i++][1]) {
+	while ((opt = getopt(ac, av, "osdD:nmyrh")) != -1) {
+		switch (opt) {
 		case 'o':
 			input_mode = ask_new;
 			break;
@@ -513,12 +513,7 @@ int main(int ac, char **av)
 			break;
 		case 'D':
 			input_mode = set_default;
-			defconfig_file = av[i++];
-			if (!defconfig_file) {
-				printf(_("%s: No default config file specified\n"),
-					av[0]);
-				exit(1);
-			}
+			defconfig_file = optarg;
 			break;
 		case 'n':
 			input_mode = set_no;
@@ -534,16 +529,19 @@ int main(int ac, char **av)
 			srandom(time(NULL));
 			break;
 		case 'h':
-		case '?':
-			fprintf(stderr, "See README for usage info\n");
+			printf("See README for usage info\n");
 			exit(0);
+			break;
+		default:
+			fprintf(stderr, "See README for usage info\n");
+			exit(1);
 		}
 	}
-  	name = av[i];
-	if (!name) {
+	if (ac == optind) {
 		printf(_("%s: Kconfig file missing\n"), av[0]);
 		exit(1);
 	}
+	name = av[optind];
 	conf_parse(name);
 	//zconfdump(stdout);
 	switch (input_mode) {
-- 
1.5.4.rc3.14.g44397

