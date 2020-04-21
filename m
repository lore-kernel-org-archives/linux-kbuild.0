Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42597 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgDURcp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 13:32:45 -0400
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <CAL_JsqLRWdBm24ZmL+muo4Ef8OoxkYPDNo4ksWSrnvmO_89wkA@mail.gmail.com>
In-Reply-To: <CAL_JsqLRWdBm24ZmL+muo4Ef8OoxkYPDNo4ksWSrnvmO_89wkA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Apr 2020 02:31:44 +0900
Message-ID: <CAK7LNARu1hTM6r-w4gf4nuWXfori62Y5t8mFDKjkhBe2MRMD4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Rob,

On Tue, Apr 21, 2020 at 10:47 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 21, 2020 at 8:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi Laurent,
> >
> > On Tue, Apr 21, 2020 at 8:05 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Yamada-san,
> > >
> > > On Tue, Apr 21, 2020 at 07:45:05PM +0900, Masahiro Yamada wrote:
> > > > On Tue, Apr 21, 2020 at 7:08 PM Laurent Pinchart wrote:
> > > > > On Fri, Feb 28, 2020 at 06:37:30PM -0600, Rob Herring wrote:
> > > > > > Most folks only run dt_binding_check on the single schema they care about
> > > > > > by setting DT_SCHEMA_FILES. That means example is only checked against
> > > > > > that one schema which is not always sufficient.
> > > > > >
> > > > > > Let's address this by splitting processed-schema.yaml into 2 files: one
> > > > > > that's always all schemas for the examples and one that's just the schema
> > > > > > in DT_SCHEMA_FILES for dtbs.
> > > > >
> > > > > This broke
> > > > >
> > > > > make DT_SCHEMA_FILES=Documentation/devicetree/.. dt_binding_check
> > > >
> > > > What is intended by
> > > > "DT_SCHEMA_FILES=Documentation/devicetree/.."  ?
> > >
> > > My bad, I forgot to write that ... is the continuation of the string.
> > > It's any yaml schema file that has an example.
> >
> > Ah, OK. I just input verbatim.
> >
> > Is it broken?
> >
> > You can specify any individual file(s) under Documentation/devicetree/bindings/.
> >
> > For example, the following worked for me.
>
> Me too.
>
> There is however a bug I just noticed. We're now always setting '-u'
> for dtbs_check which means the core schema are never used.
>
> Masahiro, Got a better suggestion than adding the ifeq:
>
> ifeq ("$(origin DT_SCHEMA_FILES)", "command line")
> $(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
> endif


Hmm, this does not work when DT_SCHEMA_FILES is
passed as the environment variable.


ifneq ("$(origin DT_SCHEMA_FILES)", "file")
$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
endif

... should work, I think.


Maybe, the following also works. Please choose whatever you like.

diff --git a/Documentation/devicetree/bindings/Makefile
b/Documentation/devicetree/bindings/Makefile
index 1df680d07461..a939bb18f66b 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -2,6 +2,7 @@
 DT_DOC_CHECKER ?= dt-doc-validate
 DT_EXTRACT_EX ?= dt-extract-example
 DT_MK_SCHEMA ?= dt-mk-schema
+DT_MK_SCHEMA_USERONLY_FLAG := $(if $(DT_SCHEMA_FILES), -u)

 quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
       cmd_chk_binding = $(DT_DOC_CHECKER) -u $(srctree)/$(src) $< ; \
@@ -37,7 +38,7 @@ override DTC_FLAGS := \
 $(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
        $(call if_changed,mk_schema)

-$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
+$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS :=
$(DT_MK_SCHEMA_USERONLY_FLAG)
 $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) FORCE
        $(call if_changed,mk_schema)



-- 
Best Regards
Masahiro Yamada
