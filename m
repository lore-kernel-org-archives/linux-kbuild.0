Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34008 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934745AbeB1Uxh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 15:53:37 -0500
Subject: Re: [PATCH] Documentation: Update ncurses package names for
 menuconfig
References: <1519801192-31201-1-git-send-email-arvindprasanna@gmail.com>
 <43a91eb4-646a-b4d8-5b3d-b0bfde0019d9@infradead.org>
 <CAK-=9LoNfYP_-tm+W2GvUWjWgs=BZ-VRFmVNzTCadzQWaee9yg@mail.gmail.com>
 <e484c42f-4fe6-10f5-dab8-cfd749911486@infradead.org>
 <CAK-=9Lph+GXzEsRf+2L2T1W4fJx-wo0HahPxfi6vPKSSxKxmqQ@mail.gmail.com>
 <CAK-=9LpTkTtQqqAL+NZEGL53s-vpzic0+3Q+ocrvL9pCwjb9KQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <80562d48-0524-eea2-947c-4fba0cb36b7a@infradead.org>
Date: Wed, 28 Feb 2018 12:53:32 -0800
MIME-Version: 1.0
In-Reply-To: <CAK-=9LpTkTtQqqAL+NZEGL53s-vpzic0+3Q+ocrvL9pCwjb9KQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Prasanna <arvindprasanna@gmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

I think that you are missing my point, so let me start over and try to
clarify it.

In the patch description, it says "libncurses-devel" (not libncurses-dev).

In the patch itself, it says libncurses-dev (not libncurses-devel).

I suspect that one of these is incorrect.  Which one is it?

Thanks.
~~~~~~~~~~~~~~

The package name is ncurses-devel for Redhat based distros
and libncurses-devel for Debian based distros.

Signed-off-by: Arvind Prasanna <arvindprasanna@gmail.com>
---
 scripts/kconfig/lxdialog/check-lxdialog.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index a10bd9d..4353e40 100755
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -55,7 +55,8 @@ EOF
 	    echo " *** required header files."                            1>&2
 	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
 	    echo " *** "                                                  1>&2
-	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
+	    echo " *** Install ncurses (ncurses-devel or libncurses-dev   1>&2
+	           *** depending on your distribution) and try again."    1>&2
 	    echo " *** "                                                  1>&2
 	    exit 1
 	fi


-- 
~Randy
