Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58547 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgDUQ5d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 12:57:33 -0400
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com> <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
In-Reply-To: <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Apr 2020 01:56:38 +0900
Message-ID: <CAK7LNASe9ahgo04=cAuXcsaoffb9CtnUCYOObJd5=Awaak+YZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Rob,


On Tue, Apr 21, 2020 at 11:01 PM Rob Herring <robh@kernel.org> wrote:
> >
> > It seems to only fail with out of tree builds (O=...). I expect that
> > failures will become more common the more YAML bindings we have, even
> > without long directory names.
>
> dt-mk-schema can take and recurse a single directory already, so does
> this fix it for you:
>
> @@ -22,7 +22,7 @@ $(obj)/%.example.dts: $(src)/%.yaml
> check_dtschema_version FORCE
>  DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
>
>  quiet_cmd_mk_schema = SCHEMA  $@
> -      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> $(real-prereqs)
> +      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> $(srctree)/$(src)


I am just curious.

How come the tool excludes 'processed-schema*' and '*.example.dt.yaml'
from $(srctree)/$(src) ?





-- 
Best Regards
Masahiro Yamada
