Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgDUS31 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 14:29:27 -0400
Date: Tue, 21 Apr 2020 21:29:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
Message-ID: <20200421182909.GE5983@pendragon.ideasonboard.com>
References: <20200229003731.2728-1-robh@kernel.org>
 <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com>
 <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com>
 <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Rob,

On Tue, Apr 21, 2020 at 09:01:32AM -0500, Rob Herring wrote:
> On Tue, Apr 21, 2020 at 8:47 AM Laurent Pinchart wrote:
> > On Tue, Apr 21, 2020 at 10:15:02PM +0900, Masahiro Yamada wrote:
> > > On Tue, Apr 21, 2020 at 8:05 PM Laurent Pinchart wrote:
> > > > On Tue, Apr 21, 2020 at 07:45:05PM +0900, Masahiro Yamada wrote:
> > > > > On Tue, Apr 21, 2020 at 7:08 PM Laurent Pinchart wrote:
> > > > > > On Fri, Feb 28, 2020 at 06:37:30PM -0600, Rob Herring wrote:
> > > > > > > Most folks only run dt_binding_check on the single schema they care about
> > > > > > > by setting DT_SCHEMA_FILES. That means example is only checked against
> > > > > > > that one schema which is not always sufficient.
> > > > > > >
> > > > > > > Let's address this by splitting processed-schema.yaml into 2 files: one
> > > > > > > that's always all schemas for the examples and one that's just the schema
> > > > > > > in DT_SCHEMA_FILES for dtbs.
> > > > > >
> > > > > > This broke
> > > > > >
> > > > > > make DT_SCHEMA_FILES=Documentation/devicetree/.. dt_binding_check
> > > > >
> > > > > What is intended by
> > > > > "DT_SCHEMA_FILES=Documentation/devicetree/.."  ?
> > > >
> > > > My bad, I forgot to write that ... is the continuation of the string.
> > > > It's any yaml schema file that has an example.
> > >
> > > Ah, OK. I just input verbatim.
> > >
> > > Is it broken?
> > >
> > > You can specify any individual file(s) under Documentation/devicetree/bindings/.
> > >
> > > For example, the following worked for me.
> > >
> > > $ make DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml
> > >  dt_binding_check
> > >   HOSTCC  scripts/basic/fixdep
> > >   HOSTCC  scripts/dtc/dtc.o
> > >   HOSTCC  scripts/dtc/flattree.o
> > >   HOSTCC  scripts/dtc/fstree.o
> > >   HOSTCC  scripts/dtc/data.o
> > >   HOSTCC  scripts/dtc/livetree.o
> > >   HOSTCC  scripts/dtc/treesource.o
> > >   HOSTCC  scripts/dtc/srcpos.o
> > >   HOSTCC  scripts/dtc/checks.o
> > >   HOSTCC  scripts/dtc/util.o
> > >   LEX     scripts/dtc/dtc-lexer.lex.c
> > >   YACC    scripts/dtc/dtc-parser.tab.[ch]
> > >   HOSTCC  scripts/dtc/dtc-lexer.lex.o
> > >   HOSTCC  scripts/dtc/dtc-parser.tab.o
> > >   HOSTCC  scripts/dtc/yamltree.o
> > >   HOSTLD  scripts/dtc/dtc
> > >   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
> > >   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
> > >   DTC     Documentation/devicetree/bindings/arm/psci.example.dt.yaml
> > >   CHECK   Documentation/devicetree/bindings/arm/psci.example.dt.yaml
> > >   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> >
> > This is getting interesting.
> >
> > ~/src/kernel/linux $ make O=output/x86 DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml dt_binding_check
> > make[1]: Entering directory '/home/laurent/src/kernel/linux/output/x86'
> >   HOSTCC  scripts/basic/fixdep
> >   HOSTCC  scripts/dtc/dtc.o
> >   HOSTCC  scripts/dtc/flattree.o
> >   HOSTCC  scripts/dtc/fstree.o
> >   HOSTCC  scripts/dtc/data.o
> >   HOSTCC  scripts/dtc/livetree.o
> >   HOSTCC  scripts/dtc/treesource.o
> >   HOSTCC  scripts/dtc/srcpos.o
> >   HOSTCC  scripts/dtc/checks.o
> >   HOSTCC  scripts/dtc/util.o
> >   LEX     scripts/dtc/dtc-lexer.lex.c
> >   YACC    scripts/dtc/dtc-parser.tab.[ch]
> >   HOSTCC  scripts/dtc/dtc-lexer.lex.o
> >   HOSTCC  scripts/dtc/dtc-parser.tab.o
> >   HOSTCC  scripts/dtc/yamltree.o
> >   HOSTLD  scripts/dtc/dtc
> >   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
> >   DTC     Documentation/devicetree/bindings/arm/psci.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/arm/psci.example.dt.yaml
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
> > make[1]: Leaving directory '/home/laurent/src/kernel/linux/output/x86'
> >
> > ~/src/kernel/this_is_a_long_directory_name/linux $ make O=output/x86 DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml dt_binding_check
> > make[1]: Entering directory '/home/laurent/src/kernel/this_is_a_long_directory_name/linux/output/x86'
> >   HOSTCC  scripts/basic/fixdep
> >   HOSTCC  scripts/dtc/dtc.o
> >   HOSTCC  scripts/dtc/flattree.o
> >   HOSTCC  scripts/dtc/fstree.o
> >   HOSTCC  scripts/dtc/data.o
> >   HOSTCC  scripts/dtc/livetree.o
> >   HOSTCC  scripts/dtc/treesource.o
> >   HOSTCC  scripts/dtc/srcpos.o
> >   HOSTCC  scripts/dtc/checks.o
> >   HOSTCC  scripts/dtc/util.o
> >   LEX     scripts/dtc/dtc-lexer.lex.c
> >   YACC    scripts/dtc/dtc-parser.tab.[ch]
> >   HOSTCC  scripts/dtc/dtc-lexer.lex.o
> >   HOSTCC  scripts/dtc/dtc-parser.tab.o
> >   HOSTCC  scripts/dtc/yamltree.o
> >   HOSTLD  scripts/dtc/dtc
> >   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
> > make[2]: execvp: /bin/sh: Argument list too long
> > make[2]: *** [/home/laurent/src/kernel/this_is_a_long_directory_name/linux/Documentation/devicetree/bindings/Makefile:38: Documentation/devicetree/bindings/processed-schema-examples.yaml] Error 127
> > make[1]: *** [/home/laurent/src/kernel/this_is_a_long_directory_name/linux/Makefile:1300: dt_binding_check] Error 2
> > make[1]: Leaving directory '/home/laurent/src/kernel/this_is_a_long_directory_name/linux/output/x86'
> > make: *** [Makefile:180: sub-make] Error 2
> >
> > It seems to only fail with out of tree builds (O=...). I expect that
> > failures will become more common the more YAML bindings we have, even
> > without long directory names.
> 
> dt-mk-schema can take and recurse a single directory already, so does
> this fix it for you:

Yes, the change below fixes my problem, thank you.

> @@ -22,7 +22,7 @@ $(obj)/%.example.dts: $(src)/%.yaml
> check_dtschema_version FORCE
>  DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
> 
>  quiet_cmd_mk_schema = SCHEMA  $@
> -      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> $(real-prereqs)
> +      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> $(srctree)/$(src)
> 
>  DT_DOCS = $(addprefix $(src)/, \
>         $(shell \

-- 
Regards,

Laurent Pinchart
