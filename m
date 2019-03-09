Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:53701 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbfCIPnt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Mar 2019 10:43:49 -0500
From: Arseny Maslennikov <ar@cs.msu.ru>
Date: Sat,  9 Mar 2019 18:43:06 +0300
Message-Id: <20190309154307.23039-2-ar@cs.msu.ru>
In-Reply-To: <20190309154307.23039-1-ar@cs.msu.ru>
References: <20190309154307.23039-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [PATCH v2 2/3] scripts/package/mkdebian: avoid implicit effects
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arseny Maslennikov <ar@cs.msu.ru>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>

* The man page for dpkg-source(1) notes:

>      -b, --build directory [format-specific-parameters]
>             Build  a  source  package  (--build since dpkg 1.17.14).
>             <...>
>
>             dpkg-source will build the source package with the first
>             format found in this ordered list: the format  indicated
>             with  the  --format  command  line  option,  the  format
>             indicated in debian/source/format, “1.0”.  The  fallback
>             to “1.0” is deprecated and will be removed at some point
>             in the future, you should always  document  the  desired
>             source   format  in  debian/source/format.  See  section
>             SOURCE PACKAGE FORMATS for an extensive  description  of
>             the various source package formats.

  Thus it would be more foolproof to explicitly use 1.0 (as we always
  did) than to rely on dpkg-source's defaults.

* In a similar vein, debian/rules is not made executable by mkdebian,
  and dpkg-source warns about that but still silently fixes the file.
  Let's be explicit once again.

Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
---
 scripts/package/mkdebian | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index f030961c5165..d276eb671a27 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -132,7 +132,9 @@ else
         echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
 fi
 
-mkdir -p debian/
+mkdir -p debian/source/
+echo "1.0" > debian/source/format
+
 echo $debarch > debian/arch
 
 # Generate a simple changelog template
@@ -221,5 +223,6 @@ clean:
 
 binary: binary-arch
 EOF
+chmod +x debian/rules
 
 exit 0
-- 
2.20.1
