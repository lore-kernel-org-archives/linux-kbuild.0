Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:55862 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbfILAxC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 20:53:02 -0400
MIME-Version: 1.0
References: <20190911173453.958-1-cai@lca.pw> <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
 <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
In-Reply-To: <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Sep 2019 09:52:03 +0900
Message-ID: <CAK7LNASuqYP6kCvkkWQSw1=_DqyYPjgGwxjg3yCtXqyB2KKqrg@mail.gmail.com>
Subject: Re: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Qian Cai <cai@lca.pw>
Cc: Maxime Ripard <maxime.ripard@anandra.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, maarten.lankhorst@linux.intel.com, Michal Marek <michal.lkml@markovi.net>, mripard@kernel.org, Sean Paul <sean@poorly.run>

On Thu, Sep 12, 2019 at 2:41 AM Qian Cai <cai@lca.pw> wrote:
>
>
>
> > On Sep 11, 2019, at 1:37 PM, Maxime Ripard <maxime.ripard@anandra.org> =
wrote:
> >
> > Hi,
> >
> > Le mer. 11 sept. 2019 =C3=A0 19:35, Qian Cai <cai@lca.pw> a =C3=A9crit =
:
> > The commit c0e09200dc08 ("drm: reorganise drm tree to be more future
> > proof.") changed the behavior from only compiling drm/ if CONFIG_DRM=3D=
y
> > to always compiling drm/. This restores the behavior, so people don't
> > need to waste time compiling stuff they don't need.
> >
> > Fixes: c0e09200dc08 ("drm: reorganise drm tree to be more future proof.=
")
> >
> > You are missing your signed-off-by
>
> That is intentional because this is a RFC patch to gather the feedback as=
 I am no
> expert in DRM and may miss something important.
>
> Once people are happy with it, I plan to send a formal patch with Signed-=
off-by.
>


CONFIG_DRM is tristate.

Your patch requires everything under drivers/gpu/drm/
modular when CONFIG_DRM=3Dm.

At least, drivers/gpu/drm/drm_mipi_dsi.c
is built-in only.

I guess that is the reason why
they use 'obj-y +=3D drm/'.


In other words, if you are able to
make all the drm code modular,
your patch is applicable.


--=20
Best Regards
Masahiro Yamada
