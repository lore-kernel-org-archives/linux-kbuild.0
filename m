Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from telcs.lanten.hu ([212.52.167.247]:47708 "EHLO telcs.lanten.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753836Ab0CEAO5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Mar 2010 19:14:57 -0500
Received: from dsl51b6a168.pool.t-online.hu ([81.182.161.104] helo=[192.168.55.114])
	by telcs.lanten.hu with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69)
	(envelope-from <fejes@joco.name>)
	id 1NnI7B-0006eD-8E
	for linux-kbuild@vger.kernel.org; Thu, 04 Mar 2010 21:57:50 +0100
Message-ID: <4B901ECD.5080707@joco.name>
Date: Thu, 04 Mar 2010 21:57:49 +0100
From: FEJES Jozsef <fejes@joco.name>
MIME-Version: 1.0
Subject: [PATCH] deb-pkg md5sums
Content-Type: multipart/mixed;
 boundary="------------050105080202050602060607"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------050105080202050602060607
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I would like an md5sums file in the packages built by the deb-pkg 
script. It's a quite standard and useful thing to do.

Please consider my patch (or something similar) for inclusion.

My patch does the same thing as dh_md5sums, without any fancy options 
which are unnecessary in this case.

-- 
[ FEJES Jozsef ]
http://joco.name

--------------050105080202050602060607
Content-Type: text/plain;
 name="debpkgmd5.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="debpkgmd5.patch"

diff -ur a/scripts/package/builddeb b/scripts/package/builddeb
--- a/scripts/package/builddeb	2010-02-09 13:57:19.000000000 +0100
+++ b/scripts/package/builddeb	2010-03-04 20:58:03.353788459 +0100
@@ -18,6 +18,7 @@
 	cp debian/copyright "$pdir/usr/share/doc/$pname/"
 	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
 	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
+	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' | xargs -r0 md5sum > DEBIAN/md5sums"
 
 	# Fix ownership and permissions
 	chown -R root:root "$pdir"

--------------050105080202050602060607--
