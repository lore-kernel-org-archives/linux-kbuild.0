Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794425380;
	b=w2DDH4X6GBBHPz/J7/vqUUEZW9X8z1l0I3N12wuEMujUfWSqYV9K2z6u2BtzKS/BeKjh
	 NctRd8Oz5nJoLyt7LXs/0rkHNN5zoN59fNnZFdFUAxgjM5k1SFmqk8aAY63p0JngsqJeP
	 nX1kYx1tFfIbWYtCvVMkkM3Q7AE4UWq6NwrzF2j/xyBzIrRanWiHOApkEF3CGtKVwl8JI
	 3oUP1ZetoGkpQ03zwzSx2BDqSDy+KiSzsISC6KkZxZ6TnPVkB73ZKjkl1hD9ijpRUcKSv
	 dhiG4LC/ElhRpagP819Cp+yCNoojdnbgMC2q0OjhntOyu+YRXAS0zTGrvRJKy7WhdPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
	b=tlheTZVKF//95tiOcrSxfg0tDXGUrANRyv6QbVXt7g8xa7RsHW7Pp2I+aojNK+wEzfKa
	 OVmrXHDkyxLUtelbI4fnKlO9MVnypBOWLuH1bUmGIs6pkaLKVSIzQ7sVctbHk6xCzJOmu
	 v6ZVHIGubcq+KZS64GYOaEKKkLtDp/GczlObPi5guctAsVveneHdGtTtoRXPVElGvB8BB
	 0iCCCJSMxaADRCbWbfbS5hdgW342gVVVbTJewfunfF1qgl/dR8yo73dOVlkIFRmDOusgS
	 U1AZeg64KlXvXUEWCBfs2jdJD/W5PZj+1LQvMSIYL9l9BEl8i+xIhlCndeKlpxmujiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C6Xw8gPV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D3606A336
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 19:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8D3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C6Xw8gPV
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e10a70540so2145642f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 11:29:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794425378; cv=none;
        d=google.com; s=arc-20260327;
        b=JvjOKoDzmlHQmQLUUNZ3Cf9Noa/K+lH6HLA2pyQWb+mSJ9j4IXcBiJvMivYPXYaOnp
         OkRH/wo0jQdFe0anUkeb2W/kdTFvKBLuwKQFwiGAXt62NtjM8wkWI5FLCm7O5Ix1Q7JH
         IO+ngVmrtEDnTdaFts1nDq6rdDsFMP8twie06S+jdAEJalT3kSmMg/scLrCqRQC53kZj
         fEB7wFzbpEZ7QYVekOXp7Tq+SnBlyiPu3E5CPWOmepbZmnrpxlC2DuIFrujTWDtQ3OVR
         7vOpRuv8ARb9LOuhKeFcxRloXMPEKM6x21/qC8BnH46xCdSDEf92U7VHlNnKOK38wX5C
         9c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        fh=FymE58Vzglw8J74WSZwRIzlDeqFE4DN8QdBmM8wp8Og=;
        b=gJmHw1w/0pJk8IQ1ugReA2zNxegApvu6du8/XQZ93RIzCu1Q4X++wSBpJYyb4xjLXu
         AKmJ9sU1RweLUc6U4OQqHM0A6mBdXjzo8HObXKbipcY0LrJN/+YJz7bO8fKYPkOIDxjN
         WpHp0B6kD+0AJAiFG6/GFIoJYeCfvOMm/ub/m7xRXwuDvGpH4ghrb2M5Tvsufoyqfy3i
         hS77d7RjXjvf6HHxd2B220mL/yUiFqYFcseZQ5NyJzcPI3DYOloaO5jOwHYqDjzonAZn
         31BXLJqIZBUcGaw0Syb8+szm7AIZWLM5qn+Rqp5WwM6OVsWhfAKzkjYxYkOB9uYA9tH6
         2m8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425378; x=1795030178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        b=C6Xw8gPVrG+mVNSSL9d2PJ+u870tFDnlvjeDZ2mQnJYEilOZUT9OnU0+f70Iera5Nh
         bWS+ysqt6bZl0O9lNSxqYjdl/6pf/xUanEGWmr69Xf6n1GXkU3Mmb4aEdGXLwgYAfTnh
         uOf8EK60UrvGhiECyCUzpgkTim8HxQkDOr76o5UualHotxYk3UhwpZ1v0+grlwhqqTz/
         hHxtMosW0AUgFaxzRpEtCuITz6JcD9C8ctvASr/Zw2zG59Tuok/r6ErXbzOhGWJTv3Cn
         kEHKNTiHUGlGPMelTpPmeeXWKW9ZIjdsq8K/InmNZObCCjNnIO8WEgBULdLaseFnQLph
         tUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425378; x=1795030178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        b=KokoasLipb6tzoDnTKZ1M4+SQkGNbVUEAxHKMM3O5UGITO1LBIXAPGL/RPrjQ8Ok9V
         bq2Zep1i9FKf/Oy8VjOCIktgNETMS7wdL1WS6rhjwS9+bxrPd2MQ1ML6KcLllZOJ293I
         0WHpaoO6UnQfsumQdiWaIKs3TrN8vlcQWH/HrrBx3zXmK4X4QdxAdEFzR6VZ5sV0NQ8s
         Po3kBZJhQK9vaNR5DZe0HaZnDzat2/xrOv49NRJtz8nq4dMpOxbGRSTwASQytQMASAPa
         CHp6DAmCfWrOtEt0sUu7fHP4yzFgbH2OkdxOQ0AmM+sc36rCk8PELX8TSFpOgjcsntQl
         7lLw==
X-Forwarded-Encrypted: i=1; AL+hErF5o+SlqKxcPETWrOFEcirmQfTucu2wb0UvLipM7iNuDc/FcYW94G/P4nbH4CFnJ5dMLV50uBgFTCKhS2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NjK3EikMZWX9QM4YrIGRhSEsIhclIb981rWVX7ER5FbXk3ymM
	p+HZBX903otuQBrAFW02gXxCDm/oCPUO+IvH4U2u1h2XgIEdT4LOgNII6p6v8V8WKeVzaE57MTf
	mqpvOgJRFs/N3RP7x5y+rbfB1xs7TAlT7Y5tpilhZ
X-Gm-Gg: AYBFou2K6kMvLXPj1iphznas/BcKWyP/EulDl07WFMuOd1kAX02oOsKIIYP+hO7iHj9
	4uFKnpV0umjCjDcrKyCVhvnYB2f6YX9GHG9fk5yyXWd9ZGEM1ZUwirIJN0QQ3Bg1dQw7h+V5gaH
	bqKRCS0cofZZhqYWbM1AqNthyjnqZdnZQf4yomEDy4QSFAjz0vitnXRbc3luIYD7WuzFqYHd0ye
	LkYTqVMHXGuH0KrVYBBr3X4CLgX8R4PuBcybtWm+Y8KKPbUZWFmh4KvyMEZhnG+Svf004usdC5O
	jxus/mKDd8UWDedpl4NjIDzyjlxA6RreAhq5PIEeMG2RvhNXeg1Kmb8DZEQn0cHbcc0UIVy6H7t
	tHv4TlVKJI3d1GJG3wLO7PG8Ibb02NqptMXoZngSkL80stFMR+HZz2xP5JEGJSSNJEidizEKy6I
	MilA/Kl4bw95Y+nF+kWwgI58YvSj5RXN+umHLS/n2b1A5kCHrZ7HghyNUFhBblh3l2lJtK1fSh7
	1xA7HdSVe4OXX7demeTO5Vmg9FYJ8HhNIZrlw==
X-Received: by 2002:a05:6000:2512:b0:48d:dc6f:219a with SMTP id
 ffacd0b85a97d-499c6405960mr5972764f8f.27.1794425377867; Wed, 11 Nov 2026
 11:29:37 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
 <CAKwvOd=gkPRazfqjd2xpvW-Pr8gLXVvxBYuzuyAOWi2xwinRTw@mail.gmail.com> <20261111191013.GA2689488@ax162>
In-Reply-To: <20261111191013.GA2689488@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 11:29:26 -0800
X-Gm-Features: AclHuK8M0r82CQVvygYUkMuWGiTf-D32nwsvHptLhG_qlCYowPaCQaKeVTzLjSc
Message-ID: <CAKwvOdn83etoZPhe9AGkHaY=Xkzxo3jwLgjAAySmgA_dbAxMCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:10=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Wed, Nov 11, 2026 at 11:06:06AM -0800, Nick Desaulniers wrote:
> > On Tue, Nov 10, 2026 at 9:42=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > > diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> > > index 04f4ebdc3cf5..f62de2dea8a3 100644
> > > --- a/kernel/gcov/Kconfig
> > > +++ b/kernel/gcov/Kconfig
> > > @@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
> > >  config GCOV_KERNEL
> > >         bool "Enable gcov-based kernel profiling"
> > >         depends on DEBUG_FS
> > > -       depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
> >
> > did you want to retain `depends on !ARCH_WANTS_NO_INSTR` (deleting the
> > ` || CC_HAS_NO_PROFILE_FN_ATTR`)?
>
> No. If CONFIG_CC_HAS_NO_PROFILE_FN_ATTR is always 'y', this whole
> 'depends on' line is 'y', so it can be removed entirely. The noinstr
> part of that dependency was only added because the "no profile"
> attribute is only relevant for noinstr.

SGTM
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

--=20
Thanks,
~Nick Desaulniers
