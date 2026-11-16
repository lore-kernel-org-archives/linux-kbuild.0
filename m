Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845878;
	b=J2MHuWpVwgskK5ciD+uz/Qja06gpPRYLC6Ib9vq+fTJ8yDpUmDi4WZhA0rV6f1NbJJQr
	 nhZlWKKgAmCvUsNSNHSuPeE4wjYrI5Y6sjW2sY5wZSSqgoojrIAaYLj4I5YF1DfqERjnS
	 O+QAfchBqR0IaPh5MO63KRuP+faPNGt1chxXtxnU0fowFgXjlEytEFcbEujsRJVMUkmgw
	 euihWfPJNqbg11jBVGJgdZwB04/3u4cgQqHY9rwXSVEBtnZy+F+l5WUrEJxiCO68dxdUo
	 Ja2WmBKFQ2ldML7SmctLmh2smCPNSxpfWLwuzU+fj/e5tVg/BcF29G8feGSnuF7Xg3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845878;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=SfYOB7Ty0pCYb2nC1eyV5BC3WSCxR60P35W/OeXWh3U=;
	b=4yzekDj9oMoT5dyNpDhwtESES1JQl1Wqu4ov8S2j6MzwHSjOPcVbRY7BviocERhLjaTx
	 iQuW6sKy74w1isdETuM/8//+aE+Jw/ou743bCJgd9ciWtF8uaPfO7k6WKxbkuTpbL27JP
	 isksTSLZ7zGtPR8EiEi3pUnBrhTH8jpq9JVgQ3xBjDhoUTG5L4bQ8r9DGbrmldHIgVQQL
	 oR4S5mVqnesVYRvSEjKJxAfol4E9mWqcx/LEDlX5NfES8gkmsya3dzOHrhzDvit3tSM4a
	 /z4XL/tOiVnxj4OBvOFC3KQZdcz++4GffYpKGbySOghOYPuSgjPInx6tMtXBLQjJYrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8wTJ9qX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id EA58E606A323;
	Mon, 16 Nov 2026 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8wTJ9qX
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 151021F000C4;
	Mon, 16 Nov 2026 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794845877;
	bh=SfYOB7Ty0pCYb2nC1eyV5BC3WSCxR60P35W/OeXWh3U=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=k8wTJ9qXMAYMMp8fVdyY3tzE5G50vfQuLllT96f9g52tkvYXnS0wOxGXYjR1YZLfm
	 wAEBSF8wKSjOfzZqrkXw9Mx6TbsxxLC8gNJum08TR6/dEm9iWReHUzVDWPMFIDEocf
	 AAgiey7T+49cDMcQ0uYToMOrgrF/wkZPsxYAsGFAdEBKZRCqZaO01/ehK/AxEgITPU
	 6/qDSQnOwbVBBjsK3Fa60WORGs3Ei5cYvZ+Rfh81ewgPbUJOS5Z+iNJQPblCaVxXWe
	 149SmnehwEskp749QBDUFVzLKi9JnwQ4Bw283pOeuX3AecK9nUq1PG0pYkmHF2LpxP
	 876PVCjuGUEvw==
Date: Mon, 16 Nov 2026 17:15:08 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	=?iso-8859-1?Q?Adri=E1n_Garc=EDa?= Casado <adriangarciacasado42@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: depmod: fallback to
 /boot/System.map-KERNELRELEASE
Message-ID: <avssDBUtw0dhlpKT@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	=?iso-8859-1?Q?Adri=E1n_Garc=EDa?= Casado <adriangarciacasado42@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
 <20261016-lyrical-original-woodlouse-3cfb2c@l-nschier-aarch64>
 <179392018201.309869.11526061626002654500.b4-reply@b4>
 <aviwMdFX5CpBfB0Y@levanger>
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
In-Reply-To: <aviwMdFX5CpBfB0Y@levanger>

On Sat, Nov 14, 2026 at 08:02:09PM +0100, Nicolas Schier wrote:
> On Thu, Nov 05, 2026 at 04:09:42PM -0700, Nathan Chancellor wrote:
> > On 2026-10-16 16:22 +0200, Nicolas Schier wrote:
> > > On Fri, Oct 16, 2026 at 01:11:06PM +0200, Adrián García Casado wrote:
> > > > When installing external modules (M=...) against packaged kernel headers
> > > > such as linux-headers built via 'make bindeb-pkg', ${objtree}/System.map
> > > > is absent because System.map is located in:
> > > > /boot/System.map-${KERNELRELEASE}
> > > > 
> > > > Currently, scripts/depmod.sh only checks ${objtree}/System.map and skips
> > > > running depmod with a warning, leaving newly installed out-of-tree
> > > > modules unindexed in modules.dep.
> > > > 
> > > > Fall back to ${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE} when
> > > > ${objtree}/System.map is not readable so that depmod runs properly
> > > > during external module installation.
> > > > 
> > > > Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
> > > > ---
> > > >  scripts/depmod.sh | 13 +++++++++----
> > > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/scripts/depmod.sh b/scripts/depmod.sh
> > > > index 3c34fecac..d6d1b9547 100755
> > > > --- a/scripts/depmod.sh
> > > > +++ b/scripts/depmod.sh
> > > > @@ -12,9 +12,14 @@ KERNELRELEASE=$1
> > > >  
> > > >  : ${DEPMOD:=depmod}
> > > >  
> > > > -if ! test -r "${objtree}/System.map" ; then
> > > > -	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
> > > > -	exit 0
> > > > +system_map="${objtree}/System.map"
> > > > +if ! test -r "${system_map}" ; then
> > > > +	if test -r "${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}" ; then
> > > > +		system_map="${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}"
> > > > +	else
> > > > +		echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
> > > > +		exit 0
> > > > +	fi
> > > >  fi
> > > >  
> > > >  # legacy behavior: "depmod" in /sbin, no /sbin in PATH
> > > > @@ -25,7 +30,7 @@ if [ -z $(command -v $DEPMOD) ]; then
> > > >  	exit 0
> > > >  fi
> > > >  
> > > > -set -- -ae -F "${objtree}/System.map"
> > > > +set -- -ae -F "${system_map}"
> > > >  if test -n "$INSTALL_MOD_PATH"; then
> > > >  	set -- "$@" -b "$INSTALL_MOD_PATH"
> > > >  fi
> > > > -- 
> > > > 2.39.5
> > > > 
> > > 
> > > Thanks for report and patch.
> > > 
> > > For the record, this is what I can find in Debian's Linux packages:
> > > 
> > > Debian puts a dummy System.map to /lib/modules/$(KERNELVER)/System.map 
> > > (linux-image-$(KVER)-$(DEBVER)-$(ARCH).deb) and the real System.map is 
> > > only available in linux-image-$(KVER)-$(DEBVER)-$(ARCH)-dbg package 
> > > at /usr/lib/debug/lib/modules/$(KVER)-$(ARCH)/System.map.
> > > 
> > > So, do we need a valid System.map for out-of-tree modules?
> > 
> > Yeah, how does this work for the main Debian packages? Do they just not
> > expecte modules.dep to be generated for external modules if System.map
> > is not in a standard location? Or maybe nobody cares?
> 
> Supplying '-F ../path/to/System.map -e' to depmod enables checking all
> installed modules for unresolved symbols.  The in-tree scripts/depmod.sh
> wrapper script always adds '-e -F ${objtree}/System.map', or fails if
> System.map is not there (cp. report above).  Debian installs a dummy
> /boot/System.map-${KVER}, but that will not be used automatically by
> anything (as far as I can see).
> 
> Thus, AFAIK System.map is required only for checking against unresolved
> symbols in the just installed kernel modules, whether they are built
> in-tree or out-of-tree.
> 
> > > At a first glance, you patch looks good to me.  But lets way some days 
> > > for other feedback.
> > 
> > I don't have a particular opinion on this patch other than maybe this is
> > being patched in the wrong place? Perhaps we should be fixing this in
> > scripts/package/install-extmod-build? scripts/package/PKGBUILD copies
> > System.map to its external module build folder already.
> > scripts/package/kernel.spec copies it to /lib/modules/<rel>, not
> > /lib/modules/<rel>/build. Unifying those in in install-extmod-build
> > would avoid having to change it here (since /boot/System.map-<rel> seems
> > like a Debian-ism that we are hard coding here). I trust your judgement
> > though.
> 
> Yeah, I think you're right: we should fix in install-extmod-build and
> unify the install for all packaging targets by putting System.map to the
> build directory, as that's where scripts/depmod.sh expects to find it.
> 
> I am preparing a patch for that.

https://lore.kernel.org/linux-kbuild/20261116-package-install-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org/

-- 
Nicolas
