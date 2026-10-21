Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541867;
	b=eZVifWUAcHBZPm+I+6cr84ubGm0+KTLxWAX5ki0ZwpqlkeM3bsUodo/36Ms+U4BstaM5
	 xBXi/ETYenPjiDHCKW6oT9Ew0aOtxA+q+oD/mO8QWjLOnfnP7wptlA/x57a3+WyUv2siH
	 dYLcPziwFVcp1JF9pzNp1Eqha94HErtyrq4gUg/B3l9pGdCreSyqvwTHmIHwH46kj3sUx
	 jS5QToeX00rJ9wCwIbRtydvWsxAxv1d5vspia3UZ1X+Lg+HNjN89r+TuvZA+Ha+k7JYjA
	 JUKOv8i2FS1miS/E45y4HO3CCalX82uMdxZANuDYNv1c4BMIjr9+zJTJIYcnSFZW9pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541867;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rmQvEL3k2iq8l9zm80u1ebYI5T5XmeTh7p6VDeNoovI=;
	b=Wrpd6ecm0qRn+WJZjwXGES2tsBNoS9BIMoMn2NLlz+kC1TSl+fQxWCI0xIEzX/aJPpkC
	 GEIzRzKwFzhhbE1vJ41pmg/T+Vv+TVXEp5WDRmHBZKkAzMhqcAerfurhkVoq2CAYixst0
	 tpy6hTx49PsnhLRrxh56TUi31g+6kKzZQ4RkaYqdtRLYiCsV8PSMoJxGZTytdJI+baTBu
	 CwYQgrIGvj7eYeoRFVEKUlSzQHFrFHxeuBpWcBI2bs8kwfQ2wEL+O9Ejbnjr+1Il1fjlV
	 zJotYrpGPvo8Kz8LxEjH8mFiYwhSjD5p79/VNw3eK2f4eSWrFVGn4X0ovxpGA8rI0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XP1GUhKj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8A606A31B
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 00:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XP1GUhKj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6731F000C9;
	Wed, 21 Oct 2026 00:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792541866;
	bh=rmQvEL3k2iq8l9zm80u1ebYI5T5XmeTh7p6VDeNoovI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XP1GUhKj6xYGQY7YSdAUriByTrMI6AhpGJ6Y4CToS+yFm/v2NeLeJ+SacH5/1U3A6
	 QaKXiGKrxtUz6hVioRvZpBhuZZzMixwdh+UjK2vPEwOvpD4oQTuS/ZKCFpscdT/F9x
	 3qxfjBsra4sR4l6/5eB/WZO5JXiFK9unsDXs1cP9oiqfnaVgjp7ZVfQG2uXZt8Sb9V
	 mQQq1+DYQQaO6WsSvTkwiMwZVDg/0z8i/mT+QrH7SZpVwtRQnHfzf5THYeYh9htg1B
	 hpARd4hKR0id9lN6y6vnvMeEAw0IuB3BX0geVY+xCZZ5Ez+OWCsbD+TRfoAJ6wd75F
	 6ySojenwTyYWw==
Message-ID: <sashiko-outbox-179629@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] kbuild: improve sanity check for ARCH variable on x86
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cao Jin" <pino.cao2022@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20261020001738.2607318-1-pino.cao2022@gmail.com>
References: <20261020001738.2607318-1-pino.cao2022@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 00:17:46 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] kbuild: unnormalized x86 ARCH variants force 64BIT and break def=
config
--

commit 3a5958b43dbec65a7ac36420afb7bc18b48749a2
Author: Cao Jin <pino.cao2022@gmail.com>

kbuild: improve sanity check for ARCH variable on x86

This commit replaces the explicit i386 and x86_64 checks in the top-level
Makefile with a findstring check matching "86" to set SRCARCH :=3D x86 for
additional x86 architecture name variants such as i486, i586, i686, and
x86_32.

> diff --git a/Makefile b/Makefile
> index 8d23af898d44d..a32e20a8d41dd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -410,12 +410,10 @@ ARCH		?=3D $(SUBARCH)
>  UTS_MACHINE 	:=3D $(ARCH)
>  SRCARCH 	:=3D $(ARCH)
> =20
> -# Additional ARCH settings for x86
> -ifeq ($(ARCH),i386)
> -        SRCARCH :=3D x86
> -endif
> -ifeq ($(ARCH),x86_64)
> -        SRCARCH :=3D x86
> +# Additional sanity check for cmdline ARCH settings for x86. This catch
> +# more name variants than "i386" and "x86_64".
> +ifneq ($(findstring 86,$(ARCH)),)
> +    SRCARCH :=3D x86
>  endif

[Severity: Medium]
When make is invoked with ARCH=3Di486, ARCH=3Di586, ARCH=3Di686, or ARCH=3D=
x86_32,
setting SRCARCH :=3D x86 leaves $(ARCH) unnormalized for downstream x86 bui=
ld
files.

In arch/x86/Kconfig, the 64BIT symbol checks $(ARCH) directly:

config 64BIT
	bool "64-bit kernel" if "$(ARCH)" =3D "x86"
	default "$(ARCH)" !=3D "i386"

Because $(ARCH) is neither "x86" nor "i386" for i486, i586, i686, and
x86_32, the prompt condition evaluates to false and the default expression
evaluates to y. Doesn't this force an unconfigurable 64-bit (CONFIG_64BIT=
=3Dy,
CONFIG_X86_64=3Dy) build when one of these 32-bit x86 ARCH variants is
requested?

Similarly, arch/x86/Makefile selects KBUILD_DEFCONFIG using $(ARCH):

ifeq ($(ARCH),x86)
  ifeq ($(shell uname -m | sed -e 's/i.86/i386/'),i386)
        KBUILD_DEFCONFIG :=3D i386_defconfig
  else
        KBUILD_DEFCONFIG :=3D x86_64_defconfig
  endif
else
        KBUILD_DEFCONFIG :=3D $(ARCH)_defconfig
endif

Since arch/x86/configs/ only provides i386_defconfig and x86_64_defconfig,
won't running defconfig with ARCH=3Di486, ARCH=3Di586, ARCH=3Di686, or
ARCH=3Dx86_32 still fail trying to find arch/x86/configs/$(ARCH)_defconfig?

> =20
>  # Additional ARCH settings for sparc

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020001738.2607=
318-1-pino.cao2022@gmail.com?part=3D1
