Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B45C56202
	for <linux-kbuild@archiver.kernel.org>; Fri, 20 Nov 2020 20:20:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FEB32408E
	for <linux-kbuild@archiver.kernel.org>; Fri, 20 Nov 2020 20:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gyFkFQiG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbgKTUTs (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 20 Nov 2020 15:19:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730506AbgKTUTp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Nov 2020 15:19:45 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFFCC0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 12:19:43 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id r14so5666204vsa.13
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 12:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7acuhIcf2aj+2HfwBkYRj3S/5vwbxxWC1CPfVW74VbQ=;
        b=gyFkFQiGUkXaUSAApDExFsLoGANoyNJrTgq+Uj6paRE46wRNgi6CKDFwmTfHlKvQPj
         Er7YyuPh/Vm7IE8fo7s0qFaQ+J1KSSTh2gKBxnB1wIcKxIDjY6KSardWaLK7oDrc8y2c
         4kdFdNabC+L2Mjs5rrPZnanoVf79hAu3cru/VeNYnxmuOucQz4Zphk15Gez73fSD2CqD
         AQbMyvtkwotDifRaGV6FeXKSexUu1NjZCba58CUErs2OOa74uTI7jGSLqvFrp+lsC6E+
         Ms7cuIiIpj16zzxU5/wxq9BhB8eXHmGgvUZLrwYiI37n7bXiBngkjjGfqQuKlN1BFLWq
         HIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7acuhIcf2aj+2HfwBkYRj3S/5vwbxxWC1CPfVW74VbQ=;
        b=E6y4pQ55JPMJY2Wcyy0XekXaNWx3VVaJJ6j7FD+CGI2u/zW4wpya9SQBSGRDr5FZoa
         SnSy0pzZOFk8xz0FBE2J32m1Iv6oMAal0jONSNgr9pk/8JH0tOPVvvkvdcU43ljYx4br
         Zp+vtCVPbg1R4SON+EgZaAoPgyYUc3TO8wEn4sRsntEPd6MW8j5T8Oxpw7ZLSh6/gMmJ
         SeQewgYUI+PpIocMoZx0q7nOOMyr0NNGVo1+43h9UfUD6xTENKFZlToIMIKAYQo6xjMR
         800PPSg8bYRdX7808x1VvsNv9RG4DVaEol/o2cqAKYVEKWo9yuq5fT3FUktA87vAbgiD
         mpbQ==
X-Gm-Message-State: AOAM533gnQhnYY168jqBBqUiIyrjv7ZRGXHQWxRVRX2tVS2xdt5a5o8D
        D4VKLtLBE9rd1mg8HhL4Z+m6kScdPJzCKRWl/DPjug==
X-Google-Smtp-Source: ABdhPJxFgydZX2L5XAnYwSfeznScyETG/9FyvzzmXojnDnWISYdoy1l6/FMv24FHnaLHqIodrvwFJpF/G3jjdZFT5xQ=
X-Received: by 2002:a67:7107:: with SMTP id m7mr15151234vsc.17.1605903582865;
 Fri, 20 Nov 2020 12:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20201118220731.925424-1-samitolvanen@google.com>
 <CAKwvOd=5PhCTZ-yHr08gPYNEsGEjZa=rDY0-unhkhofjXhqwLQ@mail.gmail.com> <CAMj1kXEVzDi5=uteUAzG5E=j+aTCHEbMxwDfor-s=DthpREpyw@mail.gmail.com>
In-Reply-To: <CAMj1kXEVzDi5=uteUAzG5E=j+aTCHEbMxwDfor-s=DthpREpyw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 20 Nov 2020 12:19:31 -0800
Message-ID: <CAKwvOdmpBNx9iSguGXivjJ03FaN5rgv2oaXZUQxYPdRccQmdyQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/17] Add support for Clang LTO
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 20, 2020 at 2:30 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 19 Nov 2020 at 00:42, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > Thanks for continuing to drive this series Sami.  For the series,
> >
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > I did virtualized boot tests with the series applied to aarch64
> > defconfig without CONFIG_LTO, with CONFIG_LTO_CLANG, and a third time
> > with CONFIG_THINLTO.  If you make changes to the series in follow ups,
> > please drop my tested by tag from the modified patches and I'll help
> > re-test.  Some minor feedback on the Kconfig change, but I'll post it
> > off of that patch.
> >
>
> When you say 'virtualized" do you mean QEMU on x86? Or actual
> virtualization on an AArch64 KVM host?

aarch64 guest on x86_64 host.  If you have additional configurations
that are important to you, additional testing help would be
appreciated.

>
> The distinction is important here, given the potential impact of LTO
> on things that QEMU simply does not model when it runs in TCG mode on
> a foreign host architecture.

-- 
Thanks,
~Nick Desaulniers
