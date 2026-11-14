Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682958;
	b=t/BCl8AqRD3ob1xgSxeOi7rbiEsmeWJSkYrDasvkMWe88NDbrkt4+rfYiKc4zYLHaPAC
	 uNpnxUFXDIYxswVhCawB1EXfkrbosnkGZJCzzp1UZ3hIBgLC4t24unMX3JfsIp7VOSWTG
	 e6vHUGGHhxq7+vorUMcjzP2yafKL6/QYuwAvYyQj1rYKyBFtfDo0MZ/YKC/G7N19wbgk2
	 sS+nt02IAhbJINXJHaotIh7d6bAX+hZehiuEetGIwYrLlfkkWYOVR27zbhH+xGZJffOfs
	 F8tIbzkvRN1qT9PH0CYLR2I4KPure9Z/vLeMwnDLf6ckrbqJvM1cCRuYAMn7DpdZbnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682958;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=IrA16pSRjyjc9pdru+9oO56IkBoLOh4h6uxCuoJG8KY=;
	b=Uu4cF9KrgxSXrABIv0yqIO9gwtYnV+kaRATptKbMJO+W5q6LUfANoDvqRAwzrE5JQwtp
	 lJ7/iwOmrYjCsATdZYXH8RU2zqsTUzRQMKJBym0PAls3B3a8a1PrsPWvsv4+N75vj6IMg
	 OOPlTvAOaqCtl5y4ejS4VEqRJ9IlXScH18zXSW6WHAz5m0E5gfAKeAqZXM3bjI5qbKT+n
	 u5VRlWWOVHfi/59XrzDO/XL+CBgCS4mIP3YbcwFVQOYobt5DfSJDcZ1dpBj1a3NascWdF
	 o1a2cFZvVduRXGySnmh1XtIZNvrg4INI77Lj5L8npT0AXLV7BenHnbBajPAg/JuTDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuwIE8Lw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4F052606A887;
	Sat, 14 Nov 2026 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuwIE8Lw
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7B5251F000C4;
	Sat, 14 Nov 2026 19:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794682958;
	bh=IrA16pSRjyjc9pdru+9oO56IkBoLOh4h6uxCuoJG8KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OuwIE8Lw4NMGx/GpWugWuMuALFAo9gDIDLSECCmRs7weKUB7W/8lF1sm7Vtc5Zz7h
	 xO5dl2TGKNxCAE4mQ7MgBTweoGzQCVP2X7Dwa+XTi4OZy8PS5cWElmv0S7G4xJU7uY
	 4vnGlL8j1V6wEQ53omqIeld4byrUbChxsPJSY7FRoX0ckWVtEdOmOdplwvqmoDMf6P
	 EnWuf6iTQaOgQgp3qIP8vMHB2RuS9gJFsSv/7WRQQGA2et43tY5/oiPa9t9vC7USYi
	 ojHJRNwwIEpJ/v2nedw82QsVHWoSTB6kYMOSgk7vd8xNUCQEDZPg0aQx6NYppSfbca
	 x586xng328Xqg==
Date: Sat, 14 Nov 2026 20:02:09 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?iso-8859-1?Q?Adri=E1n_Garc=EDa?= Casado <adriangarciacasado42@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	n.schier@fritz.com
Subject: Re: [PATCH] kbuild: depmod: fallback to
 /boot/System.map-KERNELRELEASE
Message-ID: <aviwMdFX5CpBfB0Y@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	=?iso-8859-1?Q?Adri=E1n_Garc=EDa?= Casado <adriangarciacasado42@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
 <20261016-lyrical-original-woodlouse-3cfb2c@l-nschier-aarch64>
 <179392018201.309869.11526061626002654500.b4-reply@b4>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179392018201.309869.11526061626002654500.b4-reply@b4>

On Thu, Nov 05, 2026 at 04:09:42PM -0700, Nathan Chancellor wrote:
> On 2026-10-16 16:22 +0200, Nicolas Schier wrote:
> > On Fri, Oct 16, 2026 at 01:11:06PM +0200, Adrián García Casado wrote:
> > > When installing external modules (M=...) against packaged kernel headers
> > > such as linux-headers built via 'make bindeb-pkg', ${objtree}/System.map
> > > is absent because System.map is located in:
> > > /boot/System.map-${KERNELRELEASE}
> > > 
> > > Currently, scripts/depmod.sh only checks ${objtree}/System.map and skips
> > > running depmod with a warning, leaving newly installed out-of-tree
> > > modules unindexed in modules.dep.
> > > 
> > > Fall back to ${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE} when
> > > ${objtree}/System.map is not readable so that depmod runs properly
> > > during external module installation.
> > > 
> > > Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
> > > ---
> > >  scripts/depmod.sh | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/scripts/depmod.sh b/scripts/depmod.sh
> > > index 3c34fecac..d6d1b9547 100755
> > > --- a/scripts/depmod.sh
> > > +++ b/scripts/depmod.sh
> > > @@ -12,9 +12,14 @@ KERNELRELEASE=$1
> > >  
> > >  : ${DEPMOD:=depmod}
> > >  
> > > -if ! test -r "${objtree}/System.map" ; then
> > > -	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
> > > -	exit 0
> > > +system_map="${objtree}/System.map"
> > > +if ! test -r "${system_map}" ; then
> > > +	if test -r "${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}" ; then
> > > +		system_map="${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}"
> > > +	else
> > > +		echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
> > > +		exit 0
> > > +	fi
> > >  fi
> > >  
> > >  # legacy behavior: "depmod" in /sbin, no /sbin in PATH
> > > @@ -25,7 +30,7 @@ if [ -z $(command -v $DEPMOD) ]; then
> > >  	exit 0
> > >  fi
> > >  
> > > -set -- -ae -F "${objtree}/System.map"
> > > +set -- -ae -F "${system_map}"
> > >  if test -n "$INSTALL_MOD_PATH"; then
> > >  	set -- "$@" -b "$INSTALL_MOD_PATH"
> > >  fi
> > > -- 
> > > 2.39.5
> > > 
> > 
> > Thanks for report and patch.
> > 
> > For the record, this is what I can find in Debian's Linux packages:
> > 
> > Debian puts a dummy System.map to /lib/modules/$(KERNELVER)/System.map 
> > (linux-image-$(KVER)-$(DEBVER)-$(ARCH).deb) and the real System.map is 
> > only available in linux-image-$(KVER)-$(DEBVER)-$(ARCH)-dbg package 
> > at /usr/lib/debug/lib/modules/$(KVER)-$(ARCH)/System.map.
> > 
> > So, do we need a valid System.map for out-of-tree modules?
> 
> Yeah, how does this work for the main Debian packages? Do they just not
> expecte modules.dep to be generated for external modules if System.map
> is not in a standard location? Or maybe nobody cares?

Supplying '-F ../path/to/System.map -e' to depmod enables checking all
installed modules for unresolved symbols.  The in-tree scripts/depmod.sh
wrapper script always adds '-e -F ${objtree}/System.map', or fails if
System.map is not there (cp. report above).  Debian installs a dummy
/boot/System.map-${KVER}, but that will not be used automatically by
anything (as far as I can see).

Thus, AFAIK System.map is required only for checking against unresolved
symbols in the just installed kernel modules, whether they are built
in-tree or out-of-tree.

> > At a first glance, you patch looks good to me.  But lets way some days 
> > for other feedback.
> 
> I don't have a particular opinion on this patch other than maybe this is
> being patched in the wrong place? Perhaps we should be fixing this in
> scripts/package/install-extmod-build? scripts/package/PKGBUILD copies
> System.map to its external module build folder already.
> scripts/package/kernel.spec copies it to /lib/modules/<rel>, not
> /lib/modules/<rel>/build. Unifying those in in install-extmod-build
> would avoid having to change it here (since /boot/System.map-<rel> seems
> like a Debian-ism that we are hard coding here). I trust your judgement
> though.

Yeah, I think you're right: we should fix in install-extmod-build and
unify the install for all packaging targets by putting System.map to the
build directory, as that's where scripts/depmod.sh expects to find it.

I am preparing a patch for that.

Thanks!


-- 
Nicolas
