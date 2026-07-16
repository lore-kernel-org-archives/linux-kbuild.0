Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B234446E4;
	Thu, 16 Jul 2026 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225801; cv=none; b=gRzG8TymwAS1aONNASMZwrin+UP+gGP4vwiX0qFOL1xIwqFroF+H2yjZGmTZmm7VyMCdVE+SM2bIhSMmrmaBTl/BaGECAee8skvlPUiyTxx1rmN0GiDgTNfoyJXmd4kSzlhRw3APW1cnVFYvDTTjA2I5Gu2YOYDrqSrGKhe21wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225801; c=relaxed/simple;
	bh=1bu4HqzufB+1MI4e6XsswHv/uZUVQf0tgN5aLM+sS1Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GizmPOWhHSpqRTY0StVB8dhzI070Aw0b/GGxbq+B9tcvJLr3Y3DyJ9jI+swTfKaqDML7qYTMX23/w9Hd6bxRkiIg+DYI9qY3RqGzn2Hn1wwjmqDRD4RC+4NIqQzyBTFSorHHS2J+7MrFyfCog6YpV8D5or8YZfp8aiGmN5NAk+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D789A92009C; Thu, 16 Jul 2026 20:16:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D0B3D92009B;
	Thu, 16 Jul 2026 19:16:26 +0100 (BST)
Date: Thu, 16 Jul 2026 19:16:26 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
cc: Thomas Huth <thuth@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
    Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
In-Reply-To: <5e05be8c-e9b7-4da7-a182-eefc5043cd2e@t-8ch.de>
Message-ID: <alpine.DEB.2.21.2607161908060.64835@angie.orcam.me.uk>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net> <823e3bf3-ef3d-47cf-aff8-1668875a2f38@redhat.com> <5e05be8c-e9b7-4da7-a182-eefc5043cd2e@t-8ch.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Jul 2026, Thomas Weißschuh wrote:

> > > However the UAPI headers might be used with older (< GCC 3.0) or
> > > non-GCC-compatible compilers, which do not define __ASSEMBLY__
> > > automatically.
> > 
> > I just had a try with gcc 2.95.4 from a Debian Woody installation, and it
> > defines __ASSEMBLER__ automatically when compiling *.S files, i.e. gcc 2.95
> > does not seem to be a problem. So can you point me to a real case where
> > someone tried to use a user space compiler where __ASSEMBLER__ was not
> > defined automatically? Otherwise, I think this patch could be reverted
> > again.
> 
> I don't have a specific case I can point you to. My goal was
> consistency. Therefore I am against reverting the patch as long as
> both __ASSEMBLER__ and __ASSEMBLY__ are used in the UAPI headers.
> If we want to switch to __ASSEMBLER__ for the UAPI headers today,
> we should instead invert the logic of this patch to consistently use it
> everywhere. After all UAPI headers are migrated, the normalization can
> then be removed.

 I believe Thomas specifically refers to the mention of the alleged 
shortcoming of pre-3.0 GCC, which we've since verified not to be true, as 
quoted elsewhere in this thread, so the note needs to be dropped in a 
respin.

  Maciej
