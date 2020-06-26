Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgFZUhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:37:02 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D032CC03E979
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:37:02 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 35so4685833ple.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:37:02 -0700 (PDT)
Date: Fri, 26 Jun 2020 13:37:00 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
Message-ID: <202006261331.3A94DB7@keescook>
References: <20200626185913.92890-1-masahiroy@kernel.org>
 <CAKwvOd=V_M43CP7G87K3TqSsxua2NcXPz6BnDt-z6167O2WAzQ@mail.gmail.com>
 <202006261319.F130204@keescook>
 <CAKwvOdmFpgSGow3X4AhEC1B-xWNORTgAFBXgYPQHLGyhgefddw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmFpgSGow3X4AhEC1B-xWNORTgAFBXgYPQHLGyhgefddw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 26, 2020 at 01:25:27PM -0700, Nick Desaulniers wrote:
> Ah, right. Thanks for pointing that out.  I'm still curious if the
> CFLAGS_<file>.o rules get appended or overwrite all flags for that
> translation unit?

CFLAGS_file.o gets appended to the CFLAGS. For example, after my updated
patch[1], the command line for syscall_64.o looks like this:

gcc -Wp,-MMD,arch/x86/entry/.syscall_64.o.d  -nostdinc -isystem \
...
-Wframe-larger-than=2048 -fstack-protector-strong \
...
-fno-stack-protector -Wno-override-init \
-DKBUILD_MODFILE='"arch/x86/entry/syscall_64"' \
-DKBUILD_BASENAME='"syscall_64"' \
-DKBUILD_MODNAME='"syscall_64"' \
-c -o arch/x86/entry/syscall_64.o \
arch/x86/entry/syscall_64.c

-Kees

[1] https://lore.kernel.org/lkml/202006261333.585319CA6B@keescook/

-- 
Kees Cook
