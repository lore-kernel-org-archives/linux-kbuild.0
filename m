Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA4335E956
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2026 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709358; cv=pass; b=tA8W7WllmzF8/TXA4NmY+9d5SsUQTZULEDtOvNZ/1TMHtC6Kfh3V28GOB0Iakc01qBuVnUe+fNdPjMP65TeBbwZKOGSmKET+XD5ClgBJnC6dFbJ+ueI/PgOuGfZQAujzV9D3UZjkZo57aHlZyS3tREmWJzQtJfW937jfpR/E/Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709358; c=relaxed/simple;
	bh=V3u7iIRW+SXzbS6GvRRQpxd4ozwFgtSViYufwpoTtdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T52UENLRQDIx+xJxuzSUDf/vHcOP1LsmeNN4Q0KHPBYDJ50Pd0KeN+5edKx3AoccexfldT/FIzEO9C3BTDpq00Y8jQyB1rK5kzs+KCOXiefSFHPizLeD1DNaDtCMbxGfC+E38VP3JMjhb0+KE1d09c3nNwUSdycFKyzTtUCmnrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qslBokqP; arc=pass smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qslBokqP"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac768bda6aso4132370a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2026 12:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790709355; cv=none;
        d=google.com; s=arc-20260327;
        b=eKOfrmR+NGZp0gg9oF8/amAoIPFt11rWYc8yhOZf7+gqbvtm3qhqQxAUz+aGkqmYlH
         /om482PBLBm7iqvQrAnp33r1eTj6uGkbWU75GqnEoo2x5f+l5Q95zwvOqyTF9vuBZptf
         tUQjNmf3HVISFRoEiyS+PCb0oH8eRgptwqa8AN7XvM/uB2PzzzvLIpkdzOvgKLOGl/qK
         kWb3dN34LO0ourwtUVe25RH+1Ckt6GXeBdL69GQkVF9GFk4OBXjJ7s2nNIV6DQozj3YN
         FJwDxWUP0STubhUDFvpL1C0CAMiMkB58utZ98hfZPVZmEo0gzQwo5AwJKR1KA5gXsH9q
         f5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R9/VRUhXxroLFk9m3E/XqlsvjwngRrUYtOD5JdsvCsw=;
        fh=25/4+b3vaIBhY+dFeYd79Huiw6eAsBSKyk1Vm0yfIRw=;
        b=FfT0vSdH65fMJWfKV7f6pIeODLo1HZIQthsyLBDkMfa8xqNsyTQhOhcVT8Co2noAb+
         j4ZGVkhWJOrCROiiRpBGMP35x0UL2gVMwjGkUdKpqGGQ/5j7LjzMWaR04Bq2Un+8XjDB
         vYST1mEu9obfKHFNLqN5aGlEzfqU7zdWMI1t2/g9EdG3NT08fdyPCWF2zVFVrtSPunwk
         T45/CrZlb35zuMlKyShE2DPtWZLDSOFSeyz/EXnsX12gnbSr6M6p3UTJbcqrqx6EfE0O
         CAmFj1r2oAMP+lV/MukZ27FUKIpoI4V9M2vVJSekhAMbPZc9UVPA+uCMpVLMlkXIR28W
         60fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790709355; x=1791314155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R9/VRUhXxroLFk9m3E/XqlsvjwngRrUYtOD5JdsvCsw=;
        b=qslBokqP82LRNNX6hIQZtgRhKdAYxxY4AMKVekyjD2NqxOsndrf/7nDfe2jzrOq05p
         Mt3Xwfi01eubvnjcheIcCTzsFDw7f1g1O5Th1JIGYARcaj2IPAYd9ZaNiyu9UDilMW0B
         RCLCiJ4Sx3iC2NTaYKp/8FGnkUfP1QuPkGIkAV2tkFvfed9jqfZ6Q5J1o5xUvlMNT7rN
         AdE/vebjSbtOn+9xn0juGtX0w366PmRBZTiajNzGO0OOCFb7eljdtS68OEXbUyxcGC4L
         1I/fFeR10a9R7b7x+Ehd1K9Ra3lar+ZCtfNHd1EIDBRfL07Tm8b94vNeZrcDGImnqfO9
         IbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790709355; x=1791314155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9/VRUhXxroLFk9m3E/XqlsvjwngRrUYtOD5JdsvCsw=;
        b=ah/+lIbtuj2oP6Dct3RPfArUhib9S2gyGPkk4ZEWDIPW2GPudzxXQz8MmjwVRO81/Y
         FlmJe3j+THx6V8qB22vVwm2C2lpVOzprvCKiU5B09pjFgu3/CBYyQbo7HFBKJu9IOdeS
         yDdFGc1eMovyHdja/EhwHU42AZKgT/EUFC0nHUMS2WaZcBpqLxyrEGaq2SYxERgt68XZ
         e1jaD4DWVqzlzfX8CaF0z9KYv/LRhcrdF1UJcOmNPC7KK1BAVPH79mLHdtSNESUobrm8
         Ns26cHJ0n/NR6MkFHw3zWfN3rLSDxTdqDB3PozCoPjIjioVxaKh6u+a1Z+x27Mg0FwMb
         aNAw==
X-Forwarded-Encrypted: i=1; AKwUvBxtY0GW2+pRHgs+ROKkfVdOKBX+jDAh95HqnNQOWGCVSbRIMdYEFMcn01DjDSBYugNaE1leoR8nQL8PMoo=@vger.kernel.org
X-Gm-Message-State: AFuF++nKXkOzk33uo2IqX/jMT8oLmvAoBwuaQk/nDTxiR5mrhhOLr4dC
	F7Ga/diwcNe9ZZXDjx+gf6g03YTb1+2qHcnPXNgVCzH1PNjIQjLfIGWrhhpyJ/396GEBWDVoJvj
	HeJeH9A/DwlwMwBtpDH1vM2mh0FGpyWg=
X-Gm-Gg: AYBFou1XUGQ3CxZ926X9ZrO0T9yQJwD3fdKJT98cLRzYLaS907AhMY8RD+WycoBBkbm
	6NqgjDKlz3QmB/AOa56LBWetv22fIrFjLASXT9RVAEiGCIJ3BnHlzuA0PZcNyyS3Uf0uSvI0NKI
	kGiYI27RKZYdtcNrMzHbLoDn0pTIZF/DyAbErehqPRepFCyI8CUAeiAp7/WxCv1iKt+PXQcavfw
	7D4VCugF4Hk7g0fFtKrrhWOEaMNmyFWCAs7bPRvD3xkFwcaL6zkf8kcs2aQDS8VhDfNqS46uzYe
	zq5Mq1f0306typ0JuGnYuaOSKT+sXBaZmiQI2Tm2vOoLDsuDYDH+bTnuS1vahTQeeUrywd6vIn3
	KSBFh0hQEBu686PJviPeVLw3ehMkUhKM+qjmCris4UR7rhZk=
X-Received: by 2002:a17:907:d716:b0:c29:45f6:6a0b with SMTP id
 a640c23a62f3a-c2e164a5084mr28126066b.34.1790709355254; Tue, 29 Sep 2026
 12:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927154101.122633-1-voytikd@gmail.com> <art6lF6jcHBNHCi3@levanger>
In-Reply-To: <art6lF6jcHBNHCi3@levanger>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Tue, 29 Sep 2026 21:15:28 +0200
X-Gm-Features: AclHuK8VindsUJVuOx3tG9I4lHPb0qjYshyVqVxUDEBQ5F3je96HCCV6NbeCaHg
Message-ID: <CAAX90H1Ma5TkiSSg0CB-Tb__G++h-_P=+kiJbaQ4DtS0c+kVRw@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/config: honor $KBUILD_OUTPUT by default
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Dmitry Voytik <voytikd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thank you for taking your time and reviewing the patch.

On Tue, Sep 29, 2026 at 2:05=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> On Sun, Sep 27, 2026 at 05:41:01PM +0200, Dmitry Voytik wrote:
> > If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> >
> > Fix the issue when the script silently updates a stale .config in
> > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > to be updated.
> > The problem can be worked around with --file, but this is easy to miss,
> > and is inconsistent with how the Makefile and other tools work
> > (e.g., scripts/diffconfig).
> >
> > How to reproduce the issue:
> >       rm .config
> >       export KBUILD_OUTPUT=3D.out
> >       make defconfig
> >       ./scripts/config \
> >              -e CONFIG_UBSAN
> >       grep: .config: No such file or directory
> >
> > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > ---
> > v3:
> >  - Added an example in the commit message how to reproduce the issue
> > v2:
> >  - Addressed comments by sashiko:
> >    - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gm=
ail.com
> >    - use basename when --refresh is used
> >    - remove echo which can be misleading when --file is passed
> > v1:
> >  - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com=
/
> > ---
> >  scripts/config | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/config b/scripts/config
> > index 32428ea909c2..cdee67157fe1 100755
> > --- a/scripts/config
> > +++ b/scripts/config
> > @@ -130,6 +130,10 @@ on_exit() {
> >  trap on_exit EXIT
> >
> >  FN=3D.config
> > +if [ -n "${KBUILD_OUTPUT}" ]; then
> > +     FN=3D${KBUILD_OUTPUT}/${FN}
> > +fi
> > +
> >  CMDS=3D()
> >  while [[ $# -gt 0 ]]; do
> >       if [ "$1" =3D "--file" ]; then
> > @@ -229,7 +233,7 @@ while [ "$1" !=3D "" ] ; do
> >               ;;
> >
> >       --refresh)
> > -             yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> > +             yes "" | make oldconfig KCONFIG_CONFIG=3D$(basename $FN)
>
> Thanks for attempting to fix the '--refresh' option.  But this way,
> this may lead to very unexpected behaviour, as it regardlessly modifies
> the path to the config file, even if it was specified via --file.
>
> If --file is given, it should take precedence over any KBUILD_OUTPUT
> (or KCONFIG_CONFIG) from the environment and not be changed unrequested.

Thanks. I misunderstood what KBUILD_OUTPUT really means. For some reason,
I thought it should be a filename and not a full path. The
documentation entry is a bit vague on it.

> It would be a tiny bit nicer to just strip the KBUILD_OUTPUT path from
> FN, e.g. (untested):
>
>                 yes "" | make oldconfig KCONFIG_CONFIG=3D"${FN#${KBUILD_O=
UTPUT}/}"
>
> But I am still not feeling happy with that.

Thanks for the suggestion! So, what I did - I just completely dropped
the second change hunk, i.e. kept it as is:
      yes "" | make oldconfig KCONFIG_CONFIG=3D$FN

I tested the following three scenarios and it looks like it works as expect=
ed:

make mrproper
export KBUILD_OUTPUT=3D.out
make defconfig
grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config

# test basic use case:
./scripts/config \
       -e CONFIG_UBSAN
grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
./scripts/config -d CONFIG_UBSAN

# test --refresh picks up correct config file by using $KBUILD_OUTPUT
./scripts/config --refresh \
       -e CONFIG_UBSAN
grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
./scripts/config -d CONFIG_UBSAN

# test --file takes precedence over $KBUILD_OUTPUT
cp .out/.config .my_config
grep "CONFIG_UBSAN=3Dy" .my_config
./scripts/config --file $(pwd)/.my_config --refresh \
       -e CONFIG_UBSAN
grep "CONFIG_UBSAN=3Dy" .my_config

If you are fine with the above, I can send v4 with adding the above
testing steps into the commit message.
Thanks!

> --
> Nicolas

--=20
Best Regards,
Dmitry Voytik.
