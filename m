Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31371 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388369AbfDRKjw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Apr 2019 06:39:52 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x3IAdf9d001844
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Apr 2019 19:39:41 +0900
Received: by mail-ua1-f41.google.com with SMTP id c13so591454uao.12
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Apr 2019 03:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com> <1554992415-292288-2-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1554992415-292288-2-git-send-email-steven.sistare@oracle.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Apr 2019 19:39:04 +0900
Message-ID: <CAK7LNARhDRVtKUhD3tru82fYSSak2t=4w0MyhdbJTY1Kv_Ddjw@mail.gmail.com>
Subject: Re: [PATCH V1 1/3] kbuild: serialize modules and modules_install
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Apr 11, 2019 at 11:33 PM Steve Sistare
<steven.sistare@oracle.com> wrote:
>
> "make -j 16 modules modules_install" allows both targets to run concurrently
> and produces warnings and incorrect results in the install area.  Force
> them to be run serially, the same way that "install modules_install" is
> already seralized.

Probably you know many projects are
configured, compiled, and installed
in the following 3 steps:

$ ./configure
$ make
$ make install


I have never seen instruction like this:

$ ./configure
$ make -j8 all install


Compile and install are separate steps, one reason is
"make install" is quite often run under the root privilege
in order to copy files to /usr/ or /usr/local/.


Following the same logic, Kbuild does not support
the simultaneous compile & installation.
(Please note the default install location of modules is
/lib/modules/$(uname -r)/, which needs root permission for write.)


For the same reason, we do not support
"make -j8 vmlinux install"
 or
"make -j8 dtbs dtbs_install".




> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  Makefile | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 026fbc4..4988dcc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -291,9 +291,11 @@ ifneq ($(filter $(clean-targets),$(MAKECMDGOALS)),)
>          endif
>  endif
>
> -# install and modules_install need also be processed one by one
> -ifneq ($(filter install,$(MAKECMDGOALS)),)
> -        ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
> +# modules_install and {install or modules} need to be processed one by one
> +ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
> +        ifneq ($(filter install,$(MAKECMDGOALS)),)
> +               mixed-targets := 1
> +        else ifneq ($(filter modules,$(MAKECMDGOALS)),)
>                 mixed-targets := 1
>          endif
>  endif
> --
> 1.8.3.1
>


-- 
Best Regards
Masahiro Yamada
