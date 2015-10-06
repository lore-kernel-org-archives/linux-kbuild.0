Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f193.google.com ([209.85.212.193]:34237 "EHLO
	mail-wi0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752759AbbJFJWe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Oct 2015 05:22:34 -0400
Date: Tue, 6 Oct 2015 11:22:31 +0200
From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: [PATCH v3] kbuild: document recursive dependency limitation /
 resolution
Message-ID: <20151006092231.GC2681@nebuchadnezzar.informatik.uni-erlangen.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <1443026498-15081-1-git-send-email-mcgrof@do-not-panic.com>
 <20151004134247.GA7528@nebuchadnezzar>
 <20151005230317.GQ14464@wotan.suse.de>
 <20151006081912.GA2681@nebuchadnezzar.informatik.uni-erlangen.de>
 <1444120375.2417.10.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <1444120375.2417.10.camel@tiscali.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: "Luis R. Rodriguez" <mcgrof@suse.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, herbert@gondor.apana.org.au, tiwai@suse.de, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, soos.mate@gmail.com, skl@det.ua.pt, iouliia@det.ua.pt, Armin Biere <biere@jku.at>, Julia Lawall <julia.lawall@lip6.fr>, ziegler@cs.fau.de


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Paul,

On Oct 06 '15 10:32, Paul Bolle wrote:
> Hi Valentin,
> 
> On di, 2015-10-06 at 10:19 +0200, Valentin Rothberg wrote:
> > I think that a general remark that using selects should be discouraged
> > as, besides causing the recursive issue, selects can also break
> > dependencies.
> 
> How do selects break dependencies?

Consider the following example (I also attached it as a path):

config A
    bool "CONFIG A"

config B
    bool "CONFIG B"
    depends on !A

config C
    bool "CONFIG C"
    depends on A
    select B

The option B and C are clearly contradicting with respect to A.
However, when A is set, C can be set as well because Kconfig does not
visit the dependencies of the select target (in this case B).  And since
Kconfig does not visit the dependencies, it breaks the dependencies of B
(!A).

You can test the example after applying the patch via:
   $ make KBUILD_KCONFIG=bad_selects.Kconfig menuconfig

Set A, then set C and you'll see that B is set to 'y' as well.

Kind regards,
  Valentin

--BXVAT5kNtrzKuDFl
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="bad_selects.patch"

diff --git a/bad_selects.Kconfig b/bad_selects.Kconfig
new file mode 100644
index 000000000000..989fc4e1fc17
--- /dev/null
+++ b/bad_selects.Kconfig
@@ -0,0 +1,11 @@
+config A
+    bool "CONFIG A"
+
+config B
+    bool "CONFIG B"
+    depends on !A
+
+config C
+    bool "CONFIG C"
+    depends on A
+    select B

--BXVAT5kNtrzKuDFl--
