Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930837;
	b=ETxfKYVdv33VNKz3EHenGr58oli6dX9XaZ0gIhR3ZK4XmwWbuy+bnUwTHIKiSEoT0b0P
	 G20XUXPtpBuhjnw4UTDlu2pVtyZJtXA0g/Y9fByj80OdlSdWno/EOueDzW6NBozlk2zSA
	 /nuRcf1IEJdQ8uqeO7Sr4SguqkaydVfzIKgjg93pyylv+cVHz17oL3fdtSpcjLN9hcoDB
	 hu8USzZLrItIKQ6L4s5oDLMKUyd3tgt4oIBuSqfyMdHqCjwb7SSbTI+WUFTV0/cagm6jT
	 luwhqzHgP0GWzBrE4QjX6izvG70d/PVJH78TJhVmu90VX2hdsXkZzcIdQq+CwkoZnCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O3P6jNAqPvkTroE4Dmg80hG1UTjpefhjiQsZmMqkVxk=;
	b=hG/CEPQX4wgVTs48GThYyUOZdkISk5LB1SRSQsxP7w+2y5fCsuDcxujM4I0VJU+0qybP
	 tiCaGCKmmhpG55eciAolscyP26zipFLl+SegBaPMzj5fQGVwSuTkcPI+RhQ343Ex13Hs3
	 ArRFfJI4V8jTBhgpI2abyeHrY0uXSWzesu5OT1GlrF4O5zB3Ctg9gDP6EDz6sL1q+pCvC
	 Xt/Olh9i4QXQcvFR7mKnr6yFX1UrTNjUpeVTIPIG3HHLXsDMUMwekjN4sEoODuRGUmEmD
	 WQHutYolRLYiMtVq95a0+NgC6LUPlCI9fekkq6fhtm7WdfCqiGSFXmoLkaA4En/qbbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=djtJLe2v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED6606A32A
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=djtJLe2v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1D11F000C5;
	Tue, 17 Nov 2026 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794930837;
	bh=O3P6jNAqPvkTroE4Dmg80hG1UTjpefhjiQsZmMqkVxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=djtJLe2v76S+HdqBIHFqRt/aRn8A+JTEIqyOCexNUY7N2RHqck3pF6L1JV623GTWR
	 y5XmXd2EEQKzA6Xhk55qfBGSNYYIexJgVUb0noXyInp25aiPfvjEZVTYVqk023Wf+6
	 D0rQS+9TRPi4j48LpPbM52xEf/6sOIYe25EHt9TkBmT5mtSEYgbGzO3rin9xLSwNOW
	 zqOx1pWO2JHfwlVqCR1iVGgBAE9EJ1E4mUSk7x2IMftNOZVKaQt+96HwdtP9ZJv89F
	 9VigyEtZQjo26qvaKlYE0mnULhKh+chzB3l6ToIyx5ZdHSYGTnzKZJVq01xi3ATIH3
	 YM4vE2ZBAyqAw==
Message-ID: <sashiko-outbox-219115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] kbuild: package: Install System.map to build tree only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolas Schier" <nsc@kernel.org>, =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>, "Christian
 Heusel" <christian@heusel.eu>, "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, =?utf-8?b?QWRyacOhbiBHYXJjw61hIENhc2Fk?=
 =?utf-8?b?bw==?= <adriangarciacasado42@gmail.com>
In-Reply-To: <20261116-package-install-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org>
References: <20261116-package-install-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:53:56 +0000
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
- [Medium] kbuild: package: System.map dropped from tar-pkg and dir-pkg
  in buildtar
--

commit 4e40237f8938f58bf4db63fc401e165ccfea766e
Author: Nicolas Schier <nsc@kernel.org>

kbuild: package: Install System.map to build tree only

This commit removes the target-specific installation of System.map to
/boot and instead installs System.map into the packaged kernel build tree
via scripts/package/install-extmod-build.

> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index cc87a473c01f4..057ca4fc7d71f 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -45,7 +45,6 @@ make ARCH=3D"${ARCH}" -f ${srctree}/Makefile INSTALL_MO=
D_PATH=3D"${tmpdir}" modules_
>  #
>  # Install basic kernel files
>  #
> -cp -v -- "${objtree}/System.map" "${tmpdir}/boot/System.map-${KERNELRELE=
ASE}"
>  cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
>  cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"

[Severity: Medium]
Does removing this copy drop System.map from the tar-pkg and dir-pkg
targets altogether?  Unlike PKGBUILD, builddeb, and kernel.spec, buildtar
does not package a kernel build tree or call
scripts/package/install-extmod-build, so System.map is no longer included
anywhere in the resulting tarball or directory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-package-in=
stall-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org?part=3D1
