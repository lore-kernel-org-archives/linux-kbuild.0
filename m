Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgCBQG5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 11:06:57 -0500
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <CAK7LNAQUbfVvYYSuMNnB2OyNbuYZkzY0gsKRybe-0P9GuYZN2w@mail.gmail.com>
In-Reply-To: <CAK7LNAQUbfVvYYSuMNnB2OyNbuYZkzY0gsKRybe-0P9GuYZN2w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Mar 2020 10:06:40 -0600
Message-ID: <CAL_JsqLqZYZXGg8-FnoV8EFKSK8moQjEWe93+FazEbh9GTxQpw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Feb 28, 2020 at 10:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Rob,
>
> On Sat, Feb 29, 2020 at 9:37 AM Rob Herring <robh@kernel.org> wrote:
> >
> > Most folks only run dt_binding_check on the single schema they care about
> > by setting DT_SCHEMA_FILES. That means example is only checked against
> > that one schema which is not always sufficient.
> >
> > Let's address this by splitting processed-schema.yaml into 2 files: one
> > that's always all schemas for the examples and one that's just the schema
> > in DT_SCHEMA_FILES for dtbs.
> >
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: linux-kbuild@vger.kernel.org
> > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Masahiro, given you pretty much re-wrote this, I added you as
> > Co-developed-by.
>
>
>
> I can apply both to my kbuild tree.

Please apply to your tree.

Rob

>
> Or, if you want to apply them to your tree,
> please add my
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>
>
> Either way is fine.
>
> Thanks.
>
>
>
> >
> > Based on next/master
> >
> >  Documentation/devicetree/bindings/.gitignore |  2 +-
> >  Documentation/devicetree/bindings/Makefile   | 22 +++++++++++++-------
> >  scripts/Makefile.lib                         |  3 ++-
> >  3 files changed, 17 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/.gitignore b/Documentation/devicetree/bindings/.gitignore
> > index ef82fcfcccab..57afa1533a5f 100644
> > --- a/Documentation/devicetree/bindings/.gitignore
> > +++ b/Documentation/devicetree/bindings/.gitignore
> > @@ -1,2 +1,2 @@
> >  *.example.dts
> > -processed-schema.yaml
> > +processed-schema*.yaml
> > diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> > index 646cb3525373..7c40d5ba1b51 100644
> > --- a/Documentation/devicetree/bindings/Makefile
> > +++ b/Documentation/devicetree/bindings/Makefile
> > @@ -2,7 +2,6 @@
> >  DT_DOC_CHECKER ?= dt-doc-validate
> >  DT_EXTRACT_EX ?= dt-extract-example
> >  DT_MK_SCHEMA ?= dt-mk-schema
> > -DT_MK_SCHEMA_FLAGS := $(if $(DT_SCHEMA_FILES), -u)
> >
> >  quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
> >        cmd_chk_binding = $(DT_DOC_CHECKER) -u $(srctree)/$(src) $< ; \
> > @@ -11,26 +10,33 @@ quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
> >  $(obj)/%.example.dts: $(src)/%.yaml FORCE
> >         $(call if_changed,chk_binding)
> >
> > -DT_TMP_SCHEMA := processed-schema.yaml
> > +# Use full schemas when checking %.example.dts
> > +DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
> >
> >  quiet_cmd_mk_schema = SCHEMA  $@
> >        cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@ $(real-prereqs)
> >
> > -DT_DOCS = $(shell \
> > +DT_DOCS = $(addprefix $(src)/, \
> > +       $(shell \
> >         cd $(srctree)/$(src) && \
> >         find * \( -name '*.yaml' ! \
> > -               -name $(DT_TMP_SCHEMA) ! \
> > +               -name 'processed-schema*' ! \
> >                 -name '*.example.dt.yaml' \) \
> > -       )
> > +       ))
> >
> > -DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
> > +DT_SCHEMA_FILES ?= $(DT_DOCS)
> >
> >  ifeq ($(CHECK_DTBS),)
> >  extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
> >  extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
> > +extra-y += processed-schema-examples.yaml
> > +
> > +$(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
> > +       $(call if_changed,mk_schema)
> >  endif
> >
> > -$(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
> > +$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
> > +$(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) FORCE
> >         $(call if_changed,mk_schema)
> >
> > -extra-y += $(DT_TMP_SCHEMA)
> > +extra-y += processed-schema.yaml
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index f5ff506e4a24..b12dd5ba4896 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -307,7 +307,8 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> >
> >  DT_CHECKER ?= dt-validate
> >  DT_BINDING_DIR := Documentation/devicetree/bindings
> > -DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
> > +# DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
> > +DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
> >
> >  quiet_cmd_dtb_check =  CHECK   $@
> >        cmd_dtb_check =  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
> > --
> > 2.20.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada
