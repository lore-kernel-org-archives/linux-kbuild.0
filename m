Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523812;
	b=VuqoyYDtYn3/uU1pBvblQvT369YS6n5t85qTaZ53Mz0Wc2fIivx7XkkgkqPyqI7wEoHt
	 1yo5BOxhkszSvJH2f1XTUJPL0/W0qlX99ppF6/aVRrIgzp5onVCZdnpan2Z4L0WYwzbPv
	 /G9DciWSCGRXouzv5/Llnzl+E/qOogT75vbPLr6vagpAMjN3XxBpzYL7V7bsrkLdgt8cK
	 KDaPPtg/i5yS6nbRu1hiNJh9axsGc2EaufIJcOLnYRiK5Zr3iVVRoKe0z2NgB2/dpQ29L
	 u/l/VyUDtyMSyo0x0A/OBLj5YxDycyptXBLyOZBmfHxQs+gbsvA5DRrtRwy6i/9m4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523812;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2WaiC0kEUHjuiprDvwKQvuB+u4qkKbsleklFTKnfyss=;
	b=B9lVrdvpIs0YS6OiMhFT/LQBwVyJmidmov5AwDkFTr70J72dPabCQUTQJByxVVGqwzzR
	 fOrY2ZVXFwZZSM7NdwP+Ti+3WRTcUinXs3s0aawfCxhbVBdJRUerJaTUROa3QV8/IgbRj
	 r0J5zBtGmbCZCR7aZ6b7tnkfLS6K8lDumgE6/SEQBTe/cGtNqIWUEMPtVbDJC1xvNHG3A
	 epc+IA1b6ohjMGA1tLl8H1nFn4Km6DpsxNuKdni/KsXMa7wzzVkWwKShWHCjDpmjUYEd5
	 3gS8akU2vT6TjWANWoImhKaM5giyj6gNvybSaf7C6+Zv2GTyeCT2kmsUAXwLNQ081vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjVC7bUH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF906606A31D
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjVC7bUH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA391F000CB;
	Tue, 20 Oct 2026 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792523811;
	bh=2WaiC0kEUHjuiprDvwKQvuB+u4qkKbsleklFTKnfyss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WjVC7bUHCDYr3IXg64mrqlqePOPaxYNwcMhL18zOqNgwZ5FwtVHOdTEmD3Rl1BrJK
	 ezokL8oLa6sKvGjSWbH0I9LQZ1OZYf62Ztx7/a83lmFWL/KJvrgu19FFgYc4ywqYA1
	 r/UiBONJXprQVkF9stEjbasa6uZ7r/56nKuXuWZh1cJX3B0xj3srlj8jKTu5wV3fi3
	 g+YagFBrhk4gIV0LMKXZMV/y1GqqPC5vuPOtpJXxTpWc04xm/YCMko22F2K4qI51N+
	 rWUL2k+ovidQ/P5io1t6Z3jFXtYQOl9tOkHVMJx/mhEVmPSb2cQcMdSTZkEgxwvpon
	 CzVkm9jFkUfEg==
Message-ID: <sashiko-outbox-179507@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: allow to set package name version
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
References: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 19:16:51 +0000
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
- [Medium] kbuild: deb-pkg: broken build symlink in install_kernel_headers()
--

commit bc8efaaf9e21748a005be3c75bb9c6c2334ac049
Author: Guido G=C3=BCnther <agx@sigxcpu.org>

kbuild: deb-pkg: allow to set package name version

This commit introduces KDEB_PKGNAMEVERSION in scripts/package/mkdebian to
allow overriding the version suffix used in the generated Debian binary
package names instead of always using KERNELRELEASE.

> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index d4b007b38a475..44ca9991fd6f4 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -172,6 +172,12 @@ else
>  	packagename=3Dlinux-image
>  fi
> =20
> +if [ "${KDEB_PKGNAMEVERSION:+set}" ]; then
> +	packagenameversion=3D$KDEB_PKGNAMEVERSION
> +else
> +	packagenameversion=3D$KERNELRELEASE
> +fi
> +
>  debarch=3D
>  set_debarch
> =20
> @@ -215,7 +221,7 @@ Build-Depends-Arch: bc, bison, flex,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/
> =20
> -Package: $packagename-${KERNELRELEASE}
> +Package: $packagename-${packagenameversion}
>  Architecture: $debarch
>  Description: Linux kernel, version ${KERNELRELEASE}
>   This package contains the Linux kernel, modules and corresponding other
> @@ -238,7 +244,7 @@ EOF
>  if is_enabled CONFIG_MODULES; then
>  cat <<EOF >> debian/control
> =20
> -Package: linux-headers-${KERNELRELEASE}
> +Package: linux-headers-${packagenameversion}

[Severity: Medium]
When KDEB_PKGNAMEVERSION is set to a value different from KERNELRELEASE (su=
ch
as 7.3 or stable) with CONFIG_MODULES enabled, does this break the
/lib/modules/${KERNELRELEASE}/build symlink in the linux-headers package?

In scripts/package/builddeb, install_linux_image() installs modules under
/lib/modules/${KERNELRELEASE} and removes the build symlink so the headers
package can provide it:

scripts/package/builddeb:install_linux_image() {
	...
	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH=3D"${pdir}" INSTALL_MOD_ST=
RIP=3D1 modules_install
	rm -f "${pdir}/lib/modules/${KERNELRELEASE}/build"
	...
}

However, install_kernel_headers() in scripts/package/builddeb derives
$version by stripping "linux-headers-" from the package name ($1) rather th=
an
using ${KERNELRELEASE}:

scripts/package/builddeb:install_kernel_headers() {
	pdir=3Ddebian/$1
	version=3D${1#linux-headers-}
	...
	mkdir -p $pdir/lib/modules/$version/
	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
}

Because $1 is now linux-headers-${KDEB_PKGNAMEVERSION}, won't
install_kernel_headers() create the symlink at
/lib/modules/${KDEB_PKGNAMEVERSION}/build instead of
/lib/modules/${KERNELRELEASE}/build, leaving /lib/modules/$(uname -r)/build
missing for out-of-tree module builds and DKMS?

[ ... ]

>
>
>
>
>
>
>
>
>
>
>
>
>
>

[]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-deb-pkg-v1=
-1-7f8e60bbede5@sigxcpu.org?part=3D1
