Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39FC36D9EE;
	Thu, 15 Oct 2026 21:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099700; cv=none; b=ZOefFWMmZQovvUuyACcIFH0OqtB+pAWwnQ3pzTsjEdVw9ewKX8bKZ2DYKa+kFQx3JoDeSsKPmjINgZ0ACzWfDnyWC5rjdDWI7FZd2z0Hnq9XcvxLIQJb7rvZ7yNxg267hlAGQfP32DYuX5FkFxAvQl7P+qM3s0oNDinmefU0nhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099700; c=relaxed/simple;
	bh=eg2p6qVLmzzRrtsu/gnzer/4zbwZ/+xmU0FEDLKG3qM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=My8iLyCRZtxZcJXbU4qPE0teszu9xVx9ivZktS7oPyIQHUP3fPJjv+v80QMYP2xaSH8piSHF9kutwMGGU/w8O59w5ATf9113U6U4s94OqOctvTPDB7nG156wQJuKo30MFfyAAfl2sTWU4sOgnkpBLLwTRCCGlNaFm28FAwMbnpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5Y4tlWW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5Y4tlWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E2D1F000C4;
	Thu, 15 Oct 2026 21:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792099699;
	bh=sLRdfhUyrkQ35GKFnmnaZRuiwBWh567OcXbf10vrH8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W5Y4tlWWWLJPP/njut4VnE3ZTRxWcwVzUeRWybFUH/83YF8XcmopjIoFbPFdH+8S0
	 DRkbRKyXt6rFtaP7KIJpf65mg4IsLGedZEo4jQ88Q4QayUp/afYMjsQDNxOZnqTAt4
	 iNEX+gVCr0f/4yDIAWM9XWjbm5oTLlzviKlCjdF13ypIbn5HXsU1Az6yFsc8K5FMhA
	 meDRJsoiQS+aMMx6Eibw8nOUOZUzn7JY/3IjLL5aWVoQtEbmjqZQS41Yg630Uh6+pa
	 C9ape+BO3je0xwBNBi1X/ee1v5aBm0/jFCj97J+9Tmy6Qnya7s2mkx08V+3I6P+7Tj
	 pKeeCIHtVAF3g==
Date: Thu, 15 Oct 2026 14:28:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the kbuild
 tree
Message-ID: <20261015212815.GA319266@ax162>
References: <asAzcgDsbNEFIfKV@sirena.co.uk>
 <20261002230632.GA314599@ax162>
 <asA6NZ4QKp4k4nGD@sirena.co.uk>
 <20261005133224.GA1108555@ax162>
 <asOoLZf9UQkB6SS5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asOoLZf9UQkB6SS5@sirena.org.uk>

On Mon, Oct 05, 2026 at 03:37:49PM +0200, Mark Brown wrote:
> On Mon, Oct 05, 2026 at 03:32:24PM +0200, Nathan Chancellor wrote:
> 
> > Can you drop the fix up to scripts/Kconfig.toolchain that you added in
> 
> >   855c706f2179 ("Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git")
> 
> > ? I have temporarily handled this conflict in kbuild-for-next to make
> > life easier for you in
> 
> Done.

This seems to have made its way back into -next, it is currently in the
efi merge:

  aa5bcff53709 ("Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git")

I have the following applied locally on top of next-20261015.

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 2de66b7bbf70..b0b9a663ddbe 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -166,11 +166,6 @@ config CC_OPT_ALLOW_STORE_DATA_RACES_PARAM
 config CC_OPT_NO_ALLOW_STORE_DATA_RACES
 	def_string "$(cc-option-str,-fno-allow-store-data-races)"
 
-config CC_OPT_INLINE_MEMSET
-        string
-        default "-finline-stringops=memset" if $(cc-option,-finline-stringops=memset)
-        default "-mllvm -max-store-memset=4294967295" if $(cc-option,-mllvm -max-store-memset=4294967295)
-
 config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)
 
-- 
Cheers,
Nathan
