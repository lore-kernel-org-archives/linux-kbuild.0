Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489409;
	b=gSjxsVBhBlOuApgdhxUKrMEHCkW0bcbYKuJTk2M0zZRBByJhm411nW69M5sOrmc2H2rQ
	 5LL13s8NqSi31EjDpWy7y/ZjsZU+FKozV1I1BCln3E0NOB+3q/1kT8/ZN10PEGG7D7cst
	 vK0ohzGPM1NS0RR/u9440aBrJdurSyDqVKYfOHDJXtcph4uqP9TQEehNDQknEpq+yQvMj
	 aT+Pcy5oPtXjFTvwPf7iNQtFf60eGeHhzrQQwefoQxSlwI6KqQ9KQfQAmQx2xlL12xMzk
	 SeiwKzZdR+ef64hquwKL3Xgwf5ubS0wpistJj5NxCTG/qgPwq/76MfKrJvm8tfVB1IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489409;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=U71fuT0AOwlbjkzcDhiaqPhe344VAjXFS0XIiFa4Hn0=;
	b=0nrydi4xrg/kiCjuTbfuXgD0NommI4msh0svIitGjeLDrMtfqL8djepilzHaF38F+TVG
	 /eW9YY3k4KYYxd1nHYnj3qA18a7EYoUof2wYBwYrPZrLKZk1T6lxeMA6hIfR32aFf93Ir
	 9uYf2rxtYmm12rTiY6AfHpYEXWDcRkiZHSb54yhldRKsJFJ7Wv3kBKvA9p9Z/oKrKgIjE
	 i+jznbvwhF1CbC5kpKKcKw/6+/H5AaVlwArI3VUpMEE5vI47eigjVjE/lJjXG6FoWS3mn
	 9XrzAXTvW3Ckzwu97BpvBBilSsNB5qvZlhJ1YAwLWd3mToDS/gO3PWG8xGnsvEAFqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kucAM0BC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A36606A31E;
	Tue, 24 Nov 2026 03:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kucAM0BC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A795A1F000C6;
	Tue, 24 Nov 2026 03:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795489408;
	bh=U71fuT0AOwlbjkzcDhiaqPhe344VAjXFS0XIiFa4Hn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kucAM0BChNxQkOo9X+Q/ZmLqlgQq1hfmOvR+a6c48cZlIu9s498xVi34k3X34Lo44
	 ukUgbxPzFPm7/jvQEG3Wk46dbbXgeCZxh+neAQ8zZfBjHlZDIxLyvIVibHAZIx2JJx
	 pr+5Vpsv94Z/mSOfO06M8kgONqQl1HkMMNHrnuiJrvZ2vdDYCFfN7FVW3lyCeK2BH1
	 //H/KR1IH8A6by1BBKr/Z0yuKBqousyCGUE138yjOC6dEuFdRNg/ZGzQ6Uy/4n2z35
	 fCtlkFZaCyoAENiY7CZOcJzC9++WcSv2Su2uFyCqgzpBLI5Wtn1SL5bg6bGxM1axFZ
	 lfl2l+1V0fPPg==
Date: Mon, 23 Nov 2026 20:03:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	linux-kbuild@vger.kernel.org,
	=?iso-8859-1?Q?Adri=E1n_Garc=EDa?= Casado <adriangarciacasado42@gmail.com>
Subject: Re: [PATCH] kbuild: package: Install System.map to build tree only
Message-ID: <20261124030324.GA2247258@ax162>
References: <20261116-package-install-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org>
 <sashiko-outbox-219115@kernel.org>
 <20261122213504.GA1454693@ax162>
 <awRijCPFYK4J5L6C@levanger>
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
In-Reply-To: <awRijCPFYK4J5L6C@levanger>

On Mon, Nov 23, 2026 at 04:58:04PM +0100, Nicolas Schier wrote:
> As Distros are moving everything to /usr/ -- but I haven't seen
> /usr/boot/ anywhere -- I'd prefer to move it away from /boot.  The
> kmod build tree looks like the native location to me (as per
> scripts/depmod.sh) and from what I can find, most debugging tools use
> vmlinux or /proc/kallsyms rather than System.map; but I have never ever
> tried to debug a Linux without the full source + build tree at hand.

I guess we could try it and see who complains about the new location.

I am just not sure that we should treat scripts/depmod.sh expecting
System.map in the build folder as anything more than "external modules
won't have dependencies generated properly" (which is more of a missing
feature than a true bug) than "System.map does not belong in /boot" but
I don't have a really strong opinion here.

> Does System.map still help with regular debugging with CONFIG_KASLR
> enabled?

I think for debugging, you would want KASLR off?

> If it wasn't for 'depmod -e' I'd like to put System.map to the
> linux-image-${KVER}-dbg_*.deb, as Debian does.
> 
> 
> > Something
> > like this maybe (completely untested):
> > 
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index ba1defc61652..4261963a901e 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -147,6 +147,13 @@ install_kernel_headers () {
> >  		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
> >  	fi
> >  
> > +	if [ "${ARCH}" = um ] ; then
> > +		system_map="/usr/lib/uml/modules/${KERNELRELEASE}/System.map"
> > +	else
> > +		system_map="/boot/System.map-${KERNELRELEASE}"
> > +	fi
> > +	ln -s "${system_map}" "${pdir}/usr/src/linux-headers-${version}/System.map"
> > +
> 
> What about doing it the other way round?  We could provide the symlink
> in the old /boot/ location for now and move System.map to the module
> build tree?

We would have to make sure that this location was available without
CONFIG_MODULES but that wouldn't be a bad option either.

> >  	mkdir -p $pdir/lib/modules/$version/
> >  	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
> >  }
> > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> > index 8f0933cbbe45..3add2b2c7dd2 100644
> > --- a/scripts/package/kernel.spec
> > +++ b/scripts/package/kernel.spec
> > @@ -122,6 +122,7 @@ fi
> >  ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEASE}/build
> >  %if %{with_devel}
> >  %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
> > +ln -fns /lib/modules/%{KERNELRELEASE}/System.map %{buildroot}/usr/src/kernels/%{KERNELRELEASE}/System.map
> 
> Looking at line 122 (start of hunk), /lib/modules/%{KERNELRELEASE} seems to be a symlink to
> /lib/modules/%{KERNELRELEASE}/build/, thus that line will would create a
> funny symlink. ;)

/lib/modules/%{KERNELRELEASE} is a folder created at the beginning of
the %install stage. /lib/modules/%{KERNELRELEASE}/System.map is where it
is installed during this stage, so symlinking it to
/usr/src/kernels/%{KERNELRELEASE}/System.map should make it appear at
/lib/modules/%{KERNELRELEASE}/build/System.map as expected.

But as I mentioned above, I am totally fine with going the other way.

-- 
Cheers,
Nathan
