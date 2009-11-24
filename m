Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f187.google.com ([209.85.210.187]:55520 "EHLO
	mail-yx0-f187.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933363AbZKXPKK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 10:10:10 -0500
Received: by yxe17 with SMTP id 17so5704299yxe.33
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2009 07:10:15 -0800 (PST)
Date: Tue, 24 Nov 2009 09:21:56 -0600
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH v3 3/3] scripts/package: deb-pkg: use fakeroot if available
Message-ID: <20091124152156.GD14731@progeny.tock>
References: <20091014064622.GA8711@progeny.tock>
 <20091014071627.GA6256@merkur.ravnborg.org>
 <200910141159.03799.elendil@planet.nl>
 <20091014110331.GZ28231@baikonur.stro.at>
 <20091015133139.GA6718@progeny.tock>
 <20091015133532.GB6718@progeny.tock>
 <4B0BC306.9010009@suse.cz>
 <20091124150904.GA14731@progeny.tock>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091124150904.GA14731@progeny.tock>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Sam Ravnborg <sam@ravnborg.org>, Frans Pop <elendil@planet.nl>

Running "make deb-pkg" requires setting KBUILD_PKG_ROOTCMD or
becoming root oneself or it errors out.  Unless already running
as root or KBUILD_PKG_ROOTCMD is already set, use fakeroot as a
good default.

With this patch applied, you can run "make oldconfig rpm-pkg" as
an ordinary user to build a binary package for an updated kernel
tree and it should just work.

fakeroot is too zealous by default in treating files as owned by
root.  Its wrapped stat() sets st_uid and st_gid to 0 for all
files, which causes Git to go on a wild goose chase if
CONFIG_LOCALVERSION_AUTO is set, checking if any file's content
has changed along with its stat information.  Avoid this by
telling fakeroot to use the actual owner and group for
preexisting files, by passing it the -u option.

Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
---
The appropriate value for KBUILD_PKG_ROOTCMD is determined in the
rules for deb-pkg instead of the outer Makefile to avoid having to
fork for 'which' and 'id' for unrelated targets.

Before this change, the command for the deb-pkg target was not
abbreviated, so that normal output included something like "bash
/tmp/buildd/scripts/package/builddeb".  It is a shame to get rid of
this kind of transparency, but when I tried lying by setting
quiet_cmd_builddeb to that string, it was confusing to see 'make'
claiming to run that command through bash and not through fakeroot.
So I punted by abbreviating to BUILDDEB.  The curious can always use
"V=1".

 scripts/package/Makefile |   21 +++++++++++++++++++--
 1 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 5c0b43a..62fcc3a 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -77,10 +77,27 @@ clean-files += $(objtree)/binkernel.spec
 
 # Deb target
 # ---------------------------------------------------------------------------
+quiet_cmd_builddeb = BUILDDEB
+      cmd_builddeb = set -e; \
+	test `id -u` = 0 || \
+	test -n "$(KBUILD_PKG_ROOTCMD)" || { \
+		which fakeroot >/dev/null 2>&1 && \
+		KBUILD_PKG_ROOTCMD="fakeroot -u"; \
+	} || { \
+		echo; \
+		echo "builddeb must be run as root (or using fakeroot)."; \
+		echo "KBUILD_PKG_ROOTCMD is unset and fakeroot not found."; \
+		echo "Try setting KBUILD_PKG_ROOTCMD to a command to acquire"; \
+		echo "root privileges (e.g., 'fakeroot -u' or 'sudo')."; \
+		false; \
+	} && \
+	\
+	$$KBUILD_PKG_ROOTCMD $(CONFIG_SHELL) \
+		$(srctree)/scripts/package/builddeb
+
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(KBUILD_PKG_ROOTCMD) $(CONFIG_SHELL) \
-		$(srctree)/scripts/package/builddeb
+	$(call cmd,builddeb)
 
 clean-dirs += $(objtree)/debian/
 
-- 
1.6.5.3

