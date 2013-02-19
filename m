Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.nt1.in ([62.90.139.210]:59526 "EHLO mail.nt1.in"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756989Ab3BSAzo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2013 19:55:44 -0500
Date: Tue, 19 Feb 2013 02:24:26 +0200
From: Regid Ichira <regid23@nt1.in>
Subject: [PATCH] kbuild: Fix missing '\n' for NEW symbols in yes "" | make
 oldconfig >conf.new
Message-ID: <20130219002426.GA19381@nt1.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Jonathan Nieder <jrnieder@gmail.com>, 636029@bugs.debian.org

From: Ben Hutchings <ben@decadent.org.uk>

According to Documentation/kbuild/kconfig.txt, the commands:

    yes "" | make oldconfig >conf.new
    grep "(NEW)" conf.new

should list the new config symbols with their default values.
However, currently there is no line break after each new symbol.  When
kconfig is interactive the user will type a new-line at this point,
but when non-interactive kconfig must print it.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
Reference: http://bugs.debian.org/636029
Reported-by: 636029-submitter@bugs.debian.org
[regid23@nt1.in: Adjusted Ben's work to apply cleanly to this tree]
Tested-by: Regid Ichira <regid23@nt1.in>

Applied and tested to 3.8.0-rc4, on top of commit
5da1f88 - Linus Torvalds, 2013-01-18 : Merge tag 'usb-3.8-rc4' of git:/
---
 scripts/kconfig/conf.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 4da3b4a..e39fcd8 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -36,6 +36,7 @@ enum input_mode {
 } input_mode = oldaskconfig;
 
 static int indent = 1;
+static int tty_stdio;
 static int valid_stdin = 1;
 static int sync_kconfig;
 static int conf_cnt;
@@ -108,6 +109,8 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	case oldaskconfig:
 		fflush(stdout);
 		xfgets(line, 128, stdin);
+		if (!tty_stdio)
+			printf("\n");
 		return 1;
 	default:
 		break;
@@ -495,6 +498,8 @@ int main(int ac, char **av)
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
+	tty_stdio = isatty(0) && isatty(1) && isatty(2);
+
 	while ((opt = getopt_long(ac, av, "", long_opts, NULL)) != -1) {
 		input_mode = (enum input_mode)opt;
 		switch (opt) {
@@ -621,7 +626,7 @@ int main(int ac, char **av)
 				return 1;
 			}
 		}
-		valid_stdin = isatty(0) && isatty(1) && isatty(2);
+		valid_stdin = tty_stdio;
 	}
 
 	switch (input_mode) {
-- 
1.7.10.4
