Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261763F8707;
	Fri,  4 Sep 2026 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544126; cv=none; b=qw9VxpHwBwmdLhFQ1LUaKK03FEkp5ZW08I4IIFRFQczs3lb51Cx1AIMYS4lCcP/ZlDfu3tGIESjaA40Zi33QJJpOuTqXdussQPzzDBtcqyvCsTMNnAMGnLEnZALqBx7tmGPuw6htf8boDXGr8wU4tJc+Z41nTCNgQyBoZ0JA3z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544126; c=relaxed/simple;
	bh=wZR0nfZTHKQ7zSiD1VAn6J0Jda9xMGneONF/vDHoaDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bcgi3VFIfdlT6mg29m3ETKCjj0wQsU0jYbUpAL3OPOxEz5UH/5Yc2JAbwZ7NUN+JJ1AlZlb+NFAsu9fDoPoGGDCpQofZoBAvDk+LPXmhgzJYpBzXWp6D9Aguzr/Oa/oohr/WZv1DfFxMt0kTgCJrMoFQEF1jo516TFnnEb8v33o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=gRExlL8h; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="gRExlL8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1788544081; bh=wZR0nfZTHKQ7zSiD1VAn6J0Jda9xMGneONF/vDHoaDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRExlL8hqy782Vwh7J+EwPne/uQduQsZPzRu2ZIMaxeFZ8LuiUEXeLa7jIHaznLfP
	 E32gYj+6vCdN8PvHODDlgqvqo9x5cUenCF+FZEjWSB1uz9VvQ5oVa35VOKNQy8SlvE
	 qa9ZW2y63K7qfWXQufOssIM+kkZ7KTvHnCvSG9kjCtdjdaXKv+vPUas8aIsLXNNinm
	 DhrtqDdDvxvZiyn+gGzq83JDWWBWSO2YU140VvYwguuCBKz/rnNnEJZyASmMRGC7/a
	 FNLY6FIRIjvxHtGvUx46sVFDUwkX2oaA89robJVc0gADmTgZuRAEK/Ndx2PGXPF1x8
	 Aj29mzGMGkIJw==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a9b0451-13a0-7f0000032729-7f0000018018-1
	for <multiple-recipients>; Fri, 04 Sep 2026 19:48:01 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  4 Sep 2026 19:48:01 +0200 (CEST)
Date: Fri, 4 Sep 2026 19:47:59 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Vlad Poenaru <vlad.wing@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH] kbuild: don't delete in-flight filechk temporaries in
 asm-headers
Message-ID: <20260904-adorable-cordial-pronghorn-6ccaf4@l-nschier-aarch64>
References: <20260902161347.4163577-1-vlad.wing@gmail.com>
 <20260903064544.GA1942038@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260903064544.GA1942038@ax162>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1788544081-0C787EB7-782975CE/0/0
X-purgate-type: clean
X-purgate-size: 2426
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 334E0A015E  external: no

On Wed, Sep 02, 2026 at 11:45:44PM -0700, Nathan Chancellor wrote:
> On Wed, Sep 02, 2026 at 09:13:47AM -0700, Vlad Poenaru wrote:
> > Commit 2d69b891e646 ("kbuild: Support generated asm-headers in
> > subdirectories") switched the stale-wrapper sweep in
> > scripts/Makefile.asm-headers from $(wildcard $(obj)/*.h) to a find(1)
> > invocation, so that generated headers in subdirectories are considered.
> >=20
> > The two do not match the same set of files. Make's $(wildcard) uses glob
> > semantics, where a leading '.' has to be matched explicitly, whereas
> > find's -name uses fnmatch() without FNM_PERIOD, so '*.h' matches
> > dotfiles as well. filechk writes its output to $(dir $@).tmp_$(notdir $=
@)
> > before renaming it into place, so such a scratch file, if it happens to
> > exist in $(obj) when the sub-make is parsed, is now picked up in
> > old-headers. It appears in neither generic-y, generated-y nor syscall-y,
> > is therefore classified as unwanted, and cmd_remove deletes it.
> >=20
> > On x86 this races with archprepare, which lists both asm-generic and
> > arch/x86/include/generated/asm/cpufeaturemasks.h as prerequisites. Under
> > -j they run concurrently against the same directory, and the build fails
> > intermittently:
> >=20
> >   mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.=
h': No such file or directory
> >   make[1]: *** [arch/x86/Makefile:269: arch/x86/include/generated/asm/c=
pufeaturemasks.h] Error 1
> >=20
> > The same commit also converted the generic wrapper rule to filechk, so
> > those wrappers now create .tmp_*.h in $(obj) too and can race among
> > themselves.
> >=20
> > Restore the previous behaviour by excluding dotfiles from the sweep.
> > Subdirectories, which is what the find(1) conversion was for, keep being
> > descended into. While at it, quote the -name argument: it is currently
> > expanded by the shell against the build directory before find sees it.
> >=20
> > Fixes: 2d69b891e646 ("kbuild: Support generated asm-headers in subdirec=
tories")
> > Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
>=20
> Oof :( that's unfortunate, thanks a lot for tracking this down!
>=20
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>=20
> Nicolas, I assume you will pick this up for 7.3.

Sure, sorry for the delay.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

--=20
Nicolas
