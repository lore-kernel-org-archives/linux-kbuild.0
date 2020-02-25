Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47025 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728725AbgBYEdu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 23:33:50 -0500
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200224225253.GA27948@bogus>
In-Reply-To: <20200224225253.GA27948@bogus>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 25 Feb 2020 13:32:58 +0900
Message-ID: <CAK7LNAS+iOAonhxN2BK4D8TSb8F-BqPxDGFU0AOv9fZ2So4iqA@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: fix DT binding schema rule to detect command
 line changes
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Rob,

On Tue, Feb 25, 2020 at 7:52 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Feb 23, 2020 at 04:04:31AM +0900, Masahiro Yamada wrote:
> > This if_change_rule is not working; it cannot detect any command line
> > changes.
> >
> > The reason is because cmd-check in scripts/Kbuild.include compares
> > $(cmd_$@) and $(cmd_$1), but cmd_dtc_dt_yaml does not exist here.
> >
> > For if_change_rule to work properly, the stem part of cmd_* and rule_*
> > must match. Because this cmd_and_fixdep invokes cmd_dtc, this rule must
> > be named rule_dtc.
> >
> > Fixes: 4f0e3a57d6eb ("kbuild: Add support for DT binding schema checks")
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/Makefile.lib | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> For the series,
>
> Acked-by: Rob Herring <robh@kernel.org>
>
> I'm assuming you will take these? If not, I can in the DT tree.

Yes, I will queue these to kbuild tree.





-- 
Best Regards
Masahiro Yamada
