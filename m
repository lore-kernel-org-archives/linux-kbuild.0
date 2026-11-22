Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795383308;
	b=b6n/O+2WFjCRvXf5J7cy/BlozzxPAbDPt4GdFxdBKVzEauY8v4YELqeMO+Wa5Kv4koeU
	 GWcGbAGhMs4TP7IiXWly2IAouA1L666jKjyCKCF3UERYDvAmBU5t9rrwLKBRw/CapYaz3
	 B7eu90CjsIuKvE8+0+CTIznM1tdi5+ZGl8stmEg5PlypGtw9ZiXluLGB4Gt6Ie2ST5CSF
	 2GMioNBC/kNIgMaeV3WccF9b8ZhE6H2yKJ9eos3kszpOypX4vKJWALTlJDspuhN4XBdaN
	 597rK8waZfiYGVWvcRyznr3G3zorohenUwQUkOVqU2dpcwoPxlfbRtpToIni1PI+TKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383308;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Fvq4yWfIUhDkcsJMM/78tX6imTO2aj2ozFZmQ9fqZzU=;
	b=1uX8DG5UYfmWwC/wf648TEH8GnO6u4A5viE+GFmxV087NAJ9izHZfh07czaZ29pwdNzt
	 x/psbTt0ZWVvsKsnMrlPWPJQO3JtaPqmaTiQLl1ZSmiFiCEyMN5VZhLcMq+6NcnvdzIao
	 NtQlIaHb70qJLvmNENR8a3HrgjYYIM/JrJ1NrlTPdZmcSFaAI/kKz3/wKT+PVR9yUGpBR
	 TcDFdlx8VLfBLTpAEl01tN+EwiNLclGvTp9dtbFy5H/xhNs/TO5lrEU+fFmtjswHFP8qL
	 dUSCcJCUDIXGJb2Q4ib+dvriXYdRrdDIJ7Yv7NLXecbNY48aoan5MJsMHGbS8rBaGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NumhnHiz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F505606A31A;
	Sun, 22 Nov 2026 21:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NumhnHiz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63AF1F000C0;
	Sun, 22 Nov 2026 21:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383308;
	bh=Fvq4yWfIUhDkcsJMM/78tX6imTO2aj2ozFZmQ9fqZzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NumhnHiz69+z6D9lp0yMCnaDChzyLZD5COXA7zgP1CQqVQn/Xh8PqPx+mro9CuU1e
	 HGtGVAdnP1Vg/yJPtIo/G4gQYRpBdsesLcsIEp8phHlZDqgkQXNOFjiipY/0KYv0EF
	 0bzRb+903chrkMPw3aR9kpj+a5DA0yqhCgIgh8Ef4bqD22jh/zXPoQ5pnesBWF5tTp
	 VmcaJskNsoltlm8deNuaYe5afl2SlcBz/FIkbO8h/VNIXJOChNVgdrQgo3e6A/qpol
	 afVqJMK8kkR4oBmDSS6cq/dpYB+QjA/JmBq8+k5BOpZ5yuXedll+SguMGfhu0OH/Fv
	 385IFzmhxqcaA==
Date: Sun, 22 Nov 2026 14:35:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	linux-kbuild@vger.kernel.org,
	=?iso-8859-1?Q?Adri=E1n_Garc=EDa?= Casado <adriangarciacasado42@gmail.com>
Subject: Re: [PATCH] kbuild: package: Install System.map to build tree only
Message-ID: <20261122213504.GA1454693@ax162>
References: <20261116-package-install-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org>
 <sashiko-outbox-219115@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-219115@kernel.org>

On Tue, Nov 17, 2026 at 03:53:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] kbuild: package: System.map dropped from tar-pkg and dir-pkg
>   in buildtar
> --
> 
> commit 4e40237f8938f58bf4db63fc401e165ccfea766e
> Author: Nicolas Schier <nsc@kernel.org>
> 
> kbuild: package: Install System.map to build tree only
> 
> This commit removes the target-specific installation of System.map to
> /boot and instead installs System.map into the packaged kernel build tree
> via scripts/package/install-extmod-build.
> 
> > diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> > index cc87a473c01f4..057ca4fc7d71f 100755
> > --- a/scripts/package/buildtar
> > +++ b/scripts/package/buildtar
> > @@ -45,7 +45,6 @@ make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_
> >  #
> >  # Install basic kernel files
> >  #
> > -cp -v -- "${objtree}/System.map" "${tmpdir}/boot/System.map-${KERNELRELEASE}"
> >  cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
> >  cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
> 
> [Severity: Medium]
> Does removing this copy drop System.map from the tar-pkg and dir-pkg
> targets altogether?  Unlike PKGBUILD, builddeb, and kernel.spec, buildtar
> does not package a kernel build tree or call
> scripts/package/install-extmod-build, so System.map is no longer included
> anywhere in the resulting tarball or directory.

Seems legitimate.

This got me thinking a little more about this change and I am not sure
this is actually a good direction to go in. Tying the existence of
System.map to the external module build feels wrong to me since it may
be useful for other tools and /boot/System.map-${KERNELRELEASE} is a
common place for it to be. I think we should probably leave it where it
is in the current set of packaging scripts but symlink it to the
external module build location in the places that need it. Something
like this maybe (completely untested):

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ba1defc61652..4261963a901e 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -147,6 +147,13 @@ install_kernel_headers () {
 		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
 	fi
 
+	if [ "${ARCH}" = um ] ; then
+		system_map="/usr/lib/uml/modules/${KERNELRELEASE}/System.map"
+	else
+		system_map="/boot/System.map-${KERNELRELEASE}"
+	fi
+	ln -s "${system_map}" "${pdir}/usr/src/linux-headers-${version}/System.map"
+
 	mkdir -p $pdir/lib/modules/$version/
 	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
 }
diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 8f0933cbbe45..3add2b2c7dd2 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -122,6 +122,7 @@ fi
 ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEASE}/build
 %if %{with_devel}
 %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
+ln -fns /lib/modules/%{KERNELRELEASE}/System.map %{buildroot}/usr/src/kernels/%{KERNELRELEASE}/System.map
 %endif
 
 {
-- 
Cheers,
Nathan
