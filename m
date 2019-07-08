Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41819 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730471AbfGHL1F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 07:27:05 -0400
Received: by mail-lf1-f68.google.com with SMTP id 62so10665712lfa.8
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jul 2019 04:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <5d215f83.1c69fb81.3739c.06f8SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <5d215f83.1c69fb81.3739c.06f8SMTPIN_ADDED_BROKEN@mx.google.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 8 Jul 2019 16:56:52 +0530
Message-ID: <CAFA6WYPQWvVhjPjs9gueSvSn=EYcDBh7XGU+7te09-rmiWEvGw@mail.gmail.com>
Subject: Re: uuid define issue build on macos
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: feng chen <puck.chen@foxmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, 7 Jul 2019 at 08:27, feng chen <puck.chen@foxmail.com> wrote:
>
> *** Default configuration is based on 'defconfig'
> #
> # No change to .config
> #
> arch/arm64/Makefile:40: LSE atomics not supported by binutils
> arch/arm64/Makefile:48: Detected assembler with broken .inst;
> disassembly will be unreliable
>    UPD     include/config/kernel.release
>    UPD     include/generated/utsrelease.h
>    HOSTCC  scripts/mod/file2alias.o
> scripts/mod/file2alias.c:42:3: error: typedef redefinition with
> different types ('struct uuid_t' vs '__darwin_uuid_t' (aka 'unsigned
> char [16]'))
> } uuid_t;
>    ^

It looks like somehow Darwin OS specific header is included here for
UUID definition. Please try to build with following change to include
only standardized headers:

--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -10,6 +10,7 @@
  * of the GNU General Public License, incorporated herein by reference.
  */

+#define _XOPEN_SOURCE
 #include "modpost.h"
 #include "devicetable-offsets.h"

-Sumit

>
/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include/sys/_types/_uuid_t.h:31:25:
> note: previous definition is here
> typedef __darwin_uuid_t uuid_t;
>                          ^
> scripts/mod/file2alias.c:1300:42: error: array initializer must be an
> initializer list or string literal
>          DEF_FIELD(symval, tee_client_device_id, uuid);
>                                                  ^
> 2 errors generated.
> make[2]: *** [scripts/mod/file2alias.o] Error 1
> make[1]: *** [prepare0] Error 2
> make: *** [sub-make] Error 2
>
> and:
>
> _types.h:77:typedef unsigned char   __darwin_uuid_t[16];
>
>   28 #ifndef _UUID_T
>   29 #define _UUID_T
>   30 #include <sys/_types.h> /* __darwin_uuid_t */
>   31 typedef __darwin_uuid_t uuid_t;
>
>
>   32 #endif /* _UUID_T */
>
>
>
