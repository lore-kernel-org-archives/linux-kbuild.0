Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex.2n.cz ([213.29.92.11]:57007 "EHLO ex.2n.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750753AbYJaLJI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Oct 2008 07:09:08 -0400
Received: from ladis by localhost with local (Exim 3.36 #1 (Debian))	id
 1KvrsH-0005Jg-00	for <linux-kbuild@vger.kernel.org>; Fri, 31 Oct 2008
 12:09:05 +0100
Date: Fri, 31 Oct 2008 12:09:05 +0100
Subject: [PATCH] conf.c: use return to exit from main()
Message-ID: <20081031110905.GA20416@michl.2n.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
From: Ladislav Michl <ladis@linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Replace exit() with return and use standard exit values. Good for
code size and readability, although I have to admit both has very
little impact on real world... :-)

   text    data     bss     dec     hex filename
  60608    2084    5908   68600   10bf8 scripts/kconfig/conf_orig
  60528    2084    5908   68520   10ba8 scripts/kconfig/conf

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 3e1057f..70f1f99 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -70,7 +70,7 @@ static void check_stdin(void)
 		printf(_("aborted!\n\n"));
 		printf(_("Console input/output is redirected. "));
 		printf(_("Run 'make oldconfig' to update configuration.\n\n"));
-		exit(1);
+		exit(EXIT_FAILURE);
 	}
 }
 
@@ -469,16 +469,15 @@ int main(int ac, char **av)
 			break;
 		case 'h':
 			printf(_("See README for usage info\n"));
-			exit(0);
-			break;
+			return EXIT_SUCCESS;
 		default:
 			fprintf(stderr, _("See README for usage info\n"));
-			exit(1);
+			return EXIT_FAILURE;
 		}
 	}
 	if (ac == optind) {
 		printf(_("%s: Kconfig file missing\n"), av[0]);
-		exit(1);
+		return EXIT_FAILURE;
 	}
 	name = av[optind];
 	conf_parse(name);
@@ -492,7 +491,7 @@ int main(int ac, char **av)
 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
 				"*** \"make menuconfig\" or \"make xconfig\").\n"
 				"***\n"));
-			exit(1);
+			return EXIT_FAILURE;
 		}
 	}
 
@@ -504,7 +503,7 @@ int main(int ac, char **av)
 			printf(_("***\n"
 				"*** Can't find default configuration \"%s\"!\n"
 				"***\n"), defconfig_file);
-			exit(1);
+			return EXIT_FAILURE;
 		}
 		break;
 	case ask_silent:
@@ -543,7 +542,7 @@ int main(int ac, char **av)
 			if (name && *name) {
 				fprintf(stderr,
 					_("\n*** Kernel configuration requires explicit update.\n\n"));
-				return 1;
+				return EXIT_FAILURE;
 			}
 		}
 		valid_stdin = isatty(0) && isatty(1) && isatty(2);
@@ -586,17 +585,17 @@ int main(int ac, char **av)
 		 */
 		if (conf_get_changed() && conf_write(NULL)) {
 			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-			exit(1);
+			return EXIT_FAILURE;
 		}
 		if (conf_write_autoconf()) {
 			fprintf(stderr, _("\n*** Error during update of the kernel configuration.\n\n"));
-			return 1;
+			return EXIT_FAILURE;
 		}
 	} else {
 		if (conf_write(NULL)) {
 			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-			exit(1);
+			return EXIT_FAILURE;
 		}
 	}
-	return 0;
+	return EXIT_SUCCESS;
 }
