Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:53918 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbeHWVXb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 17:23:31 -0400
Subject: [PATCH v2] modules_install: make missing $DEPMOD a warning instead of
 error
References: <490A46D5-834E-46A9-9106-A31F94344F99@goldelico.com>
 <d5093e14-c826-9183-cd94-ecb99a799fc8@infradead.org>
 <CAK7LNAQDRj7aKMNqkTL3XxbsFHUuYwOaPn8buh=b9O9+CaKjig@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <61369202-8425-4cb7-aa9d-b83f15c528e0@infradead.org>
Date: Thu, 23 Aug 2018 10:52:39 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQDRj7aKMNqkTL3XxbsFHUuYwOaPn8buh=b9O9+CaKjig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Chih-Wei Huang <cwhuang@linux.org.tw>, stable <stable@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

When $DEPMOD is not found, only print a warning instead of exiting
with an error message and error status.

Warning: 'make modules_install' requires /sbin/depmod. Please install it.
This is probably in the kmod package.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: add missing "exit 0" and update the commit message (no Error).

 scripts/depmod.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-418.orig/scripts/depmod.sh
+++ lnx-418/scripts/depmod.sh
@@ -15,9 +15,9 @@ if ! test -r System.map ; then
 fi
 
 if [ -z $(command -v $DEPMOD) ]; then
-	echo "'make modules_install' requires $DEPMOD. Please install it." >&2
+	echo "Warning: 'make modules_install' requires $DEPMOD. Please install it." >&2
 	echo "This is probably in the kmod package." >&2
-	exit 1
+	exit 0
 fi
 
 # older versions of depmod require the version string to start with three
