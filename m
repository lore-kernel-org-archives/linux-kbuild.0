Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA302DF128
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Oct 2026 21:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890862; cv=pass; b=ZfR4mWcuDDQtTFUTZz7tLM0UeK+xC9uDVai+X2OnD56spd/5VmOe60IagLnvx8TWHFMnNagdCHIGhM7V7RfhxZWAXieDSXCkI1I6WI6Y+CTuEbuGMqOVWPs/pElPKvc9csaS+UQ4lpG5z55BWYFiujd8jxcyaZpCvOAnAxYmVVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890862; c=relaxed/simple;
	bh=mJd4W21ehe2gG1oPa82O4mkajM6Oekem7ACig6EyrCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RPJL5VBjqzNz8IU6ExJjECFU0jGWhgIvRgBjsuAd/ctuREkGr6rbKfPrvEAEJDIs0Yuym/va4rBhiEpbHeWkgwccVYQAK7WGMahMjO0HZtGHFZUnI8SNRE0FSmmn+b3UgMEDROm4XircG6lGDVNB1eE9EdLsSdnEclJ7KieVatE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIRilmpZ; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIRilmpZ"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so1087976766b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Oct 2026 14:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790890859; cv=none;
        d=google.com; s=arc-20260327;
        b=ZQ1J/7CZUQ2vdP5Jom4KjAAyIIV/woYP7er4PREVLP+DZGqPKIrlan2w0uRJq5agrQ
         fjU+02i4Jz0UVuysBHawzlOj2ihHxOSpuSY2bw6jujNcVU/fwGX95Ynbp9wonop/OMAt
         WV96k2fxghKvC1VizvTD2/KRbGET8Jp0rZM2XFEz44M7eOYsl9MfYXQPV++XHs8lusqF
         KpHpHgQZ/Vcd9vVBHfowBYOdg+8kM2rswGkRwDCnUBsiGuY/ZTINYVWt8vxM8RR9Cg5/
         JqboG8VkR2qaqH0KVQS/qwU1taazukwE7mcSNaynCgcQoT/aw/uVsSdIbyP69fOKD2+v
         AKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y5VVpxkCw2qSWatTTLuSmXtriX32bvao8AVsrJEur4A=;
        fh=omC/A3Zs8MVg6WFLkCn0Tu9fip8lgwjS2tmizfPhXE8=;
        b=nX75I/1vJdb1R02QakZMSwCXxy4MnXuVphVnPrN0uhRrtoTu2xUnea0Jf9B8bpXVVm
         c3hu59rgaqHKHZ/KCJdrDx33llzVm77Ht7lfmskwwDwyDWUqGmQ+sKkaneHogn2wfF5C
         cyOledvhoBLSEgGJDQFCbtJru8TbvXlWHuZMV/RRFHwavMadOdZYqtglCP5yAGeOadKL
         zBNqxH9oqZU099wQD2Pl52RjddfscApsDT7BzdsAE3iT/yVGIlUJBUUqkCQj2htkKq5l
         EDLDOEj+qVuKnKIFK9BuT+DdmSU6duxUIWcdUFtqrJsszAG+M6GUJ1qSHhKzgHDMOw9U
         +sPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790890859; x=1791495659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5VVpxkCw2qSWatTTLuSmXtriX32bvao8AVsrJEur4A=;
        b=eIRilmpZ1+1pJDgueE2ih52EynjguhuzFhTOWyEYeWQKV8VgglCclZSipRosZp8kBg
         3mVXv91RWMEgGn07d4cSCqQK6F+JKWbFeAzfVrZZHKt3Dq/XQ4JHRALtizpNUsP3wqFD
         qcydXo0Z1Mo2nDEwZX/WYRBvsnLLlGxqrx2KZxdREOmbcdNns4EBpzqq1VmrQ3aKCUMW
         aBb1w+vYuFd777wlbivLrxRRkZ8sDCMmV6R11Skv6zghgDxnEcBmURCahgHwyhdWxsrj
         f+wobHTbSY2ZHpHd42YkL2Pr7i7pZzxyaVPwfC4E6DwCQZUnsx6YI+7I/+z3uJD26Et9
         F0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890859; x=1791495659;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5VVpxkCw2qSWatTTLuSmXtriX32bvao8AVsrJEur4A=;
        b=UHgICIIIZ2uRYeXGEG+YMcWWx3q/sFS8eGdeRr810NfQLU1W6H8DajpDCHhXgVh8hu
         GcqmV3nv7z7i5bA9es/phyXSDsdIZ/ENdUnCXkEA2L+02Ol6df5L0NdZgW3Q6QWdiVau
         FjOtrb8lRmx6vZ1VqqErCpqbib9gthEyVFvihODAPh4v4SBsyPu1Khx21QA0uCsip6rv
         Az89W/xrARNnS0dtqbhOsj8nFWMRCOeQ7iJSyYpvovCl1keMPz4+d4ZrApUYdG5/LDM2
         SmCOTQaAdU24OceT4jC4X+7qKEkzF9wOxkhDQ0LAOpKgLqZD2iJCM4ESR+vNcwmf5lpa
         DfBA==
X-Forwarded-Encrypted: i=1; AKwUvBwEYu8sZEcpWQgF4Thry4JvgEYurETrbW/V9KVcKPX4G+VJ1KMNZXZmzoAPYSxHi5wbk3j2LW0fBWMFMXM=@vger.kernel.org
X-Gm-Message-State: AFuF++m1clv1D1Y8Yny0LBU5BUpXwoA6VVJqG45PNeOwFAMdyCLjRQJn
	Hz2IZSoG4VWja2hcDiyNyELWhmWIYS7Ox2UIFEA39ZOUn+WOIbKGWn9App63EYfseFdpw9XKhdc
	vwvOfrRg7OCR4NAmvdx/TmCvFXI3UQJQ=
X-Gm-Gg: AYBFou3cs5Chx9mkjmuD84mN9GVhPv5etWAyPwGBBcSW8Uc/mV1g0prNtQwsfeS+cTS
	cS/0ScnAitcULZAc5AOeQqkw/0x6GV5ond0oRhxeHBbl01/lPqxliZkN1QoZJkuRoGF/jesLL05
	QXuXMe4CEJlYW300o03qLeDBGME4Wd9zbTXhQjNEZFkxyTcOONys0T1KMPDl52RwGDsRSgZi1+2
	IkBIN8eHBlvqPfNA5Tom1TB8gQuVsdjfSIQ71pt3G5jN4R2iBRki9AYSMRhfOVUFQJS9FucZ6Qj
	wDlVb3sVwIf0IwRJCOE4vqamBCm1xLZWK5HaOD3h4BbCLbIclO4F3PjCnNpyUFtrUsOepXv7396
	z24y2mcpSGsSKvo4OtZbcMkucPXqAPgLqOGdV
X-Received: by 2002:a17:907:3f18:b0:c2a:c793:bdfd with SMTP id
 a640c23a62f3a-c2e4af48856mr71023666b.21.1790890858948; Thu, 01 Oct 2026
 14:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927154101.122633-1-voytikd@gmail.com> <art6lF6jcHBNHCi3@levanger>
 <CAAX90H1Ma5TkiSSg0CB-Tb__G++h-_P=+kiJbaQ4DtS0c+kVRw@mail.gmail.com> <ar525jXEMt3ZecH_@levanger>
In-Reply-To: <ar525jXEMt3ZecH_@levanger>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Thu, 1 Oct 2026 23:40:32 +0200
X-Gm-Features: AclHuK-nO2DGm-gU5DRm9Y2ksUCS848YqU3yXcNvK5QLTtIvmU5910yu4CGwmdo
Message-ID: <CAAX90H0PEoaKWrtNBHuN=M-cgqbP0BX2xd7_vc1+3S30xa-fLw@mail.gmail.com>
Subject: Re: [PATCH v3] scripts/config: honor $KBUILD_OUTPUT by default
To: Dmitry Voytik <voytikd@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for the review!

On Thu, Oct 1, 2026 at 5:06=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> On Tue, Sep 29, 2026 at 09:15:28PM +0200, Dmitry Voytik wrote:
> > Hi Nicolas,
> >
> > Thank you for taking your time and reviewing the patch.
> >
> > On Tue, Sep 29, 2026 at 2:05=E2=80=AFPM Nicolas Schier <nsc@kernel.org>=
 wrote:
> > >
> > > On Sun, Sep 27, 2026 at 05:41:01PM +0200, Dmitry Voytik wrote:
> > > > If $KBUILD_OUTPUT is set, use it by default if --file is not passed=
.
> > > >
> > > > Fix the issue when the script silently updates a stale .config in
> > > > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > > > to be updated.
> > > > The problem can be worked around with --file, but this is easy to m=
iss,
> > > > and is inconsistent with how the Makefile and other tools work
> > > > (e.g., scripts/diffconfig).
> > > >
> > > > How to reproduce the issue:
> > > >       rm .config
> > > >       export KBUILD_OUTPUT=3D.out
> > > >       make defconfig
> > > >       ./scripts/config \
> > > >              -e CONFIG_UBSAN
> > > >       grep: .config: No such file or directory
> > > >
> > > > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > > > ---
> > > > v3:
> > > >  - Added an example in the commit message how to reproduce the issu=
e
> > > > v2:
> > > >  - Addressed comments by sashiko:
> > > >    - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%=
40gmail.com
> > > >    - use basename when --refresh is used
> > > >    - remove echo which can be misleading when --file is passed
> > > > v1:
> > > >  - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail=
.com/
> > > > ---
> > > >  scripts/config | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/scripts/config b/scripts/config
> > > > index 32428ea909c2..cdee67157fe1 100755
> > > > --- a/scripts/config
> > > > +++ b/scripts/config
> > > > @@ -130,6 +130,10 @@ on_exit() {
> > > >  trap on_exit EXIT
> > > >
> > > >  FN=3D.config
> > > > +if [ -n "${KBUILD_OUTPUT}" ]; then
> > > > +     FN=3D${KBUILD_OUTPUT}/${FN}
> > > > +fi
> > > > +
> > > >  CMDS=3D()
> > > >  while [[ $# -gt 0 ]]; do
> > > >       if [ "$1" =3D "--file" ]; then
> > > > @@ -229,7 +233,7 @@ while [ "$1" !=3D "" ] ; do
> > > >               ;;
> > > >
> > > >       --refresh)
> > > > -             yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> > > > +             yes "" | make oldconfig KCONFIG_CONFIG=3D$(basename $=
FN)
> > >
> > > Thanks for attempting to fix the '--refresh' option.  But this way,
> > > this may lead to very unexpected behaviour, as it regardlessly modifi=
es
> > > the path to the config file, even if it was specified via --file.
> > >
> > > If --file is given, it should take precedence over any KBUILD_OUTPUT
> > > (or KCONFIG_CONFIG) from the environment and not be changed unrequest=
ed.
> >
> > Thanks. I misunderstood what KBUILD_OUTPUT really means. For some reaso=
n,
> > I thought it should be a filename and not a full path. The
> > documentation entry is a bit vague on it.
> >
> > > It would be a tiny bit nicer to just strip the KBUILD_OUTPUT path fro=
m
> > > FN, e.g. (untested):
> > >
> > >                 yes "" | make oldconfig KCONFIG_CONFIG=3D"${FN#${KBUI=
LD_OUTPUT}/}"
> > >
> > > But I am still not feeling happy with that.
> >
> > Thanks for the suggestion! So, what I did - I just completely dropped
> > the second change hunk, i.e. kept it as is:
> >       yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> >
> > I tested the following three scenarios and it looks like it works as ex=
pected:
> >
> > make mrproper
> > export KBUILD_OUTPUT=3D.out
> > make defconfig
> > grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
> >
> > # test basic use case:
> > ./scripts/config \
> >        -e CONFIG_UBSAN
> > grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
> > ./scripts/config -d CONFIG_UBSAN
> >
> > # test --refresh picks up correct config file by using $KBUILD_OUTPUT
> > ./scripts/config --refresh \
> >        -e CONFIG_UBSAN
> > grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config
> > ./scripts/config -d CONFIG_UBSAN
> >
> > # test --file takes precedence over $KBUILD_OUTPUT
> > cp .out/.config .my_config
> > grep "CONFIG_UBSAN=3Dy" .my_config
> > ./scripts/config --file $(pwd)/.my_config --refresh \
> >        -e CONFIG_UBSAN
> > grep "CONFIG_UBSAN=3Dy" .my_config
>
> This one shows one of the problems with scripts/config: while the script
> itself handles relative paths to --file FILE from the current working
> directory, a call of Kbuild changes the working directory to
> $(KBUILD_OUTOUT) and realtive paths in KCONFIG_CONFIG are resolved from
> there.

Indeed, with the patch, if I pass a relative path,
it creates the config file in an unexpected place:

       make mrproper
       export KBUILD_OUTPUT=3D.out
       make defconfig
       mkdir .out2
       cp .out/.config .out2/.my_config
       ./scripts/config --file .out2/.my_config \
              --refresh \
              -e CONFIG_UBSAN
       ls .out/.out2/.my_config

Also, apparently, the following test case with --refresh misbehaves:
       ./scripts/config --refresh \
              -e CONFIG_UBSAN
It creates .out/.out/.config :)

I decided to always enforce converting $FN to the absolute path:

       diff --git a/scripts/config b/scripts/config
       index 4e29c3084fec..0b28fc498195 100755
       --- a/scripts/config
       +++ b/scripts/config
       @@ -147,6 +147,7 @@ while [[ $# -gt 0 ]]; do
       shift
       fi
       done
       +FN=3D$(realpath "$FN")

       set -- "${CMDS[@]}"
       if [ "$1" =3D "" ] ; then

With this change, all tests pass, no side effects as it seems.

> I don't have a solution in mind, that fits it all.  But I think it's
> important to not make things worse (or more unexpected) than before, by
> accident.
>
> > If you are fine with the above, I can send v4 with adding the above
> > testing steps into the commit message.
>
> yeah, please send a v4 and then let's see what we'll do with it, ok?

I'll send a v4 patch.
Thanks for the review!

> Thanks and kind regards,
> Nicolas

Best Regards,
Dmitry Voytik.
