Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.211.182]:54411 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933040AbZKXPCz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 10:02:55 -0500
Received: by ywh12 with SMTP id 12so6446217ywh.21
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2009 07:03:01 -0800 (PST)
Date: Tue, 24 Nov 2009 09:14:41 -0600
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH v3 2/3] scripts/package: add KBUILD_PKG_ROOTCMD variable
Message-ID: <20091124151441.GC14731@progeny.tock>
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

Let the deb-pkg target acquire (fake) root privileges before
running commands that need them.  Without such privileges,
deb-pkg errors out because chown fails.

The new KBUILD_PKG_ROOTCMD variable, if defined, is used as a
command to run other commands with possibly fake elevated
privileges.  Since this is not needed for the tar-pkg and rpm-pkg
targets, it is only used by deb-pkg.  If it is not defined, the
behavior is as before, and the user will have to rerun make as
root.

In other words, as a shortcut, instead of running 'make oldconfig &&
make && fakeroot -u make deb-pkg', one can use the single command
'make oldconfig deb-pkg KBUILD_PKG_ROOTCMD="fakeroot -u"'.

Suggested-by: Ryan Anderson <ryan@michonline.com>
Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
---
This patch does not use the variable in the rpm-pkg or tar-pkg targets
any more, since they already cope fine as non-root.

 scripts/package/Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index f67cc88..5c0b43a 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -79,7 +79,8 @@ clean-files += $(objtree)/binkernel.spec
 # ---------------------------------------------------------------------------
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
+	$(KBUILD_PKG_ROOTCMD) $(CONFIG_SHELL) \
+		$(srctree)/scripts/package/builddeb
 
 clean-dirs += $(objtree)/debian/
 
-- 
1.6.5.3

