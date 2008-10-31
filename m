Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex.2n.cz ([213.29.92.11]:6014 "EHLO ex.2n.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751236AbYJaNDn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Oct 2008 09:03:43 -0400
Date: Fri, 31 Oct 2008 14:03:40 +0100
Subject: Re: [PATCH] conf.c: use return to exit from main()
Message-ID: <20081031130340.GA20563@michl.2n.cz>
References: <20081031110905.GA20416@michl.2n.cz> <490AFB43.30504@cateee.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <490AFB43.30504@cateee.net>
From: Ladislav Michl <ladis@linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Giacomo A. Catenazzi" <cate@cateee.net>
Cc: linux-kbuild@vger.kernel.org

On Fri, Oct 31, 2008 at 01:34:11PM +0100, Giacomo A. Catenazzi wrote:
> With your change, it is more difficult to add other errors and to test
> error values, because AFAIK the EXIT_FAILURE is not fix.
> 
> For these two reason, and because I don't think this program
> could be ported in a generic C platform, I think you should
> not uset EXIT_FAILURE.

Well, every POSIX platform I know about defines EXIT_FAILURE as 1.
However POSIX itself requires EXIT_FAILURE to evaluate to a
non-zero value so your statement is perfectly valid.
Here it is:

Replace exit() with return.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 3e1057f..5bcea31 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -469,16 +469,15 @@ int main(int ac, char **av)
 			break;
 		case 'h':
 			printf(_("See README for usage info\n"));
-			exit(0);
-			break;
+			return 0;
 		default:
 			fprintf(stderr, _("See README for usage info\n"));
-			exit(1);
+			return 1;
 		}
 	}
 	if (ac == optind) {
 		printf(_("%s: Kconfig file missing\n"), av[0]);
-		exit(1);
+		return 1;
 	}
 	name = av[optind];
 	conf_parse(name);
@@ -492,7 +491,7 @@ int main(int ac, char **av)
 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
 				"*** \"make menuconfig\" or \"make xconfig\").\n"
 				"***\n"));
-			exit(1);
+			return 1;
 		}
 	}
 
@@ -504,7 +503,7 @@ int main(int ac, char **av)
 			printf(_("***\n"
 				"*** Can't find default configuration \"%s\"!\n"
 				"***\n"), defconfig_file);
-			exit(1);
+			return 1;
 		}
 		break;
 	case ask_silent:
@@ -586,7 +585,7 @@ int main(int ac, char **av)
 		 */
 		if (conf_get_changed() && conf_write(NULL)) {
 			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-			exit(1);
+			return 1;
 		}
 		if (conf_write_autoconf()) {
 			fprintf(stderr, _("\n*** Error during update of the kernel configuration.\n\n"));
@@ -595,7 +594,7 @@ int main(int ac, char **av)
 	} else {
 		if (conf_write(NULL)) {
 			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-			exit(1);
+			return 1;
 		}
 	}
 	return 0;
