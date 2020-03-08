Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:33242 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgCHCTd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Mar 2020 21:19:33 -0500
MIME-Version: 1.0
References: <20200304032038.14424-1-masahiroy@kernel.org> <20200304032038.14424-3-masahiroy@kernel.org>
 <20200304055520.GA28911@ravnborg.org> <CAL_JsqLA7yq8rnVhM210sLt788yeu2xxFd94Fe0K_CGZw-mqSA@mail.gmail.com>
In-Reply-To: <CAL_JsqLA7yq8rnVhM210sLt788yeu2xxFd94Fe0K_CGZw-mqSA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Mar 2020 11:18:41 +0900
Message-ID: <CAK7LNATmnfjo2A0x6ytLNeo_rjv1_e9RFyxCnB-K1E1O=fw9jQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: allow to run dt_binding_check and dtbs_check
 in a single command
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, DTML <devicetree@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi Sam, Rob,

On Thu, Mar 5, 2020 at 12:19 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Mar 3, 2020 at 11:55 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Masahiro
> >
> > Thanks for the nice improvements to the dt infrastructure.
> >
> > Stealing a thread here..
> >
> > >  It is also possible to run checks with a single schema file by setting the
> > >  ``DT_SCHEMA_FILES`` variable to a specific schema file.
> > Would it be simple to enable the use of dirs for DT_SCHEMA_FILES?
>
> I did name that with the intent of supporting more than one file.
>
> > So I for example could do:
> >
> > make dt_bindings_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/
>
> Does this work?:
>
> make dt_bindings_check DT_SCHEMA_FILES="$(find
> Documentation/devicetree/bindings/display/panel/ -name '*.yaml' |
> xargs)"
>
> Rob


Rob proposed a solution, so
I do not think we should extend this too much.


BTW, there is a limitation that
DT_SCHEMA_FILES must point to file(s)
in Documentation/devicetree/bindings/.


$ cp  Documentation/devicetree/bindings/arm/psci.yaml   ./
$ make  dt_binding_check  DT_SCHEMA_FILES=psci.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
make[1]: *** No rule to make target
'Documentation/devicetree/bindings/psci.yaml', needed by '__build'.
Stop.
make: *** [Makefile:1278: dt_binding_check] Error 2



$(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
does not work if DT_SCHEMA_FILES is outside of
Documentation/devicetree/bindings/, but I have no
solution for this.

--
Best Regards
Masahiro Yamada
