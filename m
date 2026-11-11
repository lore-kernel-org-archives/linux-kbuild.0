Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794423980;
	b=BoSk2LNVdSZQVTT+EIx9DElcyFYIHtOOZtAnJq8yRHkUY7IoJajgX1xMuXfH7v6A18Y3
	 2KoHtrJOS1MgONFLBwmgDz5j3XAX9sqeExzRTaiXQb6u1R1ksB+Zn+uns/HuVEcDpe3Bj
	 KGy3MRpfgqxwxf6YMO1bRzvD+Xq29oHeJZuc8O6UScwPe+nwC3a9xYBRrNkkyTZr/4HSo
	 pPa+9MKTE+UKsdZj8vgzOgC4NAc4YSxQIer82xrVmn4MXFP+v/Nl76FbYNgaQ+AJoqywI
	 7r6Aj37bedhsfFMZCbYlZsB2zImHVwM2JaJeSpDE8fkUHMFq+xlMHHwV25oXySNOU6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
	b=eoI80uNLUlB4yPIo59YyQUk9zX7aziF2ZdYi/dQ0vF9JSja6FWjT8raI3U8hi+STf82O
	 p0l1OWT2XutwLotCS2NpN/SPkDCJZX0eeznE7B7CfNVLbZgQF8p9U0NE0katcn0dY+/LP
	 ydcROfsCtrtcVv+4rx2jPpu4ezr+QVjhN2MJ+nq23BQ5LYbOaXUOg793t6Rpl/2OTR8Wz
	 /43TshMgJz2Jjz3+lVI8KMgZ2IlBG60mPRp4ulVc20of7sCCzJ4LXCelz7n8PP1fo+51i
	 B56kRP6JkOCb/ITev0FJVt7SL2nrqhVCKpLeUJWkszNvQ8AZJqZD9lqitoO3UemTiMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UCWt3Mwy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997AC606A31C
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 19:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UCWt3Mwy
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49134c8509fso2878720f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 11:06:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794423978; cv=none;
        d=google.com; s=arc-20260327;
        b=mK/pIz6k4qF+50BTZDTXoXRoAZMXYRN2GJbMvRB+eFYx0KXb79/KsHFzmut1A5xTwc
         FwiatV+vi+E/UDCj/4S2ozEMDqBFZNQA90bevbJLAju7c8vHFmXBBMPDmaY7iK7Rmu5k
         U0tmqlxzOePzdTNW28jLPdRQ2HoAYqw7LamXPvP2rqgSlXjqEMm6YDvhrPQeT5cRtopP
         gaO0ZmVZR9KHK4xE8DPCwSjDamhc5a2kcGVC0MK3uGHQdmO90J+ABOtefpQ1X2sppWKE
         qypyBvg96SCqM7HSIk7wdTJu+zhqokElQlRscBwfiQdE9g5jV0F3F0HX5dCSdUIMNXTc
         Dm/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        fh=zzZN3KuaiULopkBSx/bv/a6y0zv7HTG9mN8ln6L/pJ0=;
        b=AfOv3cZKmayvplLAl+DxUPLOA1kSh9kb/bxn6OEPW7x/bxFBTtMfZgI0LCmkHG6/iI
         H8ECLERxIHFSmxVsXo0YB5EyMkifXYgLftfq/gKSj4iI6DG97bPkhvTekFPAavUIgfkl
         jTya8NpGgQKXrTNh2PsVsIBo0l4aYKUmVM4zpC0fT8Onj7IjryQGSSD91iTBrZhVG/j2
         6CYlHfOfMC4exkg/aS2uH6gRP7B4ZtuR2GEZmv0mQ7HxSn9aAryiQ3S6Z7LL+rYSThDw
         4xOFirNLLuMbQ8XFujHeh3xYO9Gmm2zkzGqXiFY1zQKg4XLEFrD6X/uiv4NbpxPr/kbh
         oENQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794423978; x=1795028778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        b=UCWt3MwyTY99eeG4r6z5+Kv840sn/muCBFKLGztVYeCMFaVt1HGxXBlKdaHSsZVlFJ
         rKo0ggeus22A4YCBNIu/MRv37ngC6k1GFlbr5g87LtiBYHsXHac+mPEN8N5pWHmINSXF
         s1sWrZpQHVI07jPLCQQ23B5Tu52tHg9rOKTOLcCA52Vv3wSHFFRs5AM+d048bwHYjij7
         GtSFb7HrDkoYnUFi3T0llygTDl2+KCZshFiVuW07KKhW2N5bh164xAC2Z4YcnhgRgjbs
         6WvwDgd9yyunaDoEcXt1gRevd7ji07rmXg8pCTbDzyVK68AzF39JqEFW/LdAnP4lNEI3
         jezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423978; x=1795028778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        b=lvr11o/0zo0hlCpTixGXe8Kki+IKKZuf+WwDUSjSgTUqq69ExEyCp0bPYgDZ/1JOCn
         b8QLwlytAWC0nvDxoiGxftwXyrk3hhu5JOqgLTyRxdTrqzTgI2qaonWDS3p6/uIQVnKx
         /OcN+fgXMU0Hq2KNbnHNmWHXFBEZ6qfU1zKL9O78tn5PYAo+Tsdn4cDjH+wPfn00aT8N
         GfreQt/6NG+whZ4qKaLMKNOKxYgSKjuliQYDHJlScBrJV4gnMKVDIpZtg2TKjhTYjAeG
         n4CpZUZvLv1PoDuXS2k2c343m4C4aYydeUBA6yXUe3Z88iH1moqau21V9qY3wOEgbgQg
         R1lA==
X-Forwarded-Encrypted: i=1; AL+hErEVn2MNt7qI7kZccT6EfX4l0bpq9LyTmgHj5japxP0/3gk+yLWiOsIZAc5w3PloBn0OGiGg7zGEzF5TleU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HH7oXz33A1bVnQnw2LFObz1eBpOYDda4nm6DI2wDs/JeAIHbg
	v64gXk+amtJc5OT1+7UpPKxiesCJJCoe2BpXdFJyLiszBL2qJhIjMZx1CenpchHesxRP+M0dQln
	WUr8TYFCB70jJZUAMhKDL/jLijbOZ/kGoDy+UJHFq
X-Gm-Gg: AYBFou2C90qaOda6N46awbPdrnqgjOSHIrEQDZtMrMQBLfkQTuBK4SayZJgEKjSuC1u
	V3ti84NXRozDjglhQVRrzuMjmfLyMIKu1xW86mEF2tzozHIc8GJM+wTuNBjyaIlSxgYsetBzaUF
	AixPvoabll+AEnkpt7eHDveTbvcd3NIUHpqIlF5HsOnOgtGkSe76fGZI7NVgwJvaj/ODvkNmLD2
	ag1etC6wJ8lkBt1+HE/7xqtADnrNAUQB2NpZSL8RWHAPdDrLenYSsJ5tr8JpHPzct4CCw3v5ktZ
	a6hr98wofY4D3tL69lEHImx4eoMDZjZn7tp86WX9su/ybMUf5tIXcNQgkWeU/D4/jL1AQ3XKHhE
	ZnKwB22NmoTGhg1QMUhWm0IghPvRV8QOmRqS8uD0812cDbDiFr1KtqsCWc/iPMSB5GK5MwdCyea
	6+IWi4APv6MDlR1txNrj8YJnUP8er75lAGwKbGPH+m9gWMHFlMI8byp7BB9Vr4cu72OxkOyNpp5
	X9OCpGunJthTv+C+as1Xu9Mg6EFw6YNrvISMfPVH2zphcGjS4aJ6gfHIH8=
X-Received: by 2002:a05:6000:188c:b0:48c:4442:54e with SMTP id
 ffacd0b85a97d-499c6e96996mr5766110f8f.30.1794423977388; Wed, 11 Nov 2026
 11:06:17 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org> <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 11:06:06 -0800
X-Gm-Features: AclHuK_uzzc5PqVw0ACAUccbGDRKU7vaepPUlXKcHRboTuGhxy6z_fiaCT06APY
Message-ID: <CAKwvOd=gkPRazfqjd2xpvW-Pr8gLXVvxBYuzuyAOWi2xwinRTw@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:42=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> __attribute__((no_profile_instrument_function)) was first supported in
> GCC 7 and clang-13, which is higher than both the minimum supported
> versions of both compilers. This configuration is always 'y', thus it

Verified, but...

> can be removed.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  kernel/gcov/Kconfig       | 1 -
>  scripts/Kconfig.toolchain | 3 ---
>  2 files changed, 4 deletions(-)
>
> diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> index 04f4ebdc3cf5..f62de2dea8a3 100644
> --- a/kernel/gcov/Kconfig
> +++ b/kernel/gcov/Kconfig
> @@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
>  config GCOV_KERNEL
>         bool "Enable gcov-based kernel profiling"
>         depends on DEBUG_FS
> -       depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR

did you want to retain `depends on !ARCH_WANTS_NO_INSTR` (deleting the
` || CC_HAS_NO_PROFILE_FN_ATTR`)?

>         select CONSTRUCTORS
>         default n
>         help
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 2acbd40a38f1..666d44cc6ba8 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -141,9 +141,6 @@ config CC_HAS_ASSUME
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106654
>         default y if CC_IS_GCC && GCC_VERSION >=3D 130100
>
> -config CC_HAS_NO_PROFILE_FN_ATTR
> -       def_bool $(success,echo '__attribute__((no_profile_instrument_fun=
ction)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> -
>  # Beware of two problems when using cc-option in Kconfig compared to Kbu=
ild
>  #
>  # 1. cc-option in Kbuild tests the provided flags with all previously ad=
ded
>
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
