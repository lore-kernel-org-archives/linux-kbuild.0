Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47653 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbeGLKM6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 06:12:58 -0400
MIME-Version: 1.0
In-Reply-To: <20180710004602.21599-4-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com> <20180710004602.21599-4-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Jul 2018 19:03:16 +0900
Message-ID: <CAK7LNAQNbV1afjkoKfgvjijkhkQN3-8or8Aq7Mm9X2xiemiXrw@mail.gmail.com>
Subject: Re: [PATCHv2] treewide: Rename HOSTCFLAGS -> KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>

Hi.


2018-07-10 9:45 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> In preparation for enabling command line CFLAGS, re-name HOSTCFLAGS to
> KBUILD_HOSTCFLAGS as the internal use only flags. This should not have any
> visible effects.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> v2: Dropped name change for individual files (still CHOSTFLAGS_foo)
> ---



One more fix for a document.


diff --git a/Documentation/kbuild/makefiles.txt
b/Documentation/kbuild/makefiles.txt
index 048fc39..63655c1 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -661,7 +661,7 @@ Both possibilities are described in the following.

        When compiling host programs, it is possible to set specific flags.
        The programs will always be compiled utilising $(HOSTCC) passed
-       the options specified in $(HOSTCFLAGS).
+       the options specified in $(KBUILD_HOSTCFLAGS).
        To set flags that will take effect for all host programs created
        in that Makefile, use the variable HOST_EXTRACFLAGS.


I will fold this.


-- 
Best Regards
Masahiro Yamada
