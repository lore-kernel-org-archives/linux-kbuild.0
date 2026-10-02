Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1520B3F1077
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Oct 2026 22:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978512; cv=pass; b=SZWnZb5blkwX2TCGpdbTC5uSnTBGO76kuLzUp9F2BkIIRlJSoBWT0TZlG5KDO6afNm5ZGSPBoc3mdeW4PJjXqf4jhSg2p29jSlQYnQOrIEh81t/+bHvEmPSR2/dZzVacCovZxKHQKc7+8TKZSeBuJis0Zylqkv1xWAlRsbPwKDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978512; c=relaxed/simple;
	bh=bYUnQNVoZT74HkMEplvStg9Znck+l3ddzA9A14qbmdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9YwiNz1ubCoTIcL2rnCzt/1zaHxB6+kbZXna2dG/Rc49dm6dbBY7q4qiZkvDPq3OHP+5B/iKuwW6jkxretZm/oW6x25vHvQThN/BjLJM3wRgroBh7ce6ITuvXzrvroAA7F5/JdtZqRqf5IJ7WOSzPfCiIVOSqKOmi7iAd64cwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrQJzspy; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrQJzspy"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so54292466b.2
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2026 15:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790978509; cv=none;
        d=google.com; s=arc-20260327;
        b=cI/xMdTghYVu/FZMFRKATIJvR1POBCAEtqgt0nXrVuk/iGESQMK04iBL8NcgDDfZCm
         v1dcUqKvKcahIiC1lOFJd91Bv2onD0o/Twaw68jCkz9Xlq432xb+ixo0XtzM0IXwEBnH
         xXUlb1ManLzuqX+WW9HkCW3onSk8j7ydT63IcRWzV3HIebmUnyPJ9f7SXY3asaIhUek3
         px6APEKilCGoLZ1aEYpdJ13K61X2WzH5tIhq5Lswb0SUVkhJSIiP3qWQvuuk88X8OBKe
         nSU0iJN6feCIQ/6myTqeZs+XpF+iZT/FqBeiJxV3mael8OKRNaOsJWqCdkawVZUrhARL
         cuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YmhklB8KISFEh7LPCSj61sCuwipkxzM488oBjgYMua8=;
        fh=EClSwOv55HZPh5WovP9jCU/CF9uVYBgxUEjfa6GdOOg=;
        b=LswGAH5Al+XpSvkRa0Jh4qXyzloCldg8HlhmUiecpvfQwiq17yMYc5/kQxjEQHnBV4
         j68QJwrpAM6kF1fzmsfo0+mxXxPOKluNE8W7I/rvd+OdrIzWyI7VZFofqae2+6+ayscg
         bZoogKq6N0c+ekD6OHz3Z9tzVwOKEVUlbswYs74u/2wGFtinZGwXXOHETjel3uZQKffi
         t7Wg62jYFoO5bgoMRzDMMOQyLiW/mGAJ44C+//oLl8MYbMpk+LCWfgzvvlXUGZkr92N5
         fAWnR4WF84W3RW+/Vl4y/K0Ue95Z9XzNLF33NIPQx4K8oZEjQVCR3eraLKlxj+61Te6i
         7CYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790978509; x=1791583309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YmhklB8KISFEh7LPCSj61sCuwipkxzM488oBjgYMua8=;
        b=mrQJzspyBDSUVXOIGs4bHh2WyB8vq0iFUXh0tnIBUY/vFVoPIfOMmynzUN9bKwkUNv
         XOrpn6DWTjVYNQ6Xyv1L4wZwOyPdWc7xaqQ554ZNpd8B1o8Am3qFmAFwuW775MbI3rlZ
         fx+i2XnvLxnx0u2qR/J6STOgOTmClrgstMnM36HD4b2bGaOBCYV6ho5IQVQLeCDPx2fo
         PgDZJeJoyogByxi0U+GNIBM/+xFeT+SXKwmu6l++QvFH42YAAESvZ3BF86f73QmrirGc
         Tr7L+TNIxXvrtuMpQUELt9XgSKEN8ocrpN6dfnJaknpmkLPrEGHA0O23V6FtsU1lxOQH
         v5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978509; x=1791583309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmhklB8KISFEh7LPCSj61sCuwipkxzM488oBjgYMua8=;
        b=xO0A5zjaTwES9+Typvkkd7s7WcSHLUw7++TptHte/+UUdJCeG9UglCT8nd4Koe6ST5
         niYTGFPQzun5IBrBX1WEMEb7w6mFThmZPiTqOjE/six7kRLBo4KyW0LRZ7VmxLGACxcS
         UllV3FVTniH3gZoE9jLFxhtL3rMK1qMm4fvsXBAFNfutXj66Qclk/upFL5SDPxKXWzMm
         xnGgdZ1sQkmOOZYq8YGfz3dL0CZw9DDoQUId1lpPGRtoK9wZhZphlOjaXvglYrt/uQRg
         DywjzMeR4p7aOL+dXI/OZ56vUiJewoHdF4Skel0CU8ECtUbH3DKojE31EO0IF1wTaOOK
         WJRg==
X-Forwarded-Encrypted: i=1; AKwUvBzpuR5/LSX6b/uOFOrhmjZF+3NSBV5QhK0qOBcQiDgIK07UPi8a/44g/Bbfh6AEfEPZ+zuDZt0lZHgbDr4=@vger.kernel.org
X-Gm-Message-State: AFuF++lKwDTBwratjgrzpz6/0LdEEar09d3cBju/OjQXyVvJht3Krk/N
	o25CBQsrmKX0XSTXof5s61MrkE7O9OtoVb7AvpjXD2lyFQ4DeSCEgCAbdIOlk1QScZfJLb187F1
	mCUO7iGq/7k9nmUkVe8gvHrTsDksdNYc=
X-Gm-Gg: AYBFou1yKEmLAbQOTyero9dGgHXO4h+D62HeYFjWepyx/sycyZBuVo06MqsAKOe2RSo
	T5+sTFHYGArqjW77g4CxWnvw4Xhk32cSaJ84BTMJ3nz30CnWYujFh1pqND6traY0D3rkX9DHSw9
	afeGR9C4cniLAdsQZ/kQZIQ2fJ9OtDdxkqz3sP7IXH5J0zBjptF/hCAioH2WvLBKpsam4x9gvby
	w0FEUb5Auz2oREwUm+IN5QSTv8VxSLbxd/YJBUWqnoU75cqdxdXZfElivP5q950ZtU2JnT9d+1S
	TfWZ6hTn7xmfAM8iCBX3WLNJoxoHlORk8t8zkWrFXVqI1JVgo5EyJ8w0i2Z6qnvDCyOwlPNOlX5
	pZBnE7yvto9EN5D6h80LSslOA32FUAISCt4bySKes4fERKS/81JGeHdx+rciX5dGlzbuM0g==
X-Received: by 2002:a17:907:94cd:b0:c29:f5d8:9c7c with SMTP id
 a640c23a62f3a-c2e4af89b5cmr340576266b.43.1790978509156; Fri, 02 Oct 2026
 15:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001214618.283635-1-voytikd@gmail.com> <179097210878.309835.10523307262544578337.b4-review@b4>
In-Reply-To: <179097210878.309835.10523307262544578337.b4-review@b4>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Sat, 3 Oct 2026 00:01:22 +0200
X-Gm-Features: AclHuK9Ast4lVnU0ZQbxkOGMKrl8yU_T_0si3PVA45mLNds5iM4UieKb5yD5CfY
Message-ID: <CAAX90H0W-2j2zK2smw7KuJQzOUMj6yRbSVDbeTHyiLU=nV1+hg@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/config: honor $KBUILD_OUTPUT by default
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nicolas Schier <n.schier@fritz.com>, Rong Zhang <i@rong.moe>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Thanks for taking time for the review and suggestions!

On Fri, Oct 2, 2026 at 10:15=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Dmitry,
>
> > If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> >
> > Fix the issue when the script silently updates a stale .config in
> > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > to be updated.
> > Handle properly if the config file is a relative path.
> >
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
> > How the patch was tested:
> >       make mrproper
> >       export KBUILD_OUTPUT=3D.out
> >       make defconfig
> >       grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config || echo "OK"
> >
> > Test the basic usage:
> >       ./scripts/config -e CONFIG_UBSAN
> >       grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config && echo "OK"
> >
> > Test --refresh picks up correct config file by using $KBUILD_OUTPUT
> >       ./scripts/config -d CONFIG_UBSAN
> >       ./scripts/config --refresh -e CONFIG_UBSAN
> >       grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config && echo "OK"
> >
> > Test --file takes precedence over $KBUILD_OUTPUT and
> > a relative path is handled properly
> >       ./scripts/config -d CONFIG_UBSAN
> >       mkdir .out2
> >       cp .out/.config .out2/.my_config
> >       grep "CONFIG_UBSAN=3Dy" .out2/.my_config
> >       ./scripts/config --file .out2/.my_config --refresh \
> >              -e CONFIG_UBSAN
> >       grep "CONFIG_UBSAN=3Dy" .out2/.my_config && echo "OK"
> >       ls .out/.out2 || echo "OK"
> >       ls .out/.out || echo "OK"
> >
> > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > ---
> > v4:
> >  - Addressed Nicolas Schier's comments - dropped the change how '--refr=
esh'
> >    is handled
> >  - Implemented conversion of $FN to the absolute path which helps with
> >    '--refresh' and relative paths
> >  - Documented testing steps in the commit message
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
> >  scripts/config | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/scripts/config b/scripts/config
> > index 32428ea909c2..0b28fc498195 100755
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
> > @@ -143,6 +147,7 @@ while [[ $# -gt 0 ]]; do
> >               shift
> >       fi
> >  done
> > +FN=3D$(realpath "$FN")
>
> Sashiko has a couple of comments here:
>
>   https://sashiko.dev/#/patchset/20261001214618.283635-1-voytikd%40gmail.=
com
>
> The second comment around KBUILD_OUTPUT / '--file' beginning with '-' is
> a fairly contrived example but sticking '--' in there does not seem like
> an unreasonable hardening move.

That's an interesting finding.
I tested the patch with a hyphen in the filename, and it indeed wreaks havo=
c.
Thanks for the pointer!

> As for the first comment, I am not sure I want to rely on 'realpath -m'
> since that is a coreutils-ism and up until now, this could work on any
> operating system (as least as far as I can tell). Maybe we could do
> something like
>
>   FN=3D$(realpath -q -- "$FN" || echo "$FN")

Sure, let me reuse your suggestion in the next patch (v5).
Thanks!

> to just try and hobble along if we cannot resolve $FN properly but maybe
> there is a better solution that I am just not seeing at the moment.
>
> --
> Cheers,
> Nathan

Best Regards,
Dmitry Voytik.
