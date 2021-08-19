Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51644C4338F
	for <linux-kbuild@archiver.kernel.org>; Thu, 19 Aug 2021 00:17:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 330076108E
	for <linux-kbuild@archiver.kernel.org>; Thu, 19 Aug 2021 00:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbhHSARj (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 18 Aug 2021 20:17:39 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17859 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhHSARj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:17:39 -0400
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 17J0GpjU019745;
        Thu, 19 Aug 2021 09:16:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17J0GpjU019745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629332211;
        bh=WYUUDHvnEQEP0mjtTSmjyCMMUYrJcGv9y/e63tdTC4k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WuhfFANsaYjoLfufwAMjNBIsj/1VXpnN8zhNuJCEp8PM1undkxvoKveKP7WH7gsz3
         LP/92tTs0Ykn88rAZnxufjZDk1Bc0TX3BS6OOlIjKw0UiHFXdMMb73s6eM165FpiIY
         Fs9S/UfXKAsFtMgCfbA8cikzODIu4cR3d+K1LmSMazZA7Lfb688/daWGX3HgvN9Qy2
         WbqnFdQWHx6o4Vhx2A+LLSSTEgFlsxHITMNwG2cOdjJkHf6v1Js3o0EwDo38XUW4yX
         FMRKQNXtLXLDq1vbnHZ+STaENdL/1K5eVgiPqhN8T4rfFV7dA4URmA4Gg4hmLf5AtQ
         LezMbqbsuXE5Q==
X-Nifty-SrcIP: [209.85.215.181]
Received: by mail-pg1-f181.google.com with SMTP id n18so4134243pgm.12;
        Wed, 18 Aug 2021 17:16:51 -0700 (PDT)
X-Gm-Message-State: AOAM531DZJGvVP9sFZ2FbloWFJtCW0w2GiGavZ9LPjqYcU9w+rt6i+6G
        RUY93L+iHA4aa22THf+x0ckxoDUfI1z5GNP/OiM=
X-Google-Smtp-Source: ABdhPJzZ/ARH1PXlxbUMZRCLL5u7xa5hY2/la9kA/ghT2ab558TsIK9Kv4P8E4Tpoj2NgWJgUi+Xb15YgXmOvkHIxu4=
X-Received: by 2002:a65:6459:: with SMTP id s25mr11432394pgv.7.1629332210619;
 Wed, 18 Aug 2021 17:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210816202056.4586-1-nathan@kernel.org>
In-Reply-To: <20210816202056.4586-1-nathan@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Aug 2021 09:16:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrV+KPwcXPd6jaXZ7F4P=vqk55iDbZtOF1vSND0vQKYg@mail.gmail.com>
Message-ID: <CAK7LNARrV+KPwcXPd6jaXZ7F4P=vqk55iDbZtOF1vSND0vQKYg@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Remove -Wno-format-invalid-specifier from
 clang block
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 5:21 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Turning on -Wformat does not reveal any instances of this warning across
> several different builds so remove this line to keep the number of
> disabled warnings as slim as possible.
>
> This has been disabled since commit 61163efae020 ("kbuild: LLVMLinux:
> Add Kbuild support for building kernel with Clang"), which does not
> explain exactly why it was turned off but since it was so long ago in
> terms of both the kernel and LLVM so it is possible that some bug got
> fixed along the way.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---


All applied to linux-kbuild. Thanks.

-- 
Best Regards
Masahiro Yamada
