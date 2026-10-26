Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793053681;
	b=tYNlLFxNDNYCXJD7G2MCJ8Vy1e7/0Ud4LhmpaVbzJm58VyMSAieHuonch7pUwqxFTwtp
	 aq4J9WgCLo5MfgPAc7N9bkdbkPwZvhXLoLd2NI2V7R8BKESM/WWC9HU4bwwcr/coDtOCB
	 zqgIPo1zv4wSXfDl15ocyfV/DB8Caz//Ph5FkWNljUIABJmfXDvncp0dH71nOHh8LHEBe
	 JtjqNfFTerpXcEtO4MH3D3ydrmOGS+BUiLcSIehG1BGBBpIPkkuAFbTVmxWsOkm9E8NFa
	 eKIKdJEipJ/+finiWuf4e8M7f8H/Q83ujWEZAUxR9XQf+wleyl/rmbd/iN9Ur7GDVWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K6A7J4OpJDcLLheDWUIyyi0Xo+zxVRi79rgHbCkqBj8=;
	b=RLfw1J7P1leMS9aapebGg97feGuaAD56yKZQbLQo6H48dg95cAatCQTOhOsuc52qU/fW
	 x1AyLzb7CKjP+tRog/J0kkP+vZE8GqVEZZ96D9VHRUX2d6+IVciinC3luMY35Qj911pcI
	 YbRV1HVZAjUNHcSrJvrWdrGqlTbNQqhSIjagrvPvJCP+bV8owspgpYXEk5icL/ghGi8h7
	 lUbZDk2dda4jPSLS/Jjx8gE5V/0XZsZduwtaUdQo640GuhDT45LfZjBmntpr4VSwmlr4T
	 Ii4p4boS3KjMoTWpQ4mvxg3aIKWjbyxZuqF71aJGjvoVT4/WnIG9pt4F/dSGbkDBFGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E9YBGUS7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A7606A31D
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 22:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E9YBGUS7
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8565d77c277so29342797b3.0
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 15:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793053679; cv=none;
        d=google.com; s=arc-20260327;
        b=EvfUzZIC9lSThsM55ASC6W4QMC8Dp/kSCgiFCW/rm2BHTGvqTUHLtrXFhUhZVCguwT
         TCJgesQAuiq46PGpx9vc1j6WZUuJGtmDmSuLsCnaxXfYAkqmvtNy1rFqc+zEhD//qwAB
         FLemXi3oNZ2ZmsEuqhituSdjF4vC14AiL4aBWco2IdMTGL3FP5cek4B1Auw1qjJvVriW
         EOBRmKdYPESyyYdVMrvmERY4+a5AQPpQ4RZAETiLele/+uJrqk+CM1zCErFbOH7iZVnA
         eHD/jDoBtaOxcTgUWrBlFnAC2wstygLlb1+GpX2/sKTPMW3QsIPsRduMBucnwNfETMl7
         HbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6A7J4OpJDcLLheDWUIyyi0Xo+zxVRi79rgHbCkqBj8=;
        fh=9sqalAj/TKVO3uBgedDFlnCDdQ22+7CzS8cvG1pxWwI=;
        b=EFvtfU+4UWeFnbSk7ss9rguzNb/2ptucVqASCWlsEZSlYisx6u4bAUib/OXcMrougA
         fxWTl8D30aqu86SyqOSYDDK7bnThtbnHrdsmolO9XGmSRb4o9fAVKtf38DGrOe4D4wLm
         asljHRLpgPk3CUT2PcvaPOD2oqI9nhRDsRjDg0QG62ronQaBi5YoZ/t78sVs0XhgE7kX
         tLqG3LDe4dgmBPiHqGvrF0QfaWGTVKd+pwEtWkBhYQg0lwmhA7XhOL9YF2eUDY8Nu5q4
         wmGJKd4l0u09ivRnLXmTP+i13DOpKFKF13WiFKDf8DQ4UbXJ+lZn3H/eR1TGIb5oHFbs
         M1ZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053679; x=1793658479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K6A7J4OpJDcLLheDWUIyyi0Xo+zxVRi79rgHbCkqBj8=;
        b=E9YBGUS7WNBU8prH1BqAX8sJoXwUsUTQ6t6lAnB1EzdmS3eFxBlbvm876uqb+kTN5Q
         7CCxdA5OIicE+sHrIIOZzGSwEj6M0iA8rZL0DJv4qY+b8rOqGsPCY2vcbX8GP6a5AFwY
         5EpMwrXkUlvJpte0g0boeTa6QgtaiKIwPWukgDVoZwQpYmNVkP/KANXNZAhYzPu8jyHg
         FOsfS+ysqWibpN+8XXjOM5uK3SPX0c5B32nxIby+YgqHy4ARBfQvhGrnJbsbR9jqwXo5
         GD/Yi8KDmeXoc0gXy70hntIFrAu58NPR+zzfNZx9Zf3bUlPJBOVp0z7aXkx3n2s/CuaZ
         2RXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053679; x=1793658479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6A7J4OpJDcLLheDWUIyyi0Xo+zxVRi79rgHbCkqBj8=;
        b=MMeYMAEXyVadqVJTS6xt20vDIGinYTmAq7AEB96spZky2rAZzdxqWUXS/LdBRjkp1a
         83FgD7vnpJzd/1gmMW1x73lqJX1eIQ1DZ4zZAFNriSek3dBg6Kx6wqNFXyCyxpTbvbMO
         4bVNcBAJuaja+BOHouNQWEL2bu4t0yWmCeDEv8G9otpK9LfchgZDbAsnO82tNWHXCLct
         Lllj621OBfn631xoHLNLy7D7ApfAKJWgvVnghCM51lghUswpFJeq+yaASw1+FD3mnB3/
         j+G+NppOL6J3/Qf3M38cTMJ0IFznlAUVo9wWgBR+6A0jvKj9szZDif8wrn7XrsSyq0oe
         1PUw==
X-Forwarded-Encrypted: i=1; AKwUvBzFwnAl4pgQYwqSaKShqHjK989ZtjqsQy0gEivls93B+9IDQuntOASF3wt4snJjugvvOK8lLXXxg9mwAlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4EjtFurWAHXIG1u69ccTQEsc2HcI02hFyO1y4iqYwxHlIj2/a
	0P9n58rIY9OaD8kmskB9YE+HP7PqO99z6iX/9m6lNOa/g2Vpg92mgcylcdylwNk3fuNNIkLh5CP
	b0CsgYVVUKoLwFc84ZsuQqFk3FfKN/jY=
X-Gm-Gg: AYBFou0cvsveL3qGJ9SZPJP9/kgJWm4eLtW568v6bYtV6mijTDxtWGH1A2RDLCEKD0P
	MP2ox6cRPsmlPxpDNplZyL/dO8M0zuxPAF/rzVrhUQpWRSKsflF9j86VIKD71enktuDvfLoH5ET
	YnuHSAYrsdWVYPV0ZExIXqKdHqrRFgZOI3aiv8eY03Jv8yQLj5JINMth4Tm+dB2zzNOTWa2IIdZ
	RIhJItYhuRfmza81gyURbsgZsfZKiYMMGT1WTEbo4Y5Cq8EOTjw2yiO6YHplH2PbVPiv8LdLNyI
	2Bc1v0W9L2vh3j7Rn80nLICFzQV47VmtLClqYH903tgkFlpO9VIzVs0Q9JM3NxCtwoF2F+ASskw
	uo7SsARjeDYAFIVZBbO67KJSSH52DPhYw+EZhyB4T9ztYeQhhAcNjk32uwoKaAKhZRhADjXoRDx
	MnB/hu0M6hm74U4kE=
X-Received: by 2002:a05:690e:1548:20b0:679:afc3:b990 with SMTP id
 956f58d0204a3-67a455751ddmr3346085d50.152.1793053679299; Mon, 26 Oct 2026
 15:27:59 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-23-3c8cc5725def@gmail.com> <sashiko-outbox-170722@kernel.org>
In-Reply-To: <sashiko-outbox-170722@kernel.org>
From: jim.cromie@gmail.com
Date: Mon, 26 Oct 2026 16:27:33 -0600
X-Gm-Features: AclHuK-iFp5xqB6d-LRnKDMtWnZXSOdE3cMaERLXso3BmPK_qGi1CmXSW6vaeP8
Message-ID: <CAJfuBxw9uTaqwRudCe7r8_G3-jh+VvRoEzoY-OcZXC=WpctzOA@mail.gmail.com>
Subject: Re: [PATCH v12 23/40] selftests/dyndbg: Enable FT_classmap_inheritance
To: sashiko-reviews@lists.linux.dev
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] selftests: regex flaw silently excludes submodule from test as=
sertions
> --
>
> commit d0e8e8cb940b9b06248942fb57c7a41c66ad8636
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> selftests/dyndbg: Enable FT_classmap_inheritance
>
> Exercise classmap state inheritance between supermod and submod, verifyin=
g
> that class settings and controlling parameter states propagate from paren=
t
> classmap definitions to dependent class users upon module load and during
> runtime reconfiguration.
>
> > diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b=
/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > index c279c795867b6..d759243a4cbe7 100755
> > --- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> [ ... ]
> > @@ -291,6 +292,78 @@ function FT_basic_queries {
> >      ddcmd "file $f =3D_" "$f"
> >  }
> >
> > +function FT_classmap_inheritance {
> [ ... ]
> > +    # Real-time mathematical proof that load-time (modprobe) parameter=
 parsing
> > +    # and runtime (sysfs write) parameter configurations are perfectly=
 equivalent!
> > +    local hash_modprobe=3D$(slice_and_hash_ddctrl '\[test_dynamic_debu=
g*\]')
>
> [Severity: Medium]
> Does this regex fail to match the sub-module as intended?
>
> Looking at FT_classmap_inheritance(), it calls slice_and_hash_ddctrl() wh=
ich
> uses grep to filter output. In POSIX Basic Regular Expressions (BRE), the=
 *
> quantifier matches zero or more occurrences of the preceding character (g=
).
>
> This means the regex matches [test_dynamic_debug] but demands that the
> bracket ] immediately follows the g's. It completely fails to match
> [test_dynamic_debug_submod], silently excluding the sub-module from the
> load-time test assertions.
>

fixed in v13

> > +
> > +    # Fresh load with default parameters, then configure them dynamica=
lly at runtime
> > +    ifrmmod test_dynamic_debug_submod
> > +    ifrmmod test_dynamic_debug
> > +    my_modprobe test_dynamic_debug
> > +    my_modprobe test_dynamic_debug_submod
> > +    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_b=
its
> > +    echo 5 > /sys/module/test_dynamic_debug/parameters/p_level_num
> > +
> > +    local hash_sysfs=3D$(slice_and_hash_ddctrl '\[test_dynamic_debug*\=
]')
>
> [Severity: Medium]
> Similar to the issue above, does this regex fail to capture the runtime
> state of the sub-module?
>
> This allows the equivalence check between hash_modprobe and hash_sysfs
> to pass without actually verifying the sub-module inheritance behavior.

yes, now fixed

>
> > +    if [ "$hash_modprobe" !=3D "$hash_sysfs" ]; then
> > +        echo -e "${RED}: Load-time vs runtime parameter equivalence ch=
eck failed!${NC}"
> > +        exit $ksft_fail
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-dd-cmap-=
part2-clean-v12-0-3c8cc5725def@gmail.com?part=3D23
