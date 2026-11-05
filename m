Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920188;
	b=U9f6gTEX59+qKN+577acvqwWWYGErPaawwmgHb7wDuWGhvKV0+fdhLYmcEc1z+AYXfAM
	 Pamq5MQ7rMb/0M0gNxft1TNU6TDutfJpF0Hm7NvCR0uH2nVQBgKViWRZMA6NDwgtjnGOg
	 Y8mUa6K5wlcO1TyiqK4sR/E6azPZsf5VjxjB+DoH+bn8/jR2dP4+KSuZqWtMdcKi4zv6w
	 i8KKbkpsrQ+v/g2Vvb8PvvF/hM158mkOwkRABtXMycZUfbxJKJrr+6hpxmpDbS17HVe3J
	 FP14v8FL6fvHX7vyfu2Oh1+3x05V+3KmtClYusppTHqYi15Wd3+IMvfO3xSxecLk4Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920188;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SFi/9514lpyW9UumdIrGJf68gDgaQBEfNBDXQ60K0Vo=;
	b=wqsTiHpiG1Sng4S14yDoGCVEsI+5P4uf5krVtW4ebopNGb0qdNekmuIMe+JKiDtemF6f
	 NvMVn8zgj0pByMQcUmw3I1WQhUtp8/MTGPiC7f7nJPQ/XVBz1efHQxrO+CZzPUObC2VNc
	 xg1v11BAGNJmZDQqfOqEHejfeyqI2IWQPWes3OWPDbSz6CWUD/toAReadpFHxmNMIbN50
	 w1dOkr8hVIvDNGZQ+OiDEeBcA287+DkGMrW0ZMdl+bU74Ozp/67XevEs0kiWj/hkTF++i
	 4SAQT7668p/b1sPEjt26ViIHm/fKTBb5tObg0ofxZCAgLdEd1wtPUh02xfG5U4yhn/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8JhxHLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2797E606A326;
	Thu,  5 Nov 2026 23:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8JhxHLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E906C1F0089F;
	Thu,  5 Nov 2026 23:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793920188;
	bh=SFi/9514lpyW9UumdIrGJf68gDgaQBEfNBDXQ60K0Vo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=k8JhxHLxNSFThvj/1zq9kfFboXP/SEz/ozn/IdP66Cvs2dtC/eEHexxSnNCwIHYJA
	 3J99Wr058Fy6v1faKScBFr3TAc5c/FKciFFr4H83iLZ/NPF3N0yGOTjOxEfwdJYA+K
	 NVxV80pkOo62cvoGFX1QeeGdLDQVPZmvYD+WBCloLdxLkegSK7zRFbjQSuyamCehx+
	 TNOr2H+qffZGonoWk5JMnhOdPVliG0ruQVLS3tciivcp732SfLzH4fTSniiB7Y+ZN/
	 JYroG6oIJ0AbL/mQE2wHbujJufddH0YSjtSRQDlXG9w9Wj+DWYWy22TYsQq+zrLayt
	 asW+bRqAEvVfg==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] kbuild: depmod: fallback to
 /boot/System.map-KERNELRELEASE
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: =?utf-8?q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261016-lyrical-original-woodlouse-3cfb2c@l-nschier-aarch64>
References: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
 <20261016-lyrical-original-woodlouse-3cfb2c@l-nschier-aarch64>
Date: Thu, 05 Nov 2026 16:09:42 -0700
Message-Id: <179392018201.309869.11526061626002654500.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3428; i=nathan@kernel.org;
 h=from:subject:message-id; bh=CkdP0q0YRWAymP0WCs5uruWG0xQDJ9HonGRg+VqVcow=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlvebZZ6x/ROcoV+omxwVPXnq1i2+nwC8czV9xkkCx55
 nswb1lNRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjI/eWMDBP/WL/dNvGgiNtT
 Kfvc3GPfVGufN12w9zh0WEqjJvbW/zSGfzaaV+8qfDxwXfLBmr9i+txa77nXNv6c+DtyzkS2z6W
 hLFwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On 2026-10-16 16:22 +0200, Nicolas Schier wrote:
> On Fri, Oct 16, 2026 at 01:11:06PM +0200, Adrián García Casado wrote:
> > When installing external modules (M=...) against packaged kernel headers
> > such as linux-headers built via 'make bindeb-pkg', ${objtree}/System.map
> > is absent because System.map is located in:
> > /boot/System.map-${KERNELRELEASE}
> > 
> > Currently, scripts/depmod.sh only checks ${objtree}/System.map and skips
> > running depmod with a warning, leaving newly installed out-of-tree
> > modules unindexed in modules.dep.
> > 
> > Fall back to ${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE} when
> > ${objtree}/System.map is not readable so that depmod runs properly
> > during external module installation.
> > 
> > Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
> > ---
> >  scripts/depmod.sh | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/scripts/depmod.sh b/scripts/depmod.sh
> > index 3c34fecac..d6d1b9547 100755
> > --- a/scripts/depmod.sh
> > +++ b/scripts/depmod.sh
> > @@ -12,9 +12,14 @@ KERNELRELEASE=$1
> >  
> >  : ${DEPMOD:=depmod}
> >  
> > -if ! test -r "${objtree}/System.map" ; then
> > -	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
> > -	exit 0
> > +system_map="${objtree}/System.map"
> > +if ! test -r "${system_map}" ; then
> > +	if test -r "${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}" ; then
> > +		system_map="${INSTALL_MOD_PATH}/boot/System.map-${KERNELRELEASE}"
> > +	else
> > +		echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
> > +		exit 0
> > +	fi
> >  fi
> >  
> >  # legacy behavior: "depmod" in /sbin, no /sbin in PATH
> > @@ -25,7 +30,7 @@ if [ -z $(command -v $DEPMOD) ]; then
> >  	exit 0
> >  fi
> >  
> > -set -- -ae -F "${objtree}/System.map"
> > +set -- -ae -F "${system_map}"
> >  if test -n "$INSTALL_MOD_PATH"; then
> >  	set -- "$@" -b "$INSTALL_MOD_PATH"
> >  fi
> > -- 
> > 2.39.5
> > 
> 
> Thanks for report and patch.
> 
> For the record, this is what I can find in Debian's Linux packages:
> 
> Debian puts a dummy System.map to /lib/modules/$(KERNELVER)/System.map 
> (linux-image-$(KVER)-$(DEBVER)-$(ARCH).deb) and the real System.map is 
> only available in linux-image-$(KVER)-$(DEBVER)-$(ARCH)-dbg package 
> at /usr/lib/debug/lib/modules/$(KVER)-$(ARCH)/System.map.
> 
> So, do we need a valid System.map for out-of-tree modules?

Yeah, how does this work for the main Debian packages? Do they just not
expecte modules.dep to be generated for external modules if System.map
is not in a standard location? Or maybe nobody cares?

> At a first glance, you patch looks good to me.  But lets way some days 
> for other feedback.

I don't have a particular opinion on this patch other than maybe this is
being patched in the wrong place? Perhaps we should be fixing this in
scripts/package/install-extmod-build? scripts/package/PKGBUILD copies
System.map to its external module build folder already.
scripts/package/kernel.spec copies it to /lib/modules/<rel>, not
/lib/modules/<rel>/build. Unifying those in in install-extmod-build
would avoid having to change it here (since /boot/System.map-<rel> seems
like a Debian-ism that we are hard coding here). I trust your judgement
though.

-- 
Cheers,
Nathan

