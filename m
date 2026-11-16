Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870459;
	b=NY05mv5SYYz+p2EoXYspG/q5Jw/jy2DdNCLXAxcVKDrWYiILeRnWZTBPZsp4FbKqeAjV
	 HlP83Zi93WX3SeYXiCd+Rvc04jnqakqdpu1KiJD8hYHbW8dV37PqVKfexTgbxip27QB8V
	 88lZMB5Oh/MB+73Xy2wf46EWXaEdg2WZlLCxiY+t8kiOxwBZ/c6hsYgMl3rs7d08L28uV
	 8+OeV0+N55M4Q17rsM1ia+81IbSPvA7YNh7FUIm5j3abD5cb6YLAgCcgoAcQMTjGfBG29
	 L489QDzp3tzZ2ZeY4fnbFsrEHK28njBW7h3QWk4FmB2HywZ4jgJMuRD+a+wVZtGIuhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=ydCDBPssTz3ncKEW3MVclnuDfOEc/UHcPxQp8+aHet0=;
	b=hHCLgiqKbXckjDz4OHW8XbqNecqqDl5i00Qs+PP5eP88M1iC7O3yoGbsJT4f8YJOnE24
	 wMSeHPUSfiQUQZ1gdmbEF560myNUeegbkh/SkU8C/BfzDElkUxTyDRDiv9Wavcr3Fm9j5
	 bxdvw/FNOsPr2S3Y6mEWC0gbgDR6G56Xi6lQZcqgKVDnmCgCu/+MrqktS7OHUWIVEqsBa
	 x3x+2ft47Mpn9J5X/3WikJY8BJHwTlds5gf9oB2vhcvS6XXzy3QEhwNTmSSMStPFVnNaO
	 Ww1RAKmv1N7CdYiOO+kMcjF0LPgvPrmP9XdZO5i1SUDP9oehPUcboWJTjgh8q94ZK1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXUgnO3L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4A2606A8A7
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 23:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4A2606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXUgnO3L
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d30639709so564836566b.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Nov 2026 15:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794870457; cv=none;
        d=google.com; s=arc-20260327;
        b=rI02HGCbBERlVKY5RRbtwxEAStMvb7GWioST0qNi1eKwX3UqEsX/rrN1onad+rnzT/
         JYhY94hZmIpdCm7vUcbkdeCITxnPlubgrqkI6TBcnxMN6Ejy0KNdhk914OJ/vuz5ht8f
         MRg2i5NvkM6ZEPaOIih9PmkjcIt/FDkU6rPNWj09B2rrjmaUwaYgAruTDPj6CufLK3Q3
         sCGRf0XTQxAgGLwzPxBfFyHg4DyeTZU/SaN+hHYxDGss9jwm7ncZSqUZaYHv6as7ONcu
         tepZ8vvyicEnV4bCpXJck7o/z5AMNLBs8ZI5A/lKg8fKKUTpklaTQm+w36Xk0TQZTaB3
         qNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ydCDBPssTz3ncKEW3MVclnuDfOEc/UHcPxQp8+aHet0=;
        fh=7hlBydLx8x72ECj0szDlkOqrI9PsJoxGGc4VQ8QMJyA=;
        b=U9oFguZgzycpqXEeZ99NWqwKppqzztedEVibxxQe45SXZ9KLwGFrb5tFRcV/cZiysq
         y0/kk8cXxLwqQY67oTiyNYTA4PUvfGZTG3vhUoH0RVV2F2s51WwrfSmFlU/yIw5lbphi
         2uqXoWY6LEgmPS4FZjL3RS4VDG4HiusRHLxCiok8ZlBc3Xj3x1gPt+4j5Efy/dH5alCk
         hVRBLTv0hddKyisF12GYIephqGIF7EYevwbFo0VDYsd9ikq8jbt64nCzULlI+yzqqFK2
         ZItkM++EiLx72V5aYtMqwszkD1n+EwruQra6xaZUo/NcpuLOzubs/svuV1x9048mxWhf
         K5nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870457; x=1795475257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydCDBPssTz3ncKEW3MVclnuDfOEc/UHcPxQp8+aHet0=;
        b=GXUgnO3L2sX8jIe+JNGQHMfQH4z2uwWV5JtvWCT2CP6vZsmGvh7V8LHDnLv5us4vZv
         PEXDM5ZhMNcx+fZgl8/G2Sppg6qPE0xzgWMuUxkpGID1la1F4r0X0cHFgtpcMTicfc4B
         ti54w8E5pr+fj6IIovREg8N7kBD21RQHst8BZrAfYsIa83lW+8ck1ic7YnUrjnblVK1k
         5A6MZ/6kYf+G4RDusB0KsfmrXB5HORmm616WjSWNCp65k1n++j4+QVXBIA5sG3a25AY8
         WbJkyRX2cfW0bMKbGu2YUnRGdqviWBxMJ+tTbtBuJisaefMtwVulUH63CJyb+vUZCMeo
         FZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870457; x=1795475257;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydCDBPssTz3ncKEW3MVclnuDfOEc/UHcPxQp8+aHet0=;
        b=mxeHkUR435JAJDs0GWu+yrFK5UtrkIArzY8ggarkA5J/z/uYmtSfQi8x4gE35y3CcE
         8DlKc1RlKesqvlO+Rc6GK6sXkFLErlkMVe1C4r2qP6NctFNjqbZIS/Q/LdSjTC6jFM5j
         xnK0jb0D/H2pCCQkKNAi2pCBp6IuCNwR3bamnZGX1W3bTT0AMEtpWjyzpMkrIh3Vh2zs
         X2Y3avVr1ftzKlDPE397sfSmKEo2PTPHUkBn2gCjh9F34CNSTmj3iUI1kqmuJXMFtajs
         YzGXQM1b7gFmDVBYVyb7BnRJl3ugipxH+FUGwfIqARyLi7p8o4RvIma84KImrTj5xh++
         WaOg==
X-Forwarded-Encrypted: i=1; AL+hErFi87q7QiiEQnzH31eBY4fBvzj9xntL2/+SnVC+KeARALxI6SiqYpW1jeEBZssBw6OgOm8/ibXwmeQsjoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LDuGl/usYafDkhWuL0UsLBAiWw5x8VRWCbMJQmyYFasg4yDsG
	HDWh5hkUorXLKI2xUPsd8g+vM/Zcrd67edhaKAGZq1do0EfZf3RgNSeEB+PeYpDdk/cEs5VczZG
	OWds4jGOAKPL+RkAHfIdmg6KhViRdcKq73g==
X-Gm-Gg: AYBFou3j1OYOmF64cubVTtguk1d/7y6amrSniS57jXe9M9Qco2qKNhJ3DD2MXdp2X+S
	S3is4vdXQAca7GF6ZSIadSxy3bsioL2B3qo6tz9l/W7GYIoxrYnigNFIE4Uwc+vlQkny7XHKph0
	U6caS9+YXKFereh1O7QvtZW96Qx2tmTmWELCjRKHS/E4GwDXIa0ef8Q5TJjswtUIN3iO4PYuZXE
	hqMlgA6gdijDKRR6hLTTSDqZoBaqm7BBnDPnIfDor/Qaset0r0HtJKst3YjuhpndxFEuEHm8xRP
	jOpQLDXEfzdyL5zJ7Gsbk+ilCKYGJn0z6UvtV6H4EbWjs2SwmNsyD5bH4gdXt8lxIGApcIazTuf
	Q8CTraqNwJGgeU+VRLfuLgafbk11eE25o9WasKPgKXlmhqEgHEMQFjnv3a9x8+7rhOd2Qtfdn6S
	3xREF7FOk+QK1eBiSXKWwMaeAkRymLvbdyJB/OfjmDS6vHAleL
X-Received: by 2002:a17:907:6e87:b0:c49:cf3a:a324 with SMTP id
 a640c23a62f3a-c5096409dbcmr975144266b.22.1794870456872; Mon, 16 Nov 2026
 15:07:36 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006161155.862736-1-voytikd@gmail.com> <179454594618.814257.8646757102444143940.b4-reply@b4>
 <aviuyR8CO027Ch5R@levanger>
In-Reply-To: <aviuyR8CO027Ch5R@levanger>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Tue, 17 Nov 2026 00:07:10 +0100
X-Gm-Features: AclHuK-E8ZWp4c2bm5JSmaB0I-NH5LuZseQXBYxydSLLee4ppPsCK12Q3gVM4Ug
Message-ID: <CAAX90H2ajNcAtKREMY5YWf-CtS=WQ-A7K1SpQNJBXN757Qc8Pg@mail.gmail.com>
Subject: Re: [PATCH v7] scripts/config: honor $KBUILD_OUTPUT by default
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Dmitry Voytik <voytikd@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan and Nicolas,

On Sat, Nov 14, 2026 at 7:57=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> On Thu, Nov 12, 2026 at 09:59:06PM -0700, Nathan Chancellor wrote:
> > Hi Dmitry,
> >
> > On 2026-10-06 18:11 +0200, Dmitry Voytik wrote:
> > > If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> > >
> > > Fix the issue when the script silently updates a stale .config in
> > > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > > to be updated.
> > > Handle properly if the config file is a relative path.
> > >
> > > The problem can be worked around with --file, but this is easy to mis=
s,
> > > and is inconsistent with how the Makefile and other tools work
> > > (e.g., scripts/diffconfig).
> >
> > I was finally able to sit down and look at this a little bit more. I
> > think we can avoid the use of realpath altogether, which would avoid
> > most of what Sashiko is complaining about. I tested the following diff
> > with your examples and they appear to pass without any issues. Please
> > give it a shot.

I have tested and all tests passed.
Thanks for the patch!
I'll send a v8. Please feel free to change/add tags as necessary.
Thanks.

>
> Thanks, somehow the sashiko mail missed my inbox.
>
> realpath on Linux uses '-E' behaviour by default, which is what we want:
> check existence of all directory path components of the given path.
> Adding the POSIX '-E' option explicitly should solve the non-Linux
> issues.
>
> As a follow-up, I would like to add support for $KCONFIG_CONFIG as well.
>
> > I think we can drop most of the reproduction and
> > examples in the commit message. If you want to include them for others,
> > please put it below the '---' where you have the changelog, as I don't
> > think it needs to end up in git history.
>
> +1
>
> But still thanks for providing the test examples, it was and is indeed
> helpful for my follow-up tests.
>
> >
> > diff --git a/scripts/config b/scripts/config
> > index 32428ea909c2..497551538433 100755
> > --- a/scripts/config
> > +++ b/scripts/config
> > @@ -144,6 +144,22 @@ while [[ $# -gt 0 ]]; do
> >       fi
> >  done
> >
> > +# If no '--file' was specified, use KBUILD_OUTPUT as the base if it ex=
ists
> > +if [[ "$FN" =3D ".config" && -n "$KBUILD_OUTPUT" ]]; then
> > +     if [[ ! -d "$KBUILD_OUTPUT" ]]; then
> > +             echo "KBUILD_OUTPUT is set ('$KBUILD_OUTPUT') but does no=
t exist or is not a directory." >&2
> > +             echo "Create it before running $myname or use '--file' to=
 specify configuration file." >&2
> > +             exit 1
> > +     fi
> > +     FN=3D"$KBUILD_OUTPUT/$FN"
> > +fi
> > +# Turn FN into an absolute path if it is relative so that '--refresh' =
works on
> > +# the correct file. This does not use realpath, as $FN may not exist y=
et.
> > +case "$FN" in
> > +     /*) ;;
> > +     *) FN=3D"$PWD/$FN" ;;
> > +esac
> > +
> >  set -- "${CMDS[@]}"
> >  if [ "$1" =3D "" ] ; then
> >       usage
> > @@ -200,10 +216,10 @@ while [ "$1" !=3D "" ] ; do
> >               ;;
> >
> >       --state|-s)
> > -             if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
> > +             if grep -q "# ${CONFIG_}$ARG is not set" "$FN" ; then
> >                       echo n
> >               else
> > -                     V=3D"$(grep "^${CONFIG_}$ARG=3D" $FN)"
> > +                     V=3D"$(grep "^${CONFIG_}$ARG=3D" "$FN")"
> >                       if [ $? !=3D 0 ] ; then
> >                               echo undef
> >                       else
> > @@ -229,7 +245,7 @@ while [ "$1" !=3D "" ] ; do
> >               ;;
> >
> >       --refresh)
> > -             yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> > +             yes "" | make oldconfig KCONFIG_CONFIG=3D"$FN"
> >               ;;
> >
> >       *)
> >
> > --
> > Cheers,
> > Nathan
> >
>
> Looks good to me, thanks.
>
> Reviewed-by: Nicolas Schier <nsc@fjasle.eu>


Thank you both for your time!
