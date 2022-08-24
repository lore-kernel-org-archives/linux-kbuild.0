Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B85CC3F6B0
	for <linux-kbuild@archiver.kernel.org>; Wed, 24 Aug 2022 23:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiHXXZi (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 24 Aug 2022 19:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiHXXZe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Aug 2022 19:25:34 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F2A6AA3C
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Aug 2022 16:25:32 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m3so20319563lfg.10
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Aug 2022 16:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qdenZNOnfMmQDVA+dVcw/A5Rdh+nYpdo/ob2KEpD0dU=;
        b=FksFY9oAmSOHfvq06W6xAF3vyRHVNtyCiY4HBZsHFTf4mahnVqotP09dXrZK0+U8q3
         yT+ErzrB41E+RR7FMzXnthM1TKzdoXfmJfYuFYCwUPthyDqsAKvIJ7El+Tqaxj9wr7Z+
         DONrDC7wiaaQraljh1BJH/uRIyPx+GDm2pX/EeFeAfZUmJtWYn2pVI+Kk5H7QX2ogwz3
         h2tpX3Q6NN8Z4aOM4fYIO1SOcpjsof5lHpi5uSr4yDxp6qQw3uMv1RvOM34jypQerRxR
         ZObWkZlxYXqtxm1USOVCxsMeMonEKoiJp7FA/ALI2NuFriUMPZNpPloTl3E40ynQo9/d
         HIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qdenZNOnfMmQDVA+dVcw/A5Rdh+nYpdo/ob2KEpD0dU=;
        b=lV/6uOsMcryKumECw2ntzWET8UboQIxTbWk8Z8FlJR+EB6WUC8iuCVVRMzvlIrVF11
         Atu7iK31Rpw1cfd6juAYOGoBs4MdT6ZtOyP7Ct6KaSkegHN73jnK+zrDsT1UlheC0588
         q83hAwABDNuyPADxTOjFwLfYZPwrmhdbMz8qDQQtNPSmeC/UyvlaLbMzxwz8peJlmeyk
         eJdrhkDnbq/dH/uQyzyXGy6vB4lbB+KFUZZv9JcCRYfcXY6+4/AyYtOBHrDOZoZnmo9d
         s+T+yEXnnEh17ZEUC8MPjsV5sQk6quuUWI+TFgja7lzR3dvN7c/+HmvrQLhKs6XXFswh
         pJIg==
X-Gm-Message-State: ACgBeo2BucRrVO3f+I1IFgrRCqzRf+kp8XEUp8lkGYJk3jmLLIOYjHet
        QaIJxh55JLTCmNf3ll60Irhe1Pv2R2us5lltep1EAA==
X-Google-Smtp-Source: AA6agR4zfL+mCyLPMvuzZV2d0nSZGb30JxRL/1Oxqun0mRzweDJVz11GA913syEmKL4OC4Jzm+bxlVcirJkUIN9yLQc=
X-Received: by 2002:a05:6512:2356:b0:492:e06d:7530 with SMTP id
 p22-20020a056512235600b00492e06d7530mr296877lfu.103.1661383530456; Wed, 24
 Aug 2022 16:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <CANXV_XwgZMCGXijfoUyZ9+KyM6Rgeqiq-sCfubyj_16d-2CN=A@mail.gmail.com>
 <20220815013317.26121-1-dmitrii.bundin.a@gmail.com> <CAKwvOdnnSAozX8bQ9HeSw12BV9OjpzyDmXk_BGczjVVQNN+7tQ@mail.gmail.com>
 <CANXV_Xw2wzwDdJkyV1nHPQm2JTt48SLrNc7YwrfcxOwuFA-z3w@mail.gmail.com>
 <CAKwvOdkiq_byi1QeCvSGb2fd+0AJ1k9WNnsHJMeaaQcPRy1Wxg@mail.gmail.com>
 <CAKwvOdkPwbD-c0V-up2Ufzb-Uh7LLyD12X0FKeBa=hn+cSPA9Q@mail.gmail.com> <CANXV_XzdTTYc2w7Ur8zY=ijOofg91yfF7RLhedbVH0rmi3c2yA@mail.gmail.com>
In-Reply-To: <CANXV_XzdTTYc2w7Ur8zY=ijOofg91yfF7RLhedbVH0rmi3c2yA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 24 Aug 2022 16:25:19 -0700
Message-ID: <CAKwvOdmq-6poADRajPi6CXuKsYYEPEe1tjXFuLEH6kHprerUdw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: add debug level and macro defs options
To:     Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Eric Dumazet <edumazet@google.com>,
        Isabella Basso <isabbasso@riseup.net>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 22, 2022 at 3:42 PM Dmitrii Bundin
<dmitrii.bundin.a@gmail.com> wrote:
>
> On Tue, Aug 23, 2022 at 12:36 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > or perhaps that simply needs to be `-g -gsplit-dwarf`?  In which case,
> > that if/else could just be re-arranged.
>
> How about simply assigning DEBUG_CFLAGS   := -g at the very beginning
> without any conditions? This would provide the default with the
> possibility of overriding later and -gsplit-dwarf does not necessarily
> come with -g implicitly.

SGTM; I'd accept such a patch.

> > Honestly, I really don't think we need to be wrapping every compiler
> > command line flag under the sun in a kconfig option.
>
> This indeed sounds reasonable to me. So the key point here is to not
> bloat the kconfig with options related to every compiler flag. But I
> think it still might be useful to provide some option that would
> include sort of full debug information compilers may produce. With
> this approach there would be, in fact 3 different levels of debug
> information supported by Kconfig: reduced, default and full. The full
> level would increase everything like -g3, and -fdebug-macro for Clang,
> and probably others.

Has anyone asked for that though?  It seems like your intent with this
patch is to fix the surprising+user hostile behavior of compilers
requiring -g to be used when -gsplit-dwarf is used.

If someone using GDB_SCRIPTS or KGDB was like "man, I wish I could
debug macros" then sure I'd be more likely to accept this. Without the
need, this is just wrapping every compiler option in a kconfig, which
frustrates randconfig testing bots.  This will slow them down and
bloat their artifacts when randconfig selects -g3, so I'd like someone
to come forward saying they need this and why.

>
> > Or add -g1 to CONFIG_DEBUG_INFO_REDUCED.
>
> I ran some tests and there was indeed some decrease in size. That
> combination probably might be useful.
>
> Any thoughts?

I think there's also -gmlt; when that is preferable to -g1 IDK. Why
either of those weren't used in the first place, IDK.

The help text in DEBUG_INFO_REDUCED in lib/Kconfig.debug makes it
sound like -gmlt is what is wanted.  Maybe that should be updated.

But I think DEBUG_INFO_REDUCED is redundant if we were to accept
DEBUG_INFO_LEVEL. Both don't need to exist IMO.
-- 
Thanks,
~Nick Desaulniers
