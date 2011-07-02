Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:35815 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936Ab1GBFKv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Jul 2011 01:10:51 -0400
Received: by mail-iw0-f174.google.com with SMTP id 6so3288158iwn.19
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jul 2011 22:10:51 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 3/5] kconfig/conf: add command line options' description
Date: Sat,  2 Jul 2011 01:10:38 -0400
Message-Id: <1309583440-4795-4-git-send-email-lacombar@gmail.com>
In-Reply-To: <1309583440-4795-1-git-send-email-lacombar@gmail.com>
References: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
 <1309583440-4795-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c |   32 +++++++++++++++++++++++++++++++-
 1 files changed, 31 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 6431f5c..819ab18 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -457,8 +457,28 @@ static struct option long_opts[] = {
 	{NULL, 0, NULL, 0}
 };
 
+static void conf_usage(const char *progname)
+{
+
+	printf("Usage: %s [option] <kconfig-file>\n", progname);
+	printf("[option] is _one_ of the following:\n");
+	printf("  --listnewconfig         List new options\n");
+	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
+	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
+	printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
+	printf("  --oldnoconfig           Same as silentoldconfig but set new symbols to no\n");
+	printf("  --defconfig <file>      New config with default defined in <file>\n");
+	printf("  --savedefconfig <file>  Save the minimal current configuration to <file>\n");
+	printf("  --allnoconfig           New config where all options are answered with no\n");
+	printf("  --allyesconfig          New config where all options are answered with yes\n");
+	printf("  --allmodconfig          New config where all options are answered with mod\n");
+	printf("  --alldefconfig          New config with all symbols set to default\n");
+	printf("  --randconfig            New config with random answer to all options\n");
+}
+
 int main(int ac, char **av)
 {
+	const char *progname = av[0];
 	int opt;
 	const char *name, *defconfig_file = NULL /* gcc uninit */;
 	struct stat tmpstat;
@@ -492,14 +512,24 @@ int main(int ac, char **av)
 			srand(seed);
 			break;
 		}
+		case oldaskconfig:
+		case oldconfig:
+		case allnoconfig:
+		case allyesconfig:
+		case allmodconfig:
+		case alldefconfig:
+		case listnewconfig:
+		case oldnoconfig:
+			break;
 		case '?':
-			fprintf(stderr, _("See README for usage info\n"));
+			conf_usage(progname);
 			exit(1);
 			break;
 		}
 	}
 	if (ac == optind) {
 		printf(_("%s: Kconfig file missing\n"), av[0]);
+		conf_usage(progname);
 		exit(1);
 	}
 	name = av[optind];
-- 
1.7.3.4.574.g608b.dirty

