Return-Path: <SRS0=Xovq=DH=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF013C4727E
	for <linux-kbuild@archiver.kernel.org>; Wed, 30 Sep 2020 16:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 892C920B1F
	for <linux-kbuild@archiver.kernel.org>; Wed, 30 Sep 2020 16:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FdREMa9Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731121AbgI3QF6 (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731093AbgI3QFv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Sep 2020 12:05:51 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C98FC0613D1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2020 09:05:51 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id lo4so3605992ejb.8
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2020 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4nf8e6hIaPbRqntvQjCiPI17gKDQL3g6MdR3siKHn30=;
        b=FdREMa9YQ4gNRdQHURf/x/R8SmYVJ5gIkH9KpmlqeEAlOLeXAhaYjSC7VB4Y8/uoLl
         NpSU9flOBZMB2LnlrWowvIpCnct6WksL48hJ6hEvbeije9viNCjBJLNglsVPmK17McTE
         bQR932o1ftCv5I/jccydLYq37ELOk8HLaS5waUMw2Sl4+mDrlXBlbynVNtazEd8rcTZn
         oCfVkT2gQBFoWgRMv35xCS9XqXQ6DAZwYypy9P5mdyuszGukdvxnnn/AnzhUUV4OJTG3
         jalYoYIzQjQOW6W2UeOKJ1wH4ANi3gdiXC8IiXeG+7KUsH9D9cVc5b9Ynx38GiIxo6v5
         fQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4nf8e6hIaPbRqntvQjCiPI17gKDQL3g6MdR3siKHn30=;
        b=gvivPiVpjKCFKcHjsosm8WIvlsKoO1Cm/Qj6NAA1qdsxhBvbfsPiqgXRM5FKsLFvyH
         NfyYuzEXi4nvR2BRbM2KM365M4g/OMGuS/BNqAFrw1cx/5Q0V3r5CUqQl0SAkG3nIlxv
         2HZcCVGpcv76XXIC3+tECiF8IeMDGIQKh9X3btuHKsp1sw/3pOrEAeVsKdzM+KeAAG87
         AcL+4C9rHD68+UgXSNsxbtm/4TXaYgzvUmvSnhya0xtoADx3xN0Bsq9KtPEmqz9lIM5M
         ECJZcLexPPQ7OwZc05sj1zl6tuIf2T47pvTF7ZU83zYTz9P1QwZ2bg6VSPWWC2pFFosP
         XF6w==
X-Gm-Message-State: AOAM533KFfnsAP+QXAgBGpQDvBzmtmFL0/mkkcF0l0WDcqXGTCWlvVju
        h2bADfUW0ZBunoH+ZYr7LQIamsJtPRvgRQ8xPmu29w==
X-Google-Smtp-Source: ABdhPJzYVdbm3fjbvWcAsssxdkKlp1Qf8hBl3VmZLS0706h18aYEVSeaUqFy3XkT6TY1fv56XT82VdDVYI9SZJ5H+mA=
X-Received: by 2002:a17:906:a256:: with SMTP id bi22mr3464394ejb.375.1601481949457;
 Wed, 30 Sep 2020 09:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200929214631.3516445-1-samitolvanen@google.com>
 <20200929214631.3516445-7-samitolvanen@google.com> <20200929201257.1570aadd@oasis.local.home>
In-Reply-To: <20200929201257.1570aadd@oasis.local.home>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Wed, 30 Sep 2020 09:05:38 -0700
Message-ID: <CABCJKud3S7pn8Ap3AkNRUUC4v8nMwOzM2_EwEB6+NFzDp5gppA@mail.gmail.com>
Subject: Re: [PATCH v4 06/29] tracing: move function tracer options to Kconfig
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 29, 2020 at 5:13 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 29 Sep 2020 14:46:08 -0700
> Sami Tolvanen <samitolvanen@google.com> wrote:
>
> > +++ b/kernel/trace/Kconfig
> > @@ -595,6 +595,22 @@ config FTRACE_MCOUNT_RECORD
> >       depends on DYNAMIC_FTRACE
> >       depends on HAVE_FTRACE_MCOUNT_RECORD
> >
> > +config FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
> > +     bool
> > +     depends on FTRACE_MCOUNT_RECORD
> > +
> > +config FTRACE_MCOUNT_USE_CC
> > +     def_bool y
> > +     depends on $(cc-option,-mrecord-mcount)
>
> Does the above get executed at every build? Or does a make *config need
> to be done? If someone were to pass a .config to someone else that had
> a compiler that didn't support this, would it be changed if the person
> just did a make?

Yes, it's updated if you copy a .config and just run make. For
example, here's what happens when I create a config with gcc and then
build it with Clang:

$ make defconfig
...
$ ./scripts/config -e FUNCTION_TRACER -e DYNAMIC_FTRACE
$ make olddefconfig
...
$ grep MCOUNT_USE .config
CONFIG_FTRACE_MCOUNT_USE_CC=y
$ make CC=clang
scripts/kconfig/conf  --syncconfig Kconfig
...
^C
$ grep MCOUNT_USE .config
CONFIG_FTRACE_MCOUNT_USE_OBJTOOL=y

Sami
