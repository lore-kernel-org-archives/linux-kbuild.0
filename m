Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:16341 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153AbcBKOZq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Feb 2016 09:25:46 -0500
Date: Thu, 11 Feb 2016 14:25:43 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH] ld-version: Drop the 4th and 5th version components
Message-ID: <alpine.DEB.2.00.1602111359390.15885@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Michal Marek <mmarek@suse.com>, James Hogan <james.hogan@imgtec.com>, linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

... making upstream development binutils snapshots work as expected,
e.g.:

$ mips64el-linux-ld --version
GNU ld (GNU Binutils) 2.20.1.20100303
[...]
$ 

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
 It may well actually have been a release mistake with the proper 2.20.1 
maintenance release as I reckon the development vs release build switch is 
a knob that used to require to be flipped in the sources by the release 
manager; maybe it still does.  Either way this version guarantees all the 
2.20.1 stuff to be present as the version number is only bumped up as a 
release is being made, so any prior snapshot would report 2.20.0.20100302, 
etc., or maybe even 2.20.0.20100303 if made earlier on on the same day.

 So please apply, or anyone is welcome to improve it, as my limited awk-fu 
(which I'll be happy to get corrected) tells me the script doesn't really 
terminate parsing on a non-point-non-digit character.

 NB comments in scripts/Kbuild.include around `ld-version' have not been 
accordingly updated in the course of changes made to `ld-version.sh' and 
they still need such an update, unless we right-shift the version code 
calculated back by 4 decimal digits, which I hesitated doing here for 
simplicity.  What was the original reason to add the 4th and 5th 
components?

  Maciej

linux-mips-ld-version-fix.diff
Index: linux-20160211/scripts/ld-version.sh
===================================================================
--- linux-20160211.orig/scripts/ld-version.sh
+++ linux-20160211/scripts/ld-version.sh
@@ -5,6 +5,6 @@
 	gsub(".*version ", "");
 	gsub("-.*", "");
 	split($1,a, ".");
-	print a[1]*100000000 + a[2]*1000000 + a[3]*10000 + a[4]*100 + a[5];
+	print a[1]*100000000 + a[2]*1000000 + a[3]*10000;
 	exit
 	}
