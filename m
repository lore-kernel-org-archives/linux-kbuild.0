Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34374 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbfIKRlg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 13:41:36 -0400
Received: by mail-qk1-f193.google.com with SMTP id q203so21657132qke.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2019 10:41:36 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
From: Qian Cai <cai@lca.pw>
In-Reply-To: <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
Date: Wed, 11 Sep 2019 13:41:33 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
References: <20190911173453.958-1-cai@lca.pw>
 <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@anandra.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, michal.lkml@markovi.net, mripard@kernel.org, sean@poorly.run, yamada.masahiro@socionext.com



> On Sep 11, 2019, at 1:37 PM, Maxime Ripard <maxime.ripard@anandra.org> =
wrote:
>=20
> Hi,
>=20
> Le mer. 11 sept. 2019 =C3=A0 19:35, Qian Cai <cai@lca.pw> a =C3=A9crit =
:
> The commit c0e09200dc08 ("drm: reorganise drm tree to be more future
> proof.") changed the behavior from only compiling drm/ if CONFIG_DRM=3Dy=

> to always compiling drm/. This restores the behavior, so people don't
> need to waste time compiling stuff they don't need.
>=20
> Fixes: c0e09200dc08 ("drm: reorganise drm tree to be more future =
proof.")
>=20
> You are missing your signed-off-by

That is intentional because this is a RFC patch to gather the feedback =
as I am no
expert in DRM and may miss something important.

Once people are happy with it, I plan to send a formal patch with =
Signed-off-by.
