Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:26017 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730552AbeLKQED (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 11:04:03 -0500
MIME-Version: 1.0
References: <20181210203225.11179-1-robh@kernel.org> <CAK7LNAThtAOy4PQiYZ2X0oWrHdcLi7on8ctSXJ=bfT0HNh7NFQ@mail.gmail.com>
 <CAL_JsqL7n2sjLbJVieVDQ4YtKMi2COCaijO9ZNu7ggzmXXxLEg@mail.gmail.com>
In-Reply-To: <CAL_JsqL7n2sjLbJVieVDQ4YtKMi2COCaijO9ZNu7ggzmXXxLEg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 12 Dec 2018 01:02:58 +0900
Message-ID: <CAK7LNARkr-g9ae+74QE6GMuxLM0JPgEqYOkwb0njXcb9-=nBdQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Add support for DT binding schema checks
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, darknighte@darknighte.com, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, grant.likely@arm.com, Kumar Gala <kumar.gala@linaro.org>, arm-soc <arm@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Dec 12, 2018 at 12:13 AM Rob Herring <robh@kernel.org> wrote:

>
> > > +$(obj)/%.example.dts: $(src)/%.yaml FORCE
> > > +       $(call if_changed,chk_binding)
> > > +
> > > +DT_TMP_SCHEMA := .schema.yaml.tmp
> >
> >
> > BTW, why does this file start with a period?
> > What is the meaning of '.tmp' extension?
>
> Nothing really. Just named it something so it gets cleaned and ignored by git.


It is cleaned whatever file name you use.


See scripts/Makefile.clean

__clean-files   := $(extra-y) $(extra-m) $(extra-)       \
                   $(always) $(targets) $(clean-files)   \
                   $(hostprogs-y) $(hostprogs-m) $(hostprogs-) \
                   $(hostlibs-y) $(hostlibs-m) $(hostlibs-) \
                   $(hostcxxlibs-y) $(hostcxxlibs-m)


$(extra-y) is cleaned.



You are adding *.example.dts to .gitignore

Why not "schema.yaml" ?




> > > +extra-y += $(DT_TMP_SCHEMA)
> > > +
> > > +quiet_cmd_mk_schema = SCHEMA  $@
> > > +      cmd_mk_schema = mkdir -p $(obj); \
> > > +                      rm -f $@; \
> > > +                      $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@ $(filter-out FORCE, $^)
> >
> >
> > "mkdir -p $(obj)" is redundant.
> >
> >
> > Why is 'rm -f $@' necessary ?
> > Can't dt-mk-schema overwrite the output file?
>
> It is for error case when the output file is not generated. I can
> handle this within dt-mk-schema instead.
> > > +DT_DOCS = $(shell cd $(srctree)/$(src) && find * -name '*.yaml')
> > > +DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
> > > +
> > > +extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
> > > +extra-y += $(patsubst $(src)/%.yaml,%.example.dtb, $(DT_SCHEMA_FILES))
> >
> >
> >
> > I assume you intentionally did not do like this:
> >
> > extra-y += $(patsubst %.yaml,%.example.dtb, $(DT_DOCS))
> >
> > From the commit description, DT_SCHEMA_FILES might be overridden by a user.
> > So, I think this is OK.
> >
> >
> >
> >
> > > +$(obj)/$(DT_TMP_SCHEMA): | $(addprefix $(obj)/,$(patsubst $(src)/%.yaml,%.example.dtb, $(DT_SCHEMA_FILES)))
> >
> > I do not understand this line.
> > Why is it necessary?
> >
> > *.example.dtb files are generated anyway
> > since they are listed in extra-y.
>
> It is enforcing the ordering. Without it, the binding checks and
> building .schema.yaml.tmp happen in parallel because both only have
> the source files as dependencies. The '|' keeps the dependencies out
> of the dependency list($^).


What kind problem would you see if
the binding checks and building .schema.yaml.tmp
happen in parallel?



-- 
Best Regards
Masahiro Yamada
