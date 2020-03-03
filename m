Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38270 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgCCNqc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 08:46:32 -0500
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <CAK7LNAQUbfVvYYSuMNnB2OyNbuYZkzY0gsKRybe-0P9GuYZN2w@mail.gmail.com>
 <CAL_JsqLqZYZXGg8-FnoV8EFKSK8moQjEWe93+FazEbh9GTxQpw@mail.gmail.com>
In-Reply-To: <CAL_JsqLqZYZXGg8-FnoV8EFKSK8moQjEWe93+FazEbh9GTxQpw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Mar 2020 22:45:47 +0900
Message-ID: <CAK7LNATr5TX+CnxHhoa5qcNes6mTp9h0TJ_5=0fGzzq3M8FKxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 3, 2020 at 1:06 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Feb 28, 2020 at 10:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi Rob,
> >
> > On Sat, Feb 29, 2020 at 9:37 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > Most folks only run dt_binding_check on the single schema they care about
> > > by setting DT_SCHEMA_FILES. That means example is only checked against
> > > that one schema which is not always sufficient.
> > >
> > > Let's address this by splitting processed-schema.yaml into 2 files: one
> > > that's always all schemas for the examples and one that's just the schema
> > > in DT_SCHEMA_FILES for dtbs.
> > >
> > > Cc: Michal Marek <michal.lkml@markovi.net>
> > > Cc: linux-kbuild@vger.kernel.org
> > > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > Masahiro, given you pretty much re-wrote this, I added you as
> > > Co-developed-by.
> >
> >
> >
> > I can apply both to my kbuild tree.
>
> Please apply to your tree.


Done.
Thanks.


-- 
Best Regards
Masahiro Yamada
