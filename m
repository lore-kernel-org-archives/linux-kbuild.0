Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F23B47CB;
	Sat,  1 Aug 2026 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614765; cv=none; b=hZxshKiedMh/DAF3TfilkFexSMBITvyXq0hK0CpUMwUjug/gZmTqSdWV63SzjogUp4FFEut52j/tGHP6i/K8iOpp3mxiUSew8vbRrCKBM1MR/8xmPVjQm6Qg0FrrF4hb449juBRnxJx+WCgq5vnAUtNUA/nJ7El4hNbzdi4m+9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614765; c=relaxed/simple;
	bh=mi24yNucDnK+MVz/notCdSGBQ//16YTB2Ott1Bmw7yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTNFWaOzWq1KJnDF7jL08XFvmGgzhnPx/KtAYictXo+kZ8B4xIIOVYScgJIfrTzbGRmj6GbktiHpQ6jyqxVr2NcdIru2bZUvcGUyoxn+3DliQ8O8RgT6ZunFlq5OxGOzyk8SDuY7FKLKOw+oWF67PAHGpMomp6ToDPljM/NTMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXWlvNCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXWlvNCd"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 88B161F00AC4;
	Sat,  1 Aug 2026 20:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785614763;
	bh=I0SfXUXMtSrNefeP6z0+jCm5Ax5j2BS48uRwbXVnHO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UXWlvNCdGenJa5IUxi3PF1EalXmvVAYmby3CC+ZzZ24Li/MGRmJIS57u57+kZhTg/
	 qLbPh3zF5AcZHCUs7LiCZ3AD0lj59GROwxnE+QY9Jb1Xbzv60HFjWtNUMAzfnzIo0x
	 GV3P863qtrWGXbw04oVRak6oa2haJY/R6c2qybzIUzpyaCswxdRihKSzlZsSmj/0XA
	 +uABqdyvPxqbCGJFOKOgyhB88Xgqn5NpLxKAesUDmsdXip5wW0AzQ8twrpIt8aioBN
	 x2Yh1RzRMLgncy9iYJP27X6AmzZhZdWimsLrf98/zyapaHdbBrhMiLqVAGTIbguf3d
	 I0Mli4Hg9U3RQ==
Date: Sat, 1 Aug 2026 21:44:34 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Askar Safin <safinaskar@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v2 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh
 to scripts/
Message-ID: <am5Moi6DBgMSnuO1@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Askar Safin <safinaskar@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
References: <20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org>
 <20260720-move-gen_init_cpio-to-scripts-v2-2-26b7e15c7133@kernel.org>
 <178552657997.3004192.6811032535007922482.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178552657997.3004192.6811032535007922482.b4-review@b4>

On Fri, Jul 31, 2026 at 12:36:19PM -0700, Nathan Chancellor wrote:
> > diff --git a/usr/gen_init_cpio.c b/scripts/gen_init_cpio.c
> > similarity index 100%
> > rename from usr/gen_init_cpio.c
> > rename to scripts/gen_init_cpio.c
> > diff --git a/usr/gen_initramfs.sh b/scripts/gen_initramfs.sh
> > similarity index 99%
> > rename from usr/gen_initramfs.sh
> > rename to scripts/gen_initramfs.sh
> > index 7eba2fddf0ef..27ac1fd48001 100755
> > --- a/usr/gen_initramfs.sh
> > +++ b/scripts/gen_initramfs.sh
> 
> The cpio commmand in scripts/Makefile.package needs an update for this
> move, otherwise modules-cpio-pkg will be broken.

Good catch, thanks!

> Additionally, I see a number of references to "usr/gen_init" even after
> this is applied:
> 
> $ git grep usr/gen_init
> Documentation/driver-api/early-userspace/early_userspace_support.rst:usr/gen_init_cpio utility (run 'usr/gen_init_cpio -h' to get the
> Documentation/driver-api/early-userspace/early_userspace_support.rst:usr/gen_init_cpio.
[...]
> tools/testing/selftests/kho/vmtest.sh:        "$build_dir/usr/gen_init_cpio" "$tmp_dir/cpio_list" > "$initrd"
> tools/testing/selftests/nolibc/Makefile.nolibc:        $(QUIET_GEN)echo 'file /init nolibc-test 755 0 0' | $(objtree)/usr/gen_init_cpio - > initramfs.cpio
> usr/Kconfig:          "usr/gen_init_cpio" program in the kernel tree.

oh well, thanks!  I completely forgot checking for references.

> Otherwise, this seems reasonable to me. Feel free to carry
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> on the respin.

Will do, thank for the review!

Nicolas
