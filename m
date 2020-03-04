Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbgCDPT4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 10:19:56 -0500
MIME-Version: 1.0
References: <20200304032038.14424-1-masahiroy@kernel.org> <20200304032038.14424-3-masahiroy@kernel.org>
 <20200304055520.GA28911@ravnborg.org>
In-Reply-To: <20200304055520.GA28911@ravnborg.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 4 Mar 2020 09:19:43 -0600
Message-ID: <CAL_JsqLA7yq8rnVhM210sLt788yeu2xxFd94Fe0K_CGZw-mqSA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: allow to run dt_binding_check and dtbs_check
 in a single command
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, devicetree@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Mar 3, 2020 at 11:55 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro
>
> Thanks for the nice improvements to the dt infrastructure.
>
> Stealing a thread here..
>
> >  It is also possible to run checks with a single schema file by setting the
> >  ``DT_SCHEMA_FILES`` variable to a specific schema file.
> Would it be simple to enable the use of dirs for DT_SCHEMA_FILES?

I did name that with the intent of supporting more than one file.

> So I for example could do:
>
> make dt_bindings_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/

Does this work?:

make dt_bindings_check DT_SCHEMA_FILES="$(find
Documentation/devicetree/bindings/display/panel/ -name '*.yaml' |
xargs)"

Rob
