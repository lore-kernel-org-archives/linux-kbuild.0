Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45430147E
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Oct 2025 21:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761168144; cv=none; b=jECBWuMA23I35av6T+3TaOYm22HfybvRQ5Ya+2eHNZYOcF+XVMZh4u7cNsyN5/VVi3GO1mVMs8jwTKR/i7R0NoN0exR3OZIXqOL6/VJks8TAeP1JPlavIUn7eVDP8fGWDRTNe9gCvQe3d2MiOij11HKN4D0n0y8pvO+I+H5M9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761168144; c=relaxed/simple;
	bh=wqIOzERtPFwQCr8wm9Br9AuomkrkgQs8SpouizTtC4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6AERLT+OYKF2iD1HhTamYeTnVEO5G996UgKNikb0DTm6E70Ob81QvWGXLBktGwDWhutikV3+/6XJyo9M778wCba0ieV50XV9BoatkpiXYmnXpX/teH6n55hV6zmKTcHCnSy3ued2NgEBkZmMo4bbgxUDOEJ0IKNjSIrL9JLfqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGDyutDh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGDyutDh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E51C4CEE7;
	Wed, 22 Oct 2025 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761168143;
	bh=wqIOzERtPFwQCr8wm9Br9AuomkrkgQs8SpouizTtC4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGDyutDh4I3Peo/mBijSf7P/0PqrM0m+BDcJ+h4Wa7LumPhq1OYTnVDmXxrvg1hcZ
	 1NtJpJqS9flLlXwQTyuEsqBKcPumEe95yMGWaP3yUL3jZBUhgDkYp8k3rO83VrZMFI
	 NNoCzEGim7r14stv3Bq2Tjpp2XAaQBmsylQg4ut42kR8wb5tydxgvobNqR27aN51ZA
	 bVl1HryBCjlxasldjndr6OEyu1ABBqmfuzL/r7PRVbEdY+eg2MAFFzEAiFFOiUmw3n
	 J4BNmHOm++YC0kUEYJES2wzYrLNaRKNUWC4Dn+2csOtAS6E+9qGrsu1vkPlsht2XTj
	 JvBvtTSZQWjdg==
Date: Wed, 22 Oct 2025 22:48:28 +0200
From: Nicolas Schier <nsc@kernel.org>
To: James Le Cuirot <chewi@gentoo.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] kbuild: install-extmod-build: Fix when given dir outside
 the build dir
Message-ID: <aPlDHJUJZaRxupeI@levanger>
References: <20251016091417.9985-1-chewi@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016091417.9985-1-chewi@gentoo.org>

On Thu, Oct 16, 2025 at 10:14:17AM +0100, James Le Cuirot wrote:
> Commit b5e395653546 ("kbuild: install-extmod-build: Fix build when
> specifying KBUILD_OUTPUT") tried to address the "build" variable
> expecting a relative path by using `realpath --relative-base=.`, but
> this only works when the given directory is below the current directory.
> `realpath --relative-to=.` will return a relative path in all cases.
> 
> Fixes: b5e395653546 ("kbuild: install-extmod-build: Fix build when specifying KBUILD_OUTPUT")
> Signed-off-by: James Le Cuirot <chewi@gentoo.org>
> ---
>  scripts/package/install-extmod-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>
