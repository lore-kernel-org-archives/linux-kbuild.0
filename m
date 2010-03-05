Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from telcs.lanten.hu ([212.52.167.247]:51402 "EHLO telcs.lanten.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752675Ab0CERTh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Mar 2010 12:19:37 -0500
Received: from dsl51b6a168.pool.t-online.hu ([81.182.161.104] helo=[192.168.55.114])
	by telcs.lanten.hu with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69)
	(envelope-from <fejes@joco.name>)
	id 1NnbBV-0003Px-20
	for linux-kbuild@vger.kernel.org; Fri, 05 Mar 2010 18:19:34 +0100
Message-ID: <4B913D28.5020109@joco.name>
Date: Fri, 05 Mar 2010 18:19:36 +0100
From: FEJES Jozsef <fejes@joco.name>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg md5sums
References: <4B901ECD.5080707@joco.name> <4B910367.5040303@suse.cz>
In-Reply-To: <4B910367.5040303@suse.cz>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

On 2010.03.05. 14:13, Michal Marek wrote:
> On 4.3.2010 21:57, FEJES Jozsef wrote:
>> I would like an md5sums file in the packages built by the deb-pkg
>> script. It's a quite standard and useful thing to do.
>>
>> Please consider my patch (or something similar) for inclusion.
>>
>> My patch does the same thing as dh_md5sums, without any fancy options
>> which are unnecessary in this case.
>
> Hi,
>
> Please submit a patch according to Documentation/SubmittingPatches, i.e.
> inline it in the body of the email and include your Signed-off-by: line.
> BTW:
> sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0'
> can be written as
> find "$pdir" -path "$pdir/DEBIAN" -prune -o -type f -printf '%P\0'
> (saves you some quoting).
>
> Michal
>

Sorry, first time. (The directory change is needed because md5sum needs the correct base.) Here's the resubmission.

This patch creates the standard md5sums file for 'make deb-pkg' just like the dh_md5sums debhelper script.

Signed-off-by: Jozsef Fejes <fejes@joco.name>
-----
diff -upr a/scripts/package/builddeb b/scripts/package/builddeb
--- a/scripts/package/builddeb	2010-02-09 13:57:19.000000000 +0100
+++ b/scripts/package/builddeb	2010-03-04 20:58:03.353788459 +0100
@@ -18,6 +18,8 @@ create_package() {
 	cp debian/copyright "$pdir/usr/share/doc/$pname/"
 	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
 	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
+	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
+		| xargs -r0 md5sum > DEBIAN/md5sums"
 
 	# Fix ownership and permissions
 	chown -R root:root "$pdir"
-----

-- 
[ FEJES Jozsef ]
http://joco.name
