Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:36741 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbfDIRHN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Apr 2019 13:07:13 -0400
Received: by mail-ua1-f68.google.com with SMTP id k32so1102238uae.3
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2019 10:07:12 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id j8sm8991153vke.1.2019.04.09.10.07.09
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 10:07:09 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id b8so5755332uaq.7
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2019 10:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190408170418.148554-1-glider@google.com> <20190408170418.148554-2-glider@google.com>
 <CAK7LNAS3+FKpgBvvxKDukD1xcHUZ1o3TsE1BjjVq5P13MrO7Fw@mail.gmail.com>
In-Reply-To: <CAK7LNAS3+FKpgBvvxKDukD1xcHUZ1o3TsE1BjjVq5P13MrO7Fw@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 9 Apr 2019 10:06:57 -0700
Message-ID: <CAGXu5j+yeKMFwziyKzKBg-5_EiE9qE28JUkoidCwkmHQOtedcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] initmem: introduce CONFIG_INIT_ALL_MEMORY and CONFIG_INIT_ALL_STACK
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Alexander Potapenko <glider@google.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module <linux-security-module@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitry Vyukov <dvyukov@google.com>, Sandeep Patil <sspatil@android.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>

On Tue, Apr 9, 2019 at 1:38 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> > +config INIT_ALL_STACK
> > +       bool "Initialize all stack"
> > +       depends on INIT_ALL_MEMORY
> > +       depends on CC_HAS_AUTO_VAR_INIT || (HAVE_GCC_PLUGINS && PLUGIN_HOSTCC != "")
> > +       select GCC_PLUGINS if !CC_HAS_AUTO_VAR_INIT
> > +       select GCC_PLUGIN_STRUCTLEAK if !CC_HAS_AUTO_VAR_INIT
> > +       select GCC_PLUGIN_STRUCTLEAK_BYREF_ALL if !CC_HAS_AUTO_VAR_INIT
> > +       default y
> > +       help
> > +         Initialize uninitialized stack data with a fixed pattern
> > +         (0x00 in GCC, 0xAA in Clang).
> > +
>
> I am not sure about the benefit of these umbrella CONFIGs
> since these make 'depends on' and 'select' complicated.
> I will leave it to Kees, though.

Yeah, I think this could use some more cleanup to get a single config
that represents that if gcc plugins are available (instead of having
it split across two configs now). Additionally I think this needs
refactoring against the current menu choices for
GCC_PLUGIN_STRUCTLEAK. Let me send a proposed patch in a few hours...

-- 
Kees Cook
