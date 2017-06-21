Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:36056 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752252AbdFUVTf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 17:19:35 -0400
Received: by mail-pf0-f174.google.com with SMTP id q86so6592785pfl.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 14:19:35 -0700 (PDT)
Date: Wed, 21 Jun 2017 14:19:32 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the
 'duplicate-decl-specifier' warning
Message-ID: <20170621211932.GC52338@google.com>
References: <20170421213931.155210-3-mka@chromium.org>
 <CAD=FV=XENNp3rcD5OK1d2WmccbqaT9=bjsayvbnA2Th8zmOAwg@mail.gmail.com>
 <CAK8P3a1y0MoxhMNr2v=R7-CANaATfFy58FM8heyOP78g-JZwHA@mail.gmail.com>
 <20170517184529.GG141096@google.com>
 <20170524000419.GQ141096@google.com>
 <CAK8P3a3D6oW4vaUD9JSGXFqqydrm5-Z0x9qOwzfn_WQryXezsA@mail.gmail.com>
 <CAK7LNASXC1T_OkXD-T5XSKAHSNWrxAQCHPfk4dgnyq7MJBCSnQ@mail.gmail.com>
 <CAK8P3a1QOz6qQdQux4mFXfwadhosHUgw0Ypwmz5tjZOWcV+0qQ@mail.gmail.com>
 <20170621165832.GB52338@google.com>
 <CAK8P3a1yopRPex3yrKj50cRPy8d3+urGE2XN3aQ61Uu=FE8oVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1yopRPex3yrKj50cRPy8d3+urGE2XN3aQ61Uu=FE8oVQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Doug Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Alexander Potapenko <glider@google.com>, Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@linaro.org>

El Wed, Jun 21, 2017 at 07:59:42PM +0200 Arnd Bergmann ha dit:

> On Wed, Jun 21, 2017 at 6:58 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
> > El Wed, Jun 21, 2017 at 12:11:55PM +0200 Arnd Bergmann ha dit:
> >> I see that container_of() has been modified in linux-next and no longer adds
> >> the 'const' keyword, do we actually still need the patch?
> >
> > There is still (at least) the case of const arrays passed to
> > MODULE_DEVICE_TABLE.
> 
> Does the 'const' have any effect there? As it's just an alias, it
> should at least
> not impact the placement of the symbol in the object file, right?

I agree, it shouldn't make a difference.

> Maybe we can just remove that 'const' too.

Seems worth a try. Do you want to send a patch for the removal?

> Do you see any other instances?

For both x86 and arm64 defconfig the instances are all from
container_of() or MODULE_DEVICE_TABLE.
