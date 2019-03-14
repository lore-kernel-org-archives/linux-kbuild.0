Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44238 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbfCNLAE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Mar 2019 07:00:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id w2so5306345wrt.11
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Mar 2019 04:00:03 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 14 Mar 2019 11:59:50 +0100
Message-ID: <CA+icZUXM2NPGc+yfTCjXHyBnPT=PwO+j20GKeRDrdVPOCF9GwQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: set executable bit for debian/rules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mathieu Malaterre <malat@debian.org>
Cc: linux-kbuild@vger.kernel.org

[ CC me I am not subscribed to this ML ]

[ QUOTE ]
This will remove the warning:

  dpkg-buildpackage: warning: debian/rules is not executable; fixing that

Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 scripts/package/mkdebian | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index f030961c5165..3c6c82f28cac 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -221,5 +221,6 @@ clean:

 binary: binary-arch
 EOF
+chmod +x debian/rules
[/QUOTE ]

I have seen this a million time in my logs as a warning.
Thanks for fixing this up Mathieu.

- Sedat -

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
