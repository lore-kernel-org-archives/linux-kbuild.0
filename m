Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685361;
	b=T9exLkl+T8bBZKcvzuaLiugtS/IR6uZ+dx2fRLGLyo9PO8s9IRBGH56fTAc3haaS59Mp
	 uxmvcm9EBr1McF6uMC7ZfFDKqnJHijdeUqGkaz4LzSlA0pNvq0iZAxYIy8OSDouBkbh3f
	 jIoksd03y3I7nqHGuk5aW0nnecOPC2EzWCs/LlL1ivEpdCIOx7Ep5LxtQ9eggUeMOJuhc
	 0FCYP1crbppBKs3zxiCE01jIe4s3ahJcDRLyfjeLm0s2mXgmzJ4VdyfWs48mmHOIF3Ow6
	 mdHK2u0XQ6NiSUj6MGMoC0a2miovwUSz5r6QuewXBmPrY0ITMQD6VFmDcPpnLZmbn4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685361;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pEF1Gr9NZAzDPLZXlqHvpR6uqdednUOXEnQnTQGMKc4=;
	b=HDNXxnUAginz5ZWuwmI32p1mO4Iq0MHNckfkbkcYszZUQD0wqchiZegJemWtYUDSQBnf
	 QNlgBddPBrUJdFyyy+a4zY0TgCUTFqpCzg4lTtiYQJU4Ht5KewBc5XgsL0OTyX29FNKj9
	 5uu+k1iYJiRDeCqWZjYU9jNdK+s05qtgC5f6fVhWpFK5f4az/Z5XcU4S5rZu7G0K+zGBN
	 uE4NqfzQv24C1cSQsWCw12dbgYRdVj7KMBtSIYbudQewcwEWYIncMcVB1UNuYQjXExQyO
	 IT7Aq9PFjcFxJxPVIZyuSOZsyscEqAtBrf5ZU4qVWGV6CeZOw6S7cBECcrUrrIemMkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlSRlLt2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081C606A324
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2026 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UlSRlLt2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0BC1F000C1;
	Tue,  3 Nov 2026 05:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793685361;
	bh=pEF1Gr9NZAzDPLZXlqHvpR6uqdednUOXEnQnTQGMKc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UlSRlLt26I1EfZirClJzUt7UD0XrolHo+HlyHOlCfi7jtONbiniBumEB94dll5ABk
	 fWBQzST+pNknOgkLkbJDpeYYzeDzv7a7AQ9sDch/uW+Wz8xqvPTqo+FEhj0/PL+p7a
	 FOkUF2XIlgGSYRDCsRKnCFAtCIUHdrKnpGvad8cV/EJLHDA8EecIebUUuKbOMgaZt3
	 h5/tgXX2d3pTDXNx81yOZGk19TaP/5fGllkYCFnyMV3BhN9UJqMTFLXYt6TWCV6NcK
	 KGclyQ8Ck4w5GnLL5uK356sQkz9fasx5qVJJasAddKRoRBdztHskH1nOhC1bi6z04h
	 w/KPZ0opWurGQ==
Message-ID: <sashiko-outbox-194603@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] kbuild: don't print DESCEND messages from tools/
 build
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20261102-kbuild-descend-spam-v1-3-caff4f840cb7@weissschuh.net>
References: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
 <20261102-kbuild-descend-spam-v1-3-caff4f840cb7@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 05:56:00 +0000
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
- [Low] kbuild: missing QUIET_DESCEND=3D$(Q) in explicit tools/bootconfig t=
arget
--

commit 7691301f76c95de2969936070a6b66297111591a
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

kbuild: don't print DESCEND messages from tools/ build

This commit passes QUIET_DESCEND=3D$(Q) to the tools/ sub-make invoked by t=
he
tools/% pattern rule in the top-level Makefile so that Kbuild suppresses
the DESCEND messages emitted by the tools/ build system by default.

> diff --git a/Makefile b/Makefile
> index d73f2bbd3b93d..2bfe786bc2843 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1637,7 +1637,7 @@ endif
> =20
>  tools/%: FORCE
>  	$(Q)mkdir -p $(objtree)/tools
> -	$(Q)$(MAKE) O=3D$(abspath $(objtree)) subdir=3Dtools -C $(srctree)/tool=
s/ $*
> +	$(Q)$(MAKE) O=3D$(abspath $(objtree)) QUIET_DESCEND=3D$(Q) subdir=3Dtoo=
ls -C $(srctree)/tools/ $*

[Severity: Low]
Should the explicit tools/bootconfig rule earlier in Makefile also pass
QUIET_DESCEND=3D$(Q)?

Makefile defines a dedicated target for tools/bootconfig that takes
precedence over the generic tools/% pattern rule when building with
CONFIG_CMDLINE_FROM_BOOTCONFIG=3Dy (via prepare: tools/bootconfig) or when
running make tools/bootconfig directly:

Makefile:
tools/bootconfig: export CC :=3D $(HOSTCC)
tools/bootconfig: FORCE
	$(Q)mkdir -p $(objtree)/tools
	$(Q)$(MAKE) O=3D$(abspath $(objtree)) subdir=3Dtools -C $(srctree)/tools/ \
		bootconfig CROSS_COMPILE=3D

In tools/Makefile, the bootconfig target uses $(call descend,$@), which
expands $(QUIET_DESCEND):

tools/Makefile:
counter dma firewire hv guest bootconfig spi usb virtio mm bpf iio gpio obj=
tool leds wmi firmware debugging tracing: FORCE
	$(call descend,$@)

Without QUIET_DESCEND=3D$(Q) on the tools/bootconfig recipe, won't Kbuild
still print the DESCEND bootconfig message during builds that invoke
tools/bootconfig?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-kbuild-des=
cend-spam-v1-0-caff4f840cb7@weissschuh.net?part=3D3
