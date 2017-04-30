Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49386 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938521AbdD3OBT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Apr 2017 10:01:19 -0400
MIME-Version: 1.0
In-Reply-To: <20170421213931.155210-3-mka@chromium.org>
References: <20170421213931.155210-1-mka@chromium.org> <20170421213931.155210-3-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Apr 2017 23:01:11 +0900
Message-ID: <CAK7LNATD-KbP6GtV_j6NMgcPQYRigz5pA8fdos7hQSzQpL8czw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the 'duplicate-decl-specifier' warning
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, masahiroy@kernel.org

Hi Matthias,


2017-04-22 6:39 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> clang generates plenty of these warnings in different parts of the code.
> They are mostly caused by container_of() and other macros which declare
> a "const <type> *" variable for their internal use which triggers a
> "duplicate 'const' specifier" warning if the <type> is already const
> qualified.
>
> Wording-mostly-from: Michael Davidson <md@google.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>



I think container_of() can be more simple,
dropping the 'const'.

The following patch worked for me.


diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 4c26dc3..d53672b 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -846,11 +846,9 @@ static inline void ftrace_dump(enum
ftrace_dump_mode oops_dump_mode) { }
  * @ptr:       the pointer to the member.
  * @type:      the type of the container struct this is embedded in.
  * @member:    the name of the member within the struct.
- *
  */
 #define container_of(ptr, type, member) ({                     \
-       const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
-       (type *)( (char *)__mptr - offsetof(type,member) );})
+       (type *)((void *)(ptr) - offsetof(type, member));})

 /* Rebuild everything on CONFIG_FTRACE_MCOUNT_RECORD */
 #ifdef CONFIG_FTRACE_MCOUNT_RECORD



For also this one,
I'd like to try to fix the code rather than hiding warnings.

(We may end up with applying your patch after all,
but I'd like to think about it for now.)



-- 
Best Regards
Masahiro Yamada
