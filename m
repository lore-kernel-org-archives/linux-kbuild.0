Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.211.182]:41929 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757567AbZKXO7t (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 09:59:49 -0500
Received: by ywh12 with SMTP id 12so6443038ywh.21
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2009 06:59:56 -0800 (PST)
Date: Tue, 24 Nov 2009 09:11:37 -0600
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH 1/3] scripts/package: tar-pkg: use tar --owner=root
Message-ID: <20091124151137.GB14731@progeny.tock>
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

From: Michal Marek <mmarek@suse.cz>

Use the --owner= and --group= options to make sure the entries in
the built tar file are owned by root.  Without this change, a
careless sysadmin using the tar-pkg target can easily end up
installing a kernel that is writable by the unprivileged user
account used to build the kernel.

Test that these options are understood before using them so that
non-GNU versions of tar can still be used if the operator is
appropriately cautious.

Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
---
 scripts/package/buildtar |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index b1fd48d..51b2aa0 100644
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -101,7 +101,11 @@ esac
 #
 (
 	cd "${tmpdir}"
-	tar cf - . | ${compress} > "${tarball}${file_ext}"
+	opts=
+	if tar --owner=root --group=root --help >/dev/null 2>&1; then
+		opts="--owner=root --group=root"
+	fi
+	tar cf - . $opts | ${compress} > "${tarball}${file_ext}"
 )
 
 echo "Tarball successfully created in ${tarball}${file_ext}"
-- 
1.6.5.3

