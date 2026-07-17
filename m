Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC5E42E8D5;
	Fri, 17 Jul 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301932; cv=none; b=keQbttE7a0BBGO6kKn3bdyl1ViUFd6/EuQ6GwoBkElxfoagr9zxo+GsGg9mXQZFpQCqNP1ovn6Y5Eg5JkX0B+zQLXXr3KQpTB3sPtaTd/S6Nl12zjbkYOvPMOdn0/JTnZ52i83QeGLWgTQ7Z7Xub/wdpVbZOTERzfKmSSpuTIQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301932; c=relaxed/simple;
	bh=2WAVdJysnUkmZTJ3yfISH2a/X9t2BsDVTFY9LZQ+lOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slnsxGNXKg/mu/Vlg9dGXmBoY8caJAEZ8+uK+10c3zqSyP0IgBNOL3QNgb87sPRNRMUpFIYGEVyrgpJPbDJMx/eLcUvqbYVbLA9g+qzTjmwKiUaBK+QjfchKjMTiJFpyINlc9XFXmijUgQ4Yt31LAv1YyJHg28SoFMtQR27yPuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=loIMOPvl; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="loIMOPvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784301925;
	bh=2WAVdJysnUkmZTJ3yfISH2a/X9t2BsDVTFY9LZQ+lOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loIMOPvlDvmkruLX/NleWqZPTc9pT4fjT9CyIqShBZlQlGC/ZLANnKWpEu4vvrduV
	 yrg1uFUAqm6VP5tUVm5Np9ebPTu5jy80k4KuuUnxEetxx5+i+11mVpCWvB/az14nm5
	 nF0q11JAY6y4my2vcBuUSxKpIcRzoMnoETXhhksw=
Date: Fri, 17 Jul 2026 17:25:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Huth <thuth@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Nick Huang <sef1548@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <02978413-55eb-4a1d-8ccc-d73060e46795@t-8ch.de>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <823e3bf3-ef3d-47cf-aff8-1668875a2f38@redhat.com>
 <5e05be8c-e9b7-4da7-a182-eefc5043cd2e@t-8ch.de>
 <alpine.DEB.2.21.2607161908060.64835@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2607161908060.64835@angie.orcam.me.uk>

On 2026-07-16 19:16:26+0100, Maciej W. Rozycki wrote:
> On Thu, 16 Jul 2026, Thomas Weißschuh wrote:
> 
> > > > However the UAPI headers might be used with older (< GCC 3.0) or
> > > > non-GCC-compatible compilers, which do not define __ASSEMBLY__
> > > > automatically.
> > > 
> > > I just had a try with gcc 2.95.4 from a Debian Woody installation, and it
> > > defines __ASSEMBLER__ automatically when compiling *.S files, i.e. gcc 2.95
> > > does not seem to be a problem. So can you point me to a real case where
> > > someone tried to use a user space compiler where __ASSEMBLER__ was not
> > > defined automatically? Otherwise, I think this patch could be reverted
> > > again.
> > 
> > I don't have a specific case I can point you to. My goal was
> > consistency. Therefore I am against reverting the patch as long as
> > both __ASSEMBLER__ and __ASSEMBLY__ are used in the UAPI headers.
> > If we want to switch to __ASSEMBLER__ for the UAPI headers today,
> > we should instead invert the logic of this patch to consistently use it
> > everywhere. After all UAPI headers are migrated, the normalization can
> > then be removed.
> 
>  I believe Thomas specifically refers to the mention of the alleged 
> shortcoming of pre-3.0 GCC, which we've since verified not to be true, as 
> quoted elsewhere in this thread, so the note needs to be dropped in a 
> respin.

It *was* dropped in a respin[0], which is the patch that got applied.

[0] https://lore.kernel.org/lkml/20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net/
