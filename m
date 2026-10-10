Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9629A309;
	Sat, 10 Oct 2026 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675268; cv=none; b=R4s+HKN9ezYfTXM8f9PBYFiG8OsElyTqQlOUN9nV6BZbRUYF6HvkohUqBNrzO5s3tQTf/YuqCB0RNlcTgiRKjXoqcPLncZ92EOmIT/fDShhFlCncFV6Db7DgZ2jE3Ts7YzNa5tmLuU/MZqRDtg0bZoavADe8XtE8KmIx2QPjzk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675268; c=relaxed/simple;
	bh=mqr2DucTjbu0bs7sbqDpdV7OH22B3xf1jCn2d9tBbh4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DdW60NqZmXXxc/Yo/cE9bTs9rzBzSxGJsWk84XgcDa/9jLIm8fArFZEq/THl11F2F+jvTGiYTqhbtSKU1lBs3WP/nPZIV6tymteyrYzpsote0XDU+iaDOBOTHUCoprS3Y3y6AnBubiLzh97Jyz48ygXo34ySX0ZfCnZBAwK/JIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zwWGGp2k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zwWGGp2k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361F71F000FF;
	Sat, 10 Oct 2026 23:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791675266;
	bh=9iwVIi3c0U4zKOpJ4o30r2BRWj2wDRlxr8fMDYx77J4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zwWGGp2kK0YOnhzmyLuH3f4IiXgcpl+jaXWjRByBb/EfkueQ/QL7t0AZL2Fin9Qd+
	 I/WIrpgkwSreowYqJK2gW4UWlg+wrT2hLF5sbxQvOll68GPlAt28+Ell8K9iNWrBXS
	 fkRgwwvCmKqJu6sfup5xPj5/lkXIH30O2/7DrL9M=
Date: Sat, 10 Oct 2026 16:34:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Jim Cromie <jim.cromie@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Denis Benato <denis.benato@linux.dev>,
 linux-kbuild@vger.kernel.org, thomas.weissschuh@linutronix.de,
 chewi@gentoo.org, abelvesa@kernel.org, linux-kernel@vger.kernel.org, Kees
 Cook <kees@kernel.org>
Subject: Re: [PATCH] kallsyms: copy constants from __KERNEL__ to user, drop
 the inclusion
Message-Id: <20261010163425.b291248543a3423e2a445e14@linux-foundation.org>
In-Reply-To: <179157208243.362135.3553274020133646760.b4-review@b4>
References: <20261008-fix-kallsyms-v1-1-3339fdac2ab3@gmail.com>
	<179157208243.362135.3553274020133646760.b4-review@b4>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 20:54:42 +0200 Nicolas Schier <nsc@kernel.org> wrote:

> > commit 4fafd1165b33 replaced hardcoded values which determine marker
> > array size, with new values that accelerate symbol-name lookups.
> > These symbols are needed in user-space to generate the lookup tables,
> > and in kernel to read the generated table.
> > 
> > To avoid 2-defns problem, they were added to a kernel header (with
> > ifdef guards) and included by scripts/kallsyms.c.  But that creates
> > packaging problems elsewhere, so just add the 2nd defns, with an
> > explicit comment about the user-kernel coupling.
> > 
> > Fixes: 4fafd1165b33 ("kallsyms: increase marker density to 16:1 to accelerate lookups")
> > 
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---

Thanks, I added this as a to-be-squashed-later fix against "kallsyms:
increase marker density to 16:1 to accelerate lookups".

btw, I have recorded some question marks about this series:

https://lore.kernel.org/20260929221330.72cd1de4@pumpkin
https://lore.kernel.org/20260930132109.260597-1-david.laight.linux@gmail.com
https://lore.kernel.org/20260930101307.4477e264@pumpkin

and I'd like to get those crossed off before proceeding.

> FTR: Please keep trailers in a single trailer block, otherwise that will
> probably break some common tooling (cp. e.g. git-interpret-trailers).
> 
> Is the commit ID correct?  In mm-nonmm-unstable I find
> e2c2904abf71d0144f37844fde7dffe8b814a44f instead.

mm-unstable is "unstable".  It rebases more than once per day so lookup
by hash doesn't work.

	git log --oneline | grep "kallsyms increase marker density to 16:1 to accelerate lookups"

works for me.


