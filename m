Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450094;
	b=Fq0YzU6rSpLqNXB4JnA9Qn7TrJ39B/+teiJ5hMKGm+POR16PzYA/vtNkK1a2/IC1Nflq
	 VBP6975JQDmxXM5rBs5lSoWACf0h+kGdT5ojSv1XonxB+KL8hwq/wHl2T0k92Y0OP+I1x
	 I3T7tmvE/dWRAQi+AWYGQfmRMxbIn2RcnUqAd8UWbVS3z9b1xWc5Z4861v1ArfCocaSZH
	 /VKD6z1l/89W+3Gkz5tqzrdFxszGKcjLwyAz098z6+svjVYoR3HA5HE0YuOo/PkoM1sRL
	 RP8ItPx/whQk8CL9/ulkT7eGpW+RwWJ4dQ9gUJl1GUVWz4pSQhrP/JHHEiZMUa3kLfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450094;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FtTfCAP+uj6SKc3h12JbdbROUwV3iVgdUmum2yJZR/g=;
	b=MmeoyO8p5Mr2Kl0Q8ftqwJR9kUjRFuHVq4ub/TB/ANXpWHbdpX2HoMmxbge2mzlFSJhg
	 aX6mMheknGx3Tv/SAygidSriKLto+lG1c1DuHOrV9ECSCSD3tO7F5IOlxqzKlQ+6CRODT
	 lafBjy83lux94Bwq2KN7tfszhrWD2iMjRJAmN/tJs+ydm8VkhKArEDNtfenChRPWVbF8n
	 m2S894N2EAbqM5UcvQK1WJRnaz4awSSe7ZJHhcsiTs/0HiN3AxBM38KUfEKOSiSI7tV8d
	 J/5dp08zcZVqzCOlaQaIHESTluUy2GoyUaZcao7CvrDHQfxUu91t8V7KLqSVhqPhNNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4NNxdfv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 2F7DB606A31E;
	Mon, 23 Nov 2026 16:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4NNxdfv
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2EC511F000C6;
	Mon, 23 Nov 2026 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450093;
	bh=FtTfCAP+uj6SKc3h12JbdbROUwV3iVgdUmum2yJZR/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c4NNxdfvlB0XPUghwPq2l4p7IE5n1jmftxzenMABCroEcnV9uh+vqYtAWlckYqgUr
	 9G3LyVFzUGIR83ExDipW/cvClfFi+1Fez4WIIvw1amtgevi/mKmIXjV2X0jgh+dzIM
	 SsgIDRKOu2sb02HReaCai2DjKrwmt2awCORo5kFKQDa7Gu5VPIzl89ioeqPGhcinCj
	 ZzdHdfawCR0U8maLPhLmv9/oclSkpBeB3rtGwFyfDrabWY1maDUjtCq2aehfQOimRf
	 LipTpJcjXsGZuA+M2hiLUsOgoFlsd5zTzl2M9LwqzLYBATN1RyHG8YOk65pVV90lO8
	 fpDRV4+c6tFzQ==
Date: Mon, 23 Nov 2026 16:58:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	linux-kbuild@vger.kernel.org,
	=?iso-8859-1?Q?Adri=E1n_Garc=EDa?= Casado <adriangarciacasado42@gmail.com>
Subject: Re: [PATCH] kbuild: package: Install System.map to build tree only
Message-ID: <awRijCPFYK4J5L6C@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	sashiko-reviews@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	linux-kbuild@vger.kernel.org,
	=?iso-8859-1?Q?Adri=E1n_Garc=EDa?= Casado <adriangarciacasado42@gmail.com>
References: <20261116-package-install-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org>
 <sashiko-outbox-219115@kernel.org>
 <20261122213504.GA1454693@ax162>
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
In-Reply-To: <20261122213504.GA1454693@ax162>

On Sun, Nov 22, 2026 at 02:35:04PM -0700, Nathan Chancellor wrote:
> On Tue, Nov 17, 2026 at 03:53:56PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Medium] kbuild: package: System.map dropped from tar-pkg and dir-pkg
> >   in buildtar
> > --
> > 
> > commit 4e40237f8938f58bf4db63fc401e165ccfea766e
> > Author: Nicolas Schier <nsc@kernel.org>
> > 
> > kbuild: package: Install System.map to build tree only
> > 
> > This commit removes the target-specific installation of System.map to
> > /boot and instead installs System.map into the packaged kernel build tree
> > via scripts/package/install-extmod-build.
> > 
> > > diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> > > index cc87a473c01f4..057ca4fc7d71f 100755
> > > --- a/scripts/package/buildtar
> > > +++ b/scripts/package/buildtar
> > > @@ -45,7 +45,6 @@ make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_
> > >  #
> > >  # Install basic kernel files
> > >  #
> > > -cp -v -- "${objtree}/System.map" "${tmpdir}/boot/System.map-${KERNELRELEASE}"
> > >  cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
> > >  cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
> > 
> > [Severity: Medium]
> > Does removing this copy drop System.map from the tar-pkg and dir-pkg
> > targets altogether?  Unlike PKGBUILD, builddeb, and kernel.spec, buildtar
> > does not package a kernel build tree or call
> > scripts/package/install-extmod-build, so System.map is no longer included
> > anywhere in the resulting tarball or directory.
> 
> Seems legitimate.
> 
> This got me thinking a little more about this change and I am not sure
> this is actually a good direction to go in. Tying the existence of
> System.map to the external module build feels wrong to me since it may
> be useful for other tools and /boot/System.map-${KERNELRELEASE} is a
> common place for it to be. I think we should probably leave it where it
> is in the current set of packaging scripts but symlink it to the
> external module build location in the places that need it.

As Distros are moving everything to /usr/ -- but I haven't seen
/usr/boot/ anywhere -- I'd prefer to move it away from /boot.  The
kmod build tree looks like the native location to me (as per
scripts/depmod.sh) and from what I can find, most debugging tools use
vmlinux or /proc/kallsyms rather than System.map; but I have never ever
tried to debug a Linux without the full source + build tree at hand.

Does System.map still help with regular debugging with CONFIG_KASLR
enabled?

If it wasn't for 'depmod -e' I'd like to put System.map to the
linux-image-${KVER}-dbg_*.deb, as Debian does.


> Something
> like this maybe (completely untested):
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index ba1defc61652..4261963a901e 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -147,6 +147,13 @@ install_kernel_headers () {
>  		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
>  	fi
>  
> +	if [ "${ARCH}" = um ] ; then
> +		system_map="/usr/lib/uml/modules/${KERNELRELEASE}/System.map"
> +	else
> +		system_map="/boot/System.map-${KERNELRELEASE}"
> +	fi
> +	ln -s "${system_map}" "${pdir}/usr/src/linux-headers-${version}/System.map"
> +

What about doing it the other way round?  We could provide the symlink
in the old /boot/ location for now and move System.map to the module
build tree?



>  	mkdir -p $pdir/lib/modules/$version/
>  	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
>  }
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 8f0933cbbe45..3add2b2c7dd2 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -122,6 +122,7 @@ fi
>  ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEASE}/build
>  %if %{with_devel}
>  %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
> +ln -fns /lib/modules/%{KERNELRELEASE}/System.map %{buildroot}/usr/src/kernels/%{KERNELRELEASE}/System.map

Looking at line 122 (start of hunk), /lib/modules/%{KERNELRELEASE} seems to be a symlink to
/lib/modules/%{KERNELRELEASE}/build/, thus that line will would create a
funny symlink. ;)


-- 
Nicolas
