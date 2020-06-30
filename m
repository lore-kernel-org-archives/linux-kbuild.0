Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:60299 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgF3Bwo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 21:52:44 -0400
MIME-Version: 1.0
References: <20200625170434.635114-1-masahiroy@kernel.org> <20200625170434.635114-5-masahiroy@kernel.org>
 <CAL_JsqL4pTFK_pSNn1cSvjzwdg71dVzM3P06BYYEwDj2t+swPA@mail.gmail.com>
In-Reply-To: <CAL_JsqL4pTFK_pSNn1cSvjzwdg71dVzM3P06BYYEwDj2t+swPA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jun 2020 10:51:34 +0900
Message-ID: <CAK7LNAQzG5ty=knL4eh=8w43p57BGMf6mRMTR1rPrhdFoKs7YA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: split DT schema check rules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 30, 2020 at 5:50 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Jun 25, 2020 at 11:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > When building %.dt.yaml from %.dts, two things happen in a row:
> >
> >  [1] Run DTC to convert %.dts into %.dt.yaml
> >
> >  [2] Run dt-validate against %.dt.yaml
> >
> > Currently, when any .yaml schema file is updated, processed-schema.yaml
> > is regenerated, then both [1] and [2] are rerun for all .dts files.
> >
> > Actually, we do not need to rerun [1] since the original .dts is not
> > updated.
>
> I have plans (and an intern working on it) to integrate the schema
> checks into dtc. That's going to make turning on the schema checks
> just a flag to dtc. I'm not sure if adding the complexity here is
> worth it as I'd expect much of this patch to go away again.
>
> Is there any negative impact on the absolute clean build time? I'm
> more concerned about that than optimizing rerunning.

No benefit on the absolute clean build time.

OK, then please skip this patch.




-- 
Best Regards
Masahiro Yamada
