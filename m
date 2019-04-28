Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:59118 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726299AbfD1RoF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Apr 2019 13:44:05 -0400
Date: Sun, 28 Apr 2019 13:43:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH] unicode: refactor the rule for regenerating utf8data.h
Message-ID: <20190428174315.GC24089@mit.edu>
References: <1556346241-10451-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAS2vTGF0dYJ67Ct2xDL=7qxYhhK-VoVHfkqDu0d8ULd+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS2vTGF0dYJ67Ct2xDL=7qxYhhK-VoVHfkqDu0d8ULd+g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Olaf Weber <olaf@sgi.com>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>, Gabriel Krisman Bertazi <krisman@collabora.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-fsdevel@vger.kernel.org

Thanks, for the suggestion and the patch!  I agree it's much better
with your proposed change (and it gets mkutf8data out of your hair :-)

I did need to make one change to your patch in order for it to work
correctly with a build directory.  That is, to support

	make -O /build/ext4 REGENERATE_UTF8DATA=1 fs/unicode/

I'll apply it to the ext4 git tree with this change.

     	      	     	      	   - Ted

diff --git a/fs/unicode/Makefile b/fs/unicode/Makefile
index 1a109b7a1da9..45955264ac04 100644
--- a/fs/unicode/Makefile
+++ b/fs/unicode/Makefile
@@ -14,13 +14,13 @@ $(obj)/utf8-norm.o: $(obj)/utf8data.h
 
 quiet_cmd_utf8data = GEN     $@
       cmd_utf8data = $(obj)/mkutf8data \
-		-a $(src)/DerivedAge.txt \
-		-c $(src)/DerivedCombiningClass.txt \
-		-p $(src)/DerivedCoreProperties.txt \
-		-d $(src)/UnicodeData.txt \
-		-f $(src)/CaseFolding.txt \
-		-n $(src)/NormalizationCorrections.txt \
-		-t $(src)/NormalizationTest.txt \
+		-a $(srctree)/$(src)/DerivedAge.txt \
+		-c $(srctree)/$(src)/DerivedCombiningClass.txt \
+		-p $(srctree)/$(src)/DerivedCoreProperties.txt \
+		-d $(srctree)/$(src)/UnicodeData.txt \
+		-f $(srctree)/$(src)/CaseFolding.txt \
+		-n $(srctree)/$(src)/NormalizationCorrections.txt \
+		-t $(srctree)/$(src)/NormalizationTest.txt \
 		-o $@
 
 $(obj)/utf8data.h: $(filter %.txt, $(cmd_utf8data)) $(obj)/mkutf8data FORCE
