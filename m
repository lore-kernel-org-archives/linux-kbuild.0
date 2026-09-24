Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1787220F2A;
	Thu, 24 Sep 2026 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252336; cv=none; b=NcwV4jJ1P78Qf6La/teg6zcnyuGcu1dwXU7nE+Q8tfm9EMFvvAqCbIhhkN8aH+6JG8rLXvfKXklH6+DH6UNxVtMLPFrbkonDTlj4+18PfOW4ayjE8yJp1XMF1hwWWLUMeOsQbbA210ET1Zixvc4hOmnJ/pI0trtjOhKhOtVAM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252336; c=relaxed/simple;
	bh=KP4ToPXOPVipirFagGnGS34KNwnlLGi3RixUrqQrbyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZ2osJMDbL8bUhIOL/oiEwR+qWoJx+6plc/Fq9ZJRZdmR0LChpe2iZx4MmwIgidweGGlPjFS6hVd31SrKGbl6verVaykRgYKyqWVmcu50jqsKgfDHmpI/nDzk80gJ+C/Z7uezLOK+znJUwRaBG6LR4dtK575vdGQRLLYHEUXkQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=WYQmN5p/; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="WYQmN5p/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790252330; bh=KP4ToPXOPVipirFagGnGS34KNwnlLGi3RixUrqQrbyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYQmN5p/RMZ62XWNG8Go6YsOY/y3H6R+SlGeFzj+gdZ9hmTLooAXHmHExzb7FE43W
	 DLqBLb644eMJ4RHFqgAyUR0k6Ad6opFKHbqy5kKD7kvu2iQyjtlwCKyRghpF5n6Bn4
	 m1XRNFRNSaBp+MXoNpFVjhgM2ZYahSEHeBMD+2korJ266LaYnfk7xnMmGc8FlRZ+iM
	 qmAe0oaIPlF4uVX9gSQ65roKMq413uMnxF5Q8PKjijKtOo+CVsYOAFZf1DvvZ6KULD
	 EAkrD7ksExRZoZ2P0oJfbFa3idKjIXrLm3J5+kbbkQ3pbepDZdgGsW7eONJnCMuUOH
	 pFKGM+yBkN3SA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab5152a-03d5-7f0000032729-7f000001d9ca-1
	for <multiple-recipients>; Thu, 24 Sep 2026 14:18:50 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 14:18:50 +0200 (CEST)
Date: Thu, 24 Sep 2026 14:18:49 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v3 24/28] kbuild: Generate the noreturn list and validate
 modules against it
Message-ID: <20260924-antique-weasel-of-fantasy-6f4eac@l-nschier-z2>
References: <cover.1790028654.git.jpoimboe@kernel.org>
 <ed33f66332772d5156dc91513d00e19218e5e68b.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ed33f66332772d5156dc91513d00e19218e5e68b.1790028654.git.jpoimboe@kernel.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1790252330-8D7F0EF9-2FEB22D7/0/0
X-purgate-type: clean
X-purgate-size: 1413
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: DC78CA086F  external: no

On Mon, Sep 21, 2026 at 03:31:25PM -0700, Josh Poimboeuf wrote:
> Most of the remaining hard-coded noreturn functions are exported symbols
> which live in vmlinux.o.  The objtool vmlinux.o pass can detect them
> automatically, but modules can't.
> 
> Instead of hard-coding them in noreturns.h, dynamically generate the
> list in a new scripts/noreturns.builtin file, which objtool on modules
> can then read.  That allows most of the remaining hard-coded noreturn
> entries to go away, including the Rust ones.  Note this means that
> modules need to be linked after vmlinux.o has been built and analyzed by
> objtool.
> 
> Objtool running on OOT modules will also need to read the generated
> file.  Its location in scripts/ should ensure it gets installed with
> kernel build files automatically.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  Makefile                                |  8 +++++
>  scripts/.gitignore                      |  1 +
>  scripts/Makefile.modfinal               | 15 ++++++--
>  scripts/Makefile.vmlinux_o              |  2 ++
>  tools/objtool/Documentation/objtool.txt |  8 ++---
>  tools/objtool/check.c                   | 46 -------------------------
>  tools/objtool/noreturns.h               | 17 ++-------
>  7 files changed, 29 insertions(+), 68 deletions(-)
> 

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
