Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC97C433EF
	for <linux-kbuild@archiver.kernel.org>; Fri,  8 Apr 2022 20:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbiDHUpJ (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 8 Apr 2022 16:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234060AbiDHUpI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Apr 2022 16:45:08 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6FD39174
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Apr 2022 13:43:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d40so9442623lfv.11
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Apr 2022 13:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Da2qAwNbvrZU08VFGRkDL3N3/jfO2QzNiebireMf8MI=;
        b=cIx42nsSypnh3n2cMIa/b98xMgO9TRkrVcj1t+o7OB+VEP4rDNCnCUZoM01F2Nid6i
         EZpvarMfGLwtINPcThfgNdRlGWhe8v/G7tXyWSs9c5Nu3iEDOMEMTaT3gKa599m/aJ20
         dZt2soOKlT83ReS7Bsq86K7nO/lELkTjFWeYh/L8yIBRR4ef4eOF4WveeD40O31hdvX7
         phLyrpYqrMWiKPpusSkxjkp4pRSf3eE7zbfetlM5tXWkvovq1s7RIs5XlaK6YX+a2DSG
         jR8bU8/HMHmtOxfB4cZHtKWbjRqGqpXyaZ6IjI+lbrLIoiaUAPyDKSzzRfoEwzu3Xjhs
         7ESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Da2qAwNbvrZU08VFGRkDL3N3/jfO2QzNiebireMf8MI=;
        b=DynyFiCtj9UyiaUbgJwv/pmHtwwTE/MyXZCDCCJrYhCgPXMCpdmSskJJZf5z4+UEVF
         zqeiMC2+Snr3pfqwaJ2iYh0LRO12bpLk8RpFpe75Vm+wxZi4mDhQrEP3+m26f9up3f+A
         I2hZwiPAf2fWRqf5v1CY0hBOSwRvDRjUBpNSoPuntKSkYfyRzJG4eXHs7Unht3whbnLO
         njULifBt7znU7JiWLh/xPIPZtooSjwpGRRCS8f508TA7jjHgl/4SzCfCHZyZHB/c7SNl
         j/rIZdR3fnslcj8WVR3EtSn2076Jr5of+PZmrHL+apGqJ06JWAnJBHkcz868J3E7ujEV
         GAWg==
X-Gm-Message-State: AOAM530QCDORQGeQov10LbCCIhric1Cxqgg+mxQrnXRl+0EJBguqb+iv
        BYtDR1RqsJGnOpOIt8MBZx7l4T6RQoNN4OEPCgecmu5jZPbe2A==
X-Google-Smtp-Source: ABdhPJyBwA8BhmkEKHcEPRpWRBKh48D8fuSPYzorAnnFv5jxS0dZqPWX+zA3z0NcoxQHW0ZPQEkaQu5rZIFMN3wIHss=
X-Received: by 2002:a05:6512:3da1:b0:44a:2aeb:28e4 with SMTP id
 k33-20020a0565123da100b0044a2aeb28e4mr13385275lfv.579.1649450581749; Fri, 08
 Apr 2022 13:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220406153023.500847-1-masahiroy@kernel.org> <20220406153023.500847-6-masahiroy@kernel.org>
 <CAKwvOdnHneCy6YeanmvDrabYMWysfQ=WMopsT_gRyrruT8=1Dw@mail.gmail.com> <CAK7LNATUv2YqGLGMTjzoCWf2tVkeYe6O9xa==wdDr0pgvSnnLQ@mail.gmail.com>
In-Reply-To: <CAK7LNATUv2YqGLGMTjzoCWf2tVkeYe6O9xa==wdDr0pgvSnnLQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 8 Apr 2022 13:42:50 -0700
Message-ID: <CAKwvOdnj77+8OHGZcJ-pAMcFW1FzjhkPsvs90PPD+L64t0+Mpw@mail.gmail.com>
Subject: Re: [PATCH 5/7] kbuild: get rid of duplication in *.mod files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 7, 2022 at 5:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Apr 8, 2022 at 2:55 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Wed, Apr 6, 2022 at 8:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 6ae92d119dfa..f7a30f378e20 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -303,7 +303,8 @@ $(obj)/%.prelink.o: $(obj)/%.o FORCE
> > >         $(call if_changed,cc_prelink_modules)
> > >  endif
> > >
> > > -cmd_mod = echo $(addprefix $(obj)/, $(call real-search, $*.o, .o, -objs -y -m)) > $@
> > > +cmd_mod = echo $(addprefix $(obj)/, $(call real-search, $*.o, .o, -objs -y -m)) | \
> > > +       $(AWK) -v RS='( |\n)' '!x[$$0]++' > $@
> >
> > God AWK is unreadable. Any reason we can't use GNU make's sort builtin?
> > https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
>
>
> I did that in the previous submission.
> https://lore.kernel.org/lkml/20220405113359.2880241-8-masahiroy@kernel.org/
>
>
> After some thoughts, I decided to drop duplicates without sorting.
>
> If I alphabetically sorted the object list,
> 7/7 of this series would be impossible.
>
>
> I am not a big fan of AWK, but I do not know a cleaner way.
> If you know a better idea, please tell me.

```
# stable_dedup.py
from sys import argv

wordset = set()
argv.pop(0)
for word in argv: wordset.add(word)
for word in wordset: print(word)
```
If that ever shows up in a profile of a kernel build, <set> in C++
looks pretty similar.  Then that script can be reused in a couple of
other places, and has a more descriptive name that hints at what it
does.

Compare that with `$(AWK) -v RS='( |\n)' '!x[$$0]++'`.
-- 
Thanks,
~Nick Desaulniers
