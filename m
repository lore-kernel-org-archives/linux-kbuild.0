Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690594;
	b=12mtXCG7LrJXwLqjtqZ4KRaSwM7eqXyHga5V9WEP7dRAWdnWOrheGmlZTw/jyi4rsBLF
	 kyybNpyQjNcK7xGODOB8nSCfksYjlqUdqkmB07W4d09KnLybXeLgNU8ax0aM0DcEUr5ry
	 KgtvE3KvH0pmC7MAegl0VKWvot33bLNCPNnEMnqMpR0dqEAXO5ZAiSuAewxR8rhojiXUX
	 v1h7+NF1adhNVIYwfme6c7JqtJru0wyevqb4VRwVAeZgcRODRYi6p9k+MOsDB4zE2qNH7
	 xhwo390vZDZzxktvtSAsEip/3fgT3d1mOY168DU+0/OesDXjOxp/edZbt5Oiz8QkWZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LPh65sIV6PUIbo3zIpRD+buIIKCEHZbaq/2yXyMObYI=;
	b=iiSezzyctsjozBjACKo6gNule8OpnYWBjjrfHxPu3YmE2UiG/MO6f8T0xtaSGnaTghpH
	 V+KyKWY4a8ZG7N9vSJTSwYlQxU5JyqbzKXBkluJUEZSTF6CVMhIYJUY3hop9OaAuB2sh7
	 7yqvnTSdi9iXwlt3QYeMmfVxlYFwDQ/oLnPuduaJh0eQyqHI80MkTSMV+Z4228zCFSNuB
	 TtWtaE9xRO5rRr0CTddelG9fJSCYvay6FkqUtAblGWnGsgc76M+aZ2VN+8kueN1Rszks5
	 B64MddRetBPT1vzKM+ZcBFLUpXEy4EcqxkyvfyJkkze8x1OBjKYJdWVgje6AuRZ8KFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEytx9ko;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB7606A323;
	Sat, 14 Nov 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEytx9ko
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A96E1F000C5;
	Sat, 14 Nov 2026 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794690593;
	bh=LPh65sIV6PUIbo3zIpRD+buIIKCEHZbaq/2yXyMObYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nEytx9kouZeM48F1z1Y0aL8GdxUiYJgYk6D+C8m0RzqPw824OX1ke50vky+/Xv4S8
	 XhsjcvOYvUzW7zG0Br/pYzZEhqRatnQnRjIjLJxYGy6omsAfnw78AHDekEotTnJxPH
	 wTYXFXdga41g+Q7f9/sB94Hv/gt2CgeUhU8e+Z/IlZPMNKvhDVmahTd9XiiqA2zO7b
	 7Zf5FgW3FmHol1gejs4F5CQpPHwLDD4zwUBs4p8GLy5hXcoi9nNYM4FqKDalRdE3xH
	 /bzr/fRUpslDVRoPdppI5i+HFBSaLOEk6/8cURL2hS2e+AwP+bEDuOkpGt1TkH3kAv
	 tUVPavBFsY8WQ==
Message-ID: <sashiko-outbox-215034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 3/5] kbuild: fit: Add opt-in FIT_FACTOR_DTBS
 support using fdtfactor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Douglas Anderson" <dianders@chromium.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>
Cc: "Julius Werner" <jwerner@chromium.org>, "Michal Simek" <michal.simek@amd.com>,
 =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>, "Simon Glass" <sjg@chromium.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, linux-kbuild@vger.kernel.org, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Chen-Yu Tsai" <wenst@chromium.org>, "Will
 Deacon" <will@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, Devicetree@vger.kernel.org, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Nicolas Schier" <nsc@kernel.org>, "Saravana
 Kannan" <saravanak@kernel.org>, "Brian Norris" <briannorris@chromium.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, =?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?= <ljs@kernel.org>, "Manuel
 Ebner" <manuelebnerli@mailbox.org>, "Marco Elver" <elver@google.com>, "Mark
 Rutland" <mark.rutland@arm.com>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
 =?utf-8?b?UGV0ZXIgWmlqbHN0cmEgKEludGVsKQ==?= <peterz@infradead.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Rong Xu" <xur@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>
In-Reply-To: <20261113130858.RFC.v2.3.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.3.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 21:09:52 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] kbuild: fit: incomplete __local_fixups__ on composite DTBs
  with FIT_FACTOR_DTBS
--

commit b1fb21de907c618079fb42ef4673839c84598f6a
Author: Douglas Anderson <dianders@chromium.org>

kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor

This commit adds opt-in support for factoring DTBs inside a compiled FIT
image into shared base DTBs and per-board overlays using fdtfactor when
FIT_FACTOR_DTBS is set.

> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> index cc14fc905ea3b..bc0c62617a7c2 100644
> --- a/scripts/Makefile.dtbs
> +++ b/scripts/Makefile.dtbs
> @@ -126,6 +126,14 @@ DTC_FLAGS +=3D -Wnode_name_chars_strict \
>               -Wunique_unit_address
>  endif
> =20
> +# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retai=
n the
> +# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
> +ifneq ($(FIT_FACTOR_DTBS),)
> +ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
> +DTC_FLAGS +=3D -@ -L
> +endif
> +endif
> +
>  DTC_FLAGS +=3D $(DTC_FLAGS_$(target-stem))
> =20
>  # Set -@ if the target is a base DTB that overlay is applied onto
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index e08e35d4ed747..af2d3e5084249 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -418,6 +418,9 @@ quiet_cmd_uimage =3D UIMAGE  $@
>  # ----------------------------------------------------------------------=
-----
> =20
>  MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> +# External fdtfactor tool from upstream dtc (requires matching pylibfdt)
> +FDTFACTOR ?=3D fdtfactor
> +FDTFACTOR_ARGS ?=3D --strip-local-fixups
> =20
>  # Use this to override the compression algorithm
>  FIT_COMPRESSION ?=3D gzip
> @@ -428,7 +431,9 @@ quiet_cmd_fit =3D FIT     $@
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
>  		$(if $(FIT_CONFIG_FILE),--config $(FIT_CONFIG_FILE)) \
> -		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> +		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^) \
> +		$(if $(FIT_FACTOR_DTBS),&& $(FDTFACTOR) $(FDTFACTOR_ARGS) \
> +			$(if $(findstring 1,$(KBUILD_VERBOSE)),-s) -F $@)

[Severity: Medium]
As reported by Simon Glass on RFC [1], can composite DTBs built via
cmd_fdtoverlay reach fdtfactor with incomplete /__local_fixups__ when
FIT_FACTOR_DTBS=3D1 is used without FIT_DECOMPOSE_DTBS=3D1?

Although DTC_FLAGS passes -@ -L to dtc for the base .dtb and .dtbo inputs,
fdt_overlay_apply() in the in-tree scripts/dtc/libfdt/fdt_overlay.c merges
__overlay__ and __symbols__ into the target DTB without merging the
overlay's /__local_fixups__.  When FIT_DECOMPOSE_DTBS is not set,
make_fit.py packs those composite .dtb blobs into image.fit, leaving
fdtfactor without local fixup entries for phandle properties originating
from the overlays.

Until in-tree libfdt preserves overlay /__local_fixups__, should
FIT_FACTOR_DTBS imply --decompose-dtbs (or reject composite DTBs when
FIT_DECOMPOSE_DTBS is not enabled)?

[1] https://lore.kernel.org/r/CAFLszTh6vmFGVD4_Reewe9p4QqQjN=3DCVJ3SgfQKosA=
hedJpAQA@mail.gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113210918.3562=
61-1-dianders@chromium.org?part=3D3
