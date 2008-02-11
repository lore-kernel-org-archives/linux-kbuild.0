Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from barikada.upol.cz ([158.194.242.200]:48063 "EHLO
	barikada.upol.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751845AbYBKC2Z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 10 Feb 2008 21:28:25 -0500
Received: from flower (flower.upol.cz [158.194.64.22])
	by barikada.upol.cz (Spam Firewall) with ESMTP id CCBB31D9D53
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2008 03:28:22 +0100 (CET)
Received: from flower (flower.upol.cz [158.194.64.22]) by barikada.upol.cz with ESMTP id CoVSWvFSPfCh3jDo for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2008 03:28:22 +0100 (CET)
Received: from olecom by flower with local (Exim 4.63)
	(envelope-from <olecom@flower.upol.cz>)
	id 1JOOgq-0007P8-E6
	for linux-kbuild@vger.kernel.org; Mon, 11 Feb 2008 03:46:40 +0100
Date: Mon, 11 Feb 2008 03:46:40 +0100
Subject: shell command is empty, when "silent" (Re: make V=1 broken)
Message-ID: <20080211024640.GF24008@flower.upol.cz>
References: <20080210225939.GB15317@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080210225939.GB15317@uranus.ravnborg.org>
From: Oleg Verych <olecom@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <linux-kbuild@vger.kernel.org>

On Sun, Feb 10, 2008 at 11:59:40PM +0100, Sam Ravnborg wrote:
> make V=1 is broken at the moment.
> 
> I do not have possibility to look at it until
> in ~20 hours.
> So if anyone can help until then...
> 
> To reproduce:
> 
> make defconfig
> make V=1
> 

Somehow $(quiet) == "", when it should be "silent_". Thus command is
empty (just ";"), which is error.

,--`make V=1`--
|  GEN     /dev/shm/blinux/Makefile
|set -e; ; mkdir -p include/linux/; 
[]
|/bin/sh: Syntax error: ";" unexpected
`--

That "silent" juggling with `echo` is overhead, thus remove it.

Signed-off-by: Oleg Verych <olecom@flower.upol.cz>
--
My (i.e. wrong:) view of the patch. Side effect -- empty line in V=2
garbage output.

--- /mnt/work/pc/kernel.org/git-repoes/linux-2.6/scripts/Kbuild.include	2008-02-11 02:05:18.619239750 +0100
+++ /mnt/zdev0/linux-2.6/scripts/Kbuild.include	2008-02-11 03:30:11.000000000 +0100
@@ -39,19 +39,18 @@
 # - If they are equal no change, and no timestamp update
 # - stdin is piped in from the first prerequisite ($<) so one has
 #   to specify a valid file as first prerequisite (often the kbuild file)
- quiet_chk_filechk = echo '  CHK     $@'
-silent_chk_filechk = :
- quiet_upd_filechk = echo '  UPD     $@'
-silent_upd_filechk = :
+quiet_chk_filechk = '  CHK     $@'
+quiet_upd_filechk = '  UPD     $@'
+
 define filechk
 	$(Q)set -e;				\
-	$($(quiet)chk_filechk);			\
+	echo $($(quiet)chk_filechk);		\
 	mkdir -p $(dir $@);			\
 	$(filechk_$(1)) < $< > $@.tmp;		\
 	if [ -r $@ ] && cmp -s $@ $@.tmp; then	\
 		rm -f $@.tmp;			\
 	else					\
-		$($(quiet)upd_filechk);		\
+		echo $($(quiet)upd_filechk);	\
 		mv -f $@.tmp $@;		\
 	fi
 endef
