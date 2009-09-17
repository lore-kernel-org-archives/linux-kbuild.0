Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f200.google.com ([209.85.221.200]:63613 "EHLO
	mail-qy0-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628AbZIQDWG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Sep 2009 23:22:06 -0400
Received: by qyk38 with SMTP id 38so4758261qyk.27
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Sep 2009 20:22:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <830a8fa70909161930r518a9644ja954ced2ae5814b4@mail.gmail.com>
References: <830a8fa70909161930r518a9644ja954ced2ae5814b4@mail.gmail.com>
Date: Thu, 17 Sep 2009 11:15:53 +0800
Message-ID: <2375c9f90909162015h39aeee14s99d3173d0a9baf7c@mail.gmail.com>
Subject: Re: [patch] Makefile: can't build modules outside the kernel tree if
	it was built using O=
From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Content-Transfer-Encoding: 8bit
To: Caveh Jalali <ecaveh@gmail.com>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 17, 2009 at 10:30 AM, Caveh Jalali <ecaveh@gmail.com> wrote:
> in 2.6.31, it is no longer possible to build kernel modules for some platforms
> (the ones that need include2) outside the kernel src tree if the
> src tree was built using O= to specify an alternate directory for the
> build output.
>
> i think this broke with the following commit:
>
> commit b8b572e1015f81b4e748417be2629dfe51ab99f9
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Fri Aug 1 15:20:30 2008 +1000


Only after 2.6.31? This commit was on 2008 Aug 1...

>
>    powerpc: Move include files to arch/powerpc/include/asm
>
>
> when the platform specific include directories were shuffled around
> without updating the
> top level Makefile.  however, i think this FAIL is generic, and not
> limited to powerpc.
> here's a patch to the top level Makefile to teach it about the shuffled files:
>


You forgot your SOB line.

Anyway, it looks fine.

Acked-by: WANG Cong <xiyou.wangcong@gmail.com>

>
> --- /local/caveh/linux/linux-2.6.31/Makefile    2009-09-09
> 15:13:59.000000000 -0700
> +++ Makefile    2009-09-16 12:23:05.000000000 -0700
> @@ -958,9 +958,9 @@ ifneq ($(KBUILD_SRC),)
>                 echo "  in the '$(srctree)' directory.";\
>                 /bin/false; \
>         fi;
> -       $(Q)if [ ! -d include2 ]; then                                  \
> -           mkdir -p include2;                                          \
> -           ln -fsn $(srctree)/include/asm-$(SRCARCH) include2/asm;     \
> +       $(Q)if [ ! -d include2 ]; then                                   \
> +           mkdir -p include2;                                           \
> +           ln -fsn $(srctree)/arch/$(SRCARCH)/include/asm include2/asm; \
>         fi
>  endif
���{.n�+�������+%�����ݶ��w��{.n�+����{��F�W��{ay�ʇڙ�,j��f���h��������z_�(�階�ݢj"���m������G������?����&���~��
