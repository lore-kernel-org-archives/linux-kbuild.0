Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33235 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbgDUNQB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 09:16:01 -0400
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com> <20200421110537.GC5983@pendragon.ideasonboard.com>
In-Reply-To: <20200421110537.GC5983@pendragon.ideasonboard.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 21 Apr 2020 22:15:02 +0900
Message-ID: <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Laurent,

On Tue, Apr 21, 2020 at 8:05 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yamada-san,
>
> On Tue, Apr 21, 2020 at 07:45:05PM +0900, Masahiro Yamada wrote:
> > On Tue, Apr 21, 2020 at 7:08 PM Laurent Pinchart wrote:
> > > On Fri, Feb 28, 2020 at 06:37:30PM -0600, Rob Herring wrote:
> > > > Most folks only run dt_binding_check on the single schema they care about
> > > > by setting DT_SCHEMA_FILES. That means example is only checked against
> > > > that one schema which is not always sufficient.
> > > >
> > > > Let's address this by splitting processed-schema.yaml into 2 files: one
> > > > that's always all schemas for the examples and one that's just the schema
> > > > in DT_SCHEMA_FILES for dtbs.
> > >
> > > This broke
> > >
> > > make DT_SCHEMA_FILES=Documentation/devicetree/.. dt_binding_check
> >
> > What is intended by
> > "DT_SCHEMA_FILES=Documentation/devicetree/.."  ?
>
> My bad, I forgot to write that ... is the continuation of the string.
> It's any yaml schema file that has an example.

Ah, OK. I just input verbatim.

Is it broken?

You can specify any individual file(s) under Documentation/devicetree/bindings/.

For example, the following worked for me.

$ make DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml
 dt_binding_check
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTCC  scripts/dtc/yamltree.o
  HOSTLD  scripts/dtc/dtc
  CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
  DTC     Documentation/devicetree/bindings/arm/psci.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/arm/psci.example.dt.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml


-- 
Best Regards
Masahiro Yamada
