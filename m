Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797C3F1056;
	Fri,  9 Oct 2026 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582740; cv=none; b=tJYnMaIJhg6r7IgYv9cNV8AoN+osDk470PkxiDEtUedimM0p4ccFLWWqFcQKll536a+EmVGvHRj3+3OGapmkoChPSSeQ26k2QMZqlOvgX3qMyIc5JTPZKKYkXHqEhuySYrDD7DL3B2hkh+jOYjdMeWQqXqEc+JYvDsUoxwMnOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582740; c=relaxed/simple;
	bh=ZSTrHJZrtm8743xpxAcmv74rmSpzC4fLWqMcOLhtqZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4CcSKlTJebs8w10TJhOZHILJFDmYUzZtmNMrE8YPBXgGeyrKMLRbMBBC/TZkQxtwLzKFARxqxgxy9WBSQJQDSJslAxsJGAETKw7NVsaHmulBazpmPfZndsHchZ6zPFmqOQ5C1qwbAE+K2X1Z/GMbu3GZkHC0qGALuK1GkUAF38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtAAQiHk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtAAQiHk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D8D1F000FF;
	Fri,  9 Oct 2026 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582739;
	bh=yEJReIk1XnAoec4hlvkbX98P7QVUi514eQ0qkoXjGUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QtAAQiHkqTNWbmlDBsI6uZursnhFLwCD/AAKIANieMez/N5t7gZcYaxP3CWDzv/Td
	 7dK8jZOfsPWZKQ2QP/xVaflRv6eoNH5g6eiAaLJDf3iZBkV/Mo0QoM2Jb6JTvonnMr
	 m6x2ysZvVT8n48yIzgg6glZ+uN8sFvh+KdrS4ac19JkRK+GmJCoSlgTqKfb0ygoPfm
	 NHT68OxJ5Yg4jNysmitBrgvsh6zAGLn9ZRaLt42yuSzRHhTLkwegLU8hqCWcPG92bA
	 Iq5AZuz4fIk6Ep7nSkFsfgI1KMfmc4tXyFPSR+ChyFQYSxDUaRnQh6gx/iB/46u3W1
	 K2jWfjqhBYqnQ==
Date: Fri, 9 Oct 2026 22:52:15 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the efi tree with the kbuild tree
Message-ID: <20261009215215.GA981232@ax162>
References: <aslflbcgByI1rH2_@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aslflbcgByI1rH2_@sirena.co.uk>

On Fri, Oct 09, 2026 at 11:41:41PM +0200, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the efi tree got a conflict in:
> 
>   drivers/firmware/efi/libstub/Makefile
> 
> between commit:
> 
>   454e00cf8ee5a ("kbuild: avoid re-running compiler and linker probes")
> 
> from the kbuild tree and commit:
> 
>   aa712d73350dc ("efi/libstub: Disable kernel stack erasing in the common flags")
> 
> from the efi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/firmware/efi/libstub/Makefile
> index 415f63105b481,7bb5e5066c732..0000000000000
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@@ -40,7 -40,8 +40,8 @@@ KBUILD_CFLAGS			:= $(subst $(CC_FLAGS_F
>   				   -D__NO_FORTIFY \
>   				   -ffreestanding \
>   				   -fno-stack-protector \
>  +				   $(CONFIG_CC_OPT_NO_ADDRSIG) \
> + 				   $(DISABLE_KSTACK_ERASE) \
>  -				   $(call cc-option,-fno-addrsig) \
>   				   -D__DISABLE_EXPORTS
>   
>   #

Thanks, looks good to me.

-- 
Cheers,
Nathan
