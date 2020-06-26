Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgFZUNU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:13:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE39C03E97B
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:13:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i4so5386474pjd.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:13:20 -0700 (PDT)
Date: Fri, 26 Jun 2020 13:13:18 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
Message-ID: <202006261312.560B045E@keescook>
References: <20200626185913.92890-1-masahiroy@kernel.org>
 <CAKwvOdnK4KZaE=D40UyKHN-nB1Y-oXXJUcVv08cGJNsExOs-Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnK4KZaE=D40UyKHN-nB1Y-oXXJUcVv08cGJNsExOs-Pw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 26, 2020 at 12:09:37PM -0700, Nick Desaulniers wrote:
> On Fri, Jun 26, 2020 at 12:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >  CFLAGS_NO_HARDENING := $(call cc-option, -fno-PIC,) $(call cc-option, -fno-pic,) \
> > -       $(call cc-option, -fno-stack-protector,) \
> > -       $(call cc-option, -fno-stack-protector-all,)
> > +       -fno-stack-protector $(call cc-option, -fno-stack-protector-all)
> 
> Just curious, looks like we could do the same for
> `-fno-stack-protector-all`, here or tree-wide, right?  Wait, what
> compiler recognizes -fno-stack-protector-all?
> https://godbolt.org/z/QFQKE_

That is from ancient times, IIRC. -fno-stack-protector should be
sufficient.

-- 
Kees Cook
