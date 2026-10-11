Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DBB54763;
	Sun, 11 Oct 2026 00:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677351; cv=none; b=XfGSsP9yk7OwhBccTNpyMObuIxSs3C+UaTkSTq7B10/cwNbyD1RlWu1aA3coWMIqFJz1oNiNfF4Xer8jZW2J4M6HjuC93NETngwByZjhm54x8E7+XRmFC/ZlKkxR2PndRyYRIwUBWjhO6kId/iKSmISWQrpfY0a1asDfXQ8RDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677351; c=relaxed/simple;
	bh=/StptI2w03hveOvfOHLMrYQ0vIhfXJzXlxMapKzSFv0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VJvcaAsM3yPm1AcIqet/vp4iJ9goRBQNJ1jv1dkHivKHpiwuoWEVW95nUFXtCJDSxAwCj2ZcFouHf1dejzRzOMLkmgB/vdnZ0YinLHFv8cQvou6e8JNc0Q6kLvJ8n3tev1gGuKryI1e01+8QwPK21j0D+EAO6+wNf71oSBK6Mvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QrFEeb9G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QrFEeb9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06831F000FF;
	Sun, 11 Oct 2026 00:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791677349;
	bh=5J8Pk7R4t/hrneVev7YvkuPss4tdZ6sVyc05zj/YGo4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QrFEeb9GwJyzulrrC3faCtcggOJi191Ny/A4EYuUIMclQyC8I3CQpTyAiGclkWjr0
	 EhJ92tlsDk2alHdZ5pBcoFFjsPgQlkYbzbCd6a7DgGK2VPVwTS/6fd5QS/EsfTBr1t
	 IUyAxAAHJuuw7kW9U8XebXwlsA3Z+ji1urCqWbJg=
Date: Sat, 10 Oct 2026 17:09:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: jim.cromie@gmail.com
Cc: Nathan Chancellor <nathan@kernel.org>, Denis Benato
 <denis.benato@linux.dev>, linux-kbuild@vger.kernel.org, nsc@kernel.org,
 thomas.weissschuh@linutronix.de, chewi@gentoo.org, abelvesa@kernel.org,
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] kbuild: install-extmod-build: install
 kernel/kallsyms_internal.h
Message-Id: <20261010170909.8d90c362c3779a43ebffa180@linux-foundation.org>
In-Reply-To: <CAJfuBxzMz2YRoHmsr28DjNontvoR6ZVfZ+AbAbOW3aHbsQfi-Q@mail.gmail.com>
References: <20261005200123.146822-1-denis.benato@linux.dev>
	<20261006081116.GA830598@ax162>
	<0cbe9bb2-69b5-4d6c-a780-07a55d40a63d@linux.dev>
	<20261008164736.GA3975095@ax162>
	<CAJfuBxzMz2YRoHmsr28DjNontvoR6ZVfZ+AbAbOW3aHbsQfi-Q@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 Oct 2026 16:42:43 -0600 jim.cromie@gmail.com wrote:

> >
> > Indeed, thanks for the report raising the issue, I hope Andrew and/or
> > Jim can comment on it soon.
> >
> 
> The easiest fix is to just copy the 3 macro defs over to scripts/kallsyms.c,
> with a suitably explicit msg about the coupling.
> 
> Andrew, do you want it as a fixup ?

I think a v2 patch, please.  To give a clean history and to give
reviewers a second chance to go through it.

