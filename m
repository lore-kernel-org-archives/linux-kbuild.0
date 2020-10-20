Return-Path: <SRS0=ezyS=D3=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB6DC388F7
	for <linux-kbuild@archiver.kernel.org>; Tue, 20 Oct 2020 16:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FD0722249
	for <linux-kbuild@archiver.kernel.org>; Tue, 20 Oct 2020 16:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tfuJ2Gp2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394779AbgJTQmT (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 20 Oct 2020 12:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394734AbgJTQmT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Oct 2020 12:42:19 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0416C0613D1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2020 09:42:17 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id 33so2515251edq.13
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2020 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0Me8GLYPnUizRcS83SCdg5n9DP3MyuxXWUGsX9kdwo=;
        b=tfuJ2Gp25HcoLn6vQzFg/FlpBDVrTJM4WZSgfzcc71/zuwb0Z8cOnvVDcVg7AvWetz
         GCQc0hSrAqL9XyYGWEdE/WHErNG5NwiM5gYRiS/Dma7YyZ/uKKX0UQEqHNOvUsToYLEz
         gKcG3ooORmkHxsVLC8HexjR4k1Iznz7r+NHxCur1rf47A9/IRfzPLMW3d2G8bvCcT2ua
         LC6mV4VONnO5tXddBXbeMhC7r6Dkb5arC6K3ULSyW0F38DmQpJCAKkbfL8iqCrcvV/Ow
         nKYxKk27OmxwFsD/yIPmnbHjMCB59eESmtQhAD9oGOfpAr11KUzuq5JDZ3PzBnCnMGHt
         HqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0Me8GLYPnUizRcS83SCdg5n9DP3MyuxXWUGsX9kdwo=;
        b=dTP7utLJsUx7mKBT15sQshzVPplQ9cS55R+4+9PPJEBNHx+R5P82NQRcvouKowXThu
         gbDWaE/FF9eNO0C0TEWsXpxEMRD5FMKtSSTqyBsiq53nvJBhUNgLq63TryDDmL3k+gvH
         JRKxNXPCF/5ZWi4CSvdHDxEL9RzpSa07nON3IR4IRHI8H1nKqni2SFtpwvrm8Do3X02r
         wryRMfUSmk9nEln/k0+Z1PkALsyKHp1nF19JRuTJVbExhAiugfBe3aa1eVNIXTV/QMdt
         TD27aSUOx4Q+HeD2adYNibnfUbkB8kzsxUmJCFVPX9q6BlGNM/joYHhYuPH8Z+YMnLGS
         C98g==
X-Gm-Message-State: AOAM530CWWv0nYk/AazQJl+p+Jbljm8yiwnQGi0/XxBhksV4GF30bXmw
        W42P4fsh+kNFt/EErXYQdbSeYS3/6t5CEX+Uc8fK2A==
X-Google-Smtp-Source: ABdhPJwmj1gLFyiZCwLnUyczZ5AtIrV1PckIn++9ZnSSTXEbEsuDOOrXLOt8ass9IoAu0owy+lwv/OR68pPkcbeDkWE=
X-Received: by 2002:aa7:c390:: with SMTP id k16mr3866300edq.40.1603212136160;
 Tue, 20 Oct 2020 09:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201013003203.4168817-1-samitolvanen@google.com>
 <20201013003203.4168817-14-samitolvanen@google.com> <202010141548.47CB1BC@keescook>
In-Reply-To: <202010141548.47CB1BC@keescook>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 20 Oct 2020 09:42:05 -0700
Message-ID: <CABCJKuf8=2A5fAY0rEZAWBw7q-PO8iFvmubGy4bj6GLZ7k8c9g@mail.gmail.com>
Subject: Re: [PATCH v6 13/25] kbuild: lto: merge module sections
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
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

On Wed, Oct 14, 2020 at 3:49 PM Kees Cook <keescook@chromium.org> wrote:
> In looking at this again -- is this ifdef needed? Couldn't this be done
> unconditionally? (Which would make it an independent change...)

No, I suppose it's not needed. I can drop the ifdef from the next version.

Sami
