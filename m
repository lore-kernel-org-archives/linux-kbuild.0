Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbgDUTbd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 15:31:33 -0400
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com> <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
 <CAK7LNASe9ahgo04=cAuXcsaoffb9CtnUCYOObJd5=Awaak+YZw@mail.gmail.com>
In-Reply-To: <CAK7LNASe9ahgo04=cAuXcsaoffb9CtnUCYOObJd5=Awaak+YZw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Apr 2020 14:31:19 -0500
Message-ID: <CAL_JsqKV4UQeSX1ArJb4es1_kkMp1kbkd2kd17qVc=Oy988F7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Apr 21, 2020 at 11:57 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Rob,
>
>
> On Tue, Apr 21, 2020 at 11:01 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > It seems to only fail with out of tree builds (O=...). I expect that
> > > failures will become more common the more YAML bindings we have, even
> > > without long directory names.
> >
> > dt-mk-schema can take and recurse a single directory already, so does
> > this fix it for you:
> >
> > @@ -22,7 +22,7 @@ $(obj)/%.example.dts: $(src)/%.yaml
> > check_dtschema_version FORCE
> >  DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
> >
> >  quiet_cmd_mk_schema = SCHEMA  $@
> > -      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> > $(real-prereqs)
> > +      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> > $(srctree)/$(src)
>
>
> I am just curious.
>
> How come the tool excludes 'processed-schema*' and '*.example.dt.yaml'
> from $(srctree)/$(src) ?

Uggg, it wouldn't. Can't everyone build out of tree. ;) I guess the options are:

- Call dt-mk-schema on each file individually appending the result
- Make dt-mk-schema take stdin or a file with a list of files as
Masahiro suggested

I'd like to avoid a dt-mk-schema change so I'll try to make the former
work. It's only been a day since adding a minimum version. :(

Rob
