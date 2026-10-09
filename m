Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97C3B6BFF;
	Fri,  9 Oct 2026 06:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528900; cv=none; b=Pse8Asnvq6v/EedgJMZVqGht1KCiODdmRf5iAKeuJ21hsIRmoJjWYtHZcNxI/xheHCUIcYEj7ImQZSfceLYslcJ0mF7o0pSUezJhYHQVkf8mJjDc5etyWp68DesH5Yuyz+QeLfm2meTDBAGLBzblU9ZYX4I4LtFtWf+MkoLMYlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528900; c=relaxed/simple;
	bh=ILuCokIxhjgFEGLYPM/TeMEksKee1lLkjsO0oQ//a9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDlldudg040nPz/G9K/z/DcCUuFWOvvtZhlISWqG+lbF7POM+T5oFI7HkZlKsw//Yfr5p5wCMFJbtp4rugVQBuwgBCRQyTk7CTSwwjBoZbKu6ZT/qq+Wv3VFr6u+x1TDZpPEi8oCqfexiqufH0vzOMA1YrRVIHpiGpVz50wwWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5YwAWU1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5YwAWU1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3320B1F000FF;
	Fri,  9 Oct 2026 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528899;
	bh=AR398fhy9TjnjNZ1NMF50jru828P2UiK8ey/AdhygWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I5YwAWU17wxJmRy42kBK/SGhCznn5XhY+MNvw9aYucegmKdWQr6FMcn5b5oVS0IHi
	 7EMWhXIaMhh0kOa9l4rgt+ca2B8iU2eP6w50PCy3u7GS3nlR7gXknwjlb/635Tu3q4
	 SKGGodtCUkpmoUJvoZ3yRRO/lUSTyCStKLY7ZPVBfKOPMHXBMinXdPAy0LeA5a58Ak
	 /Zl8sqKmr7So8YxwB7cGo92MWP3fI2hYL+/HwRowQUXBCk7MMgf8u8N67TKSu2CT1G
	 TIZa8p8fdPfQzMZQe+57QuV+D0B/hud09Zxl1A2v00QTRblfSCXMseEJdw+pyjfYsm
	 OWRUaARdgamkQ==
Date: Thu, 8 Oct 2026 23:54:58 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: Improve ergonomics around disabling
 warnings with cc-option
Message-ID: <202610082354.46E0A9A41@keescook>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
 <20261007-scripts-kconfig-toolchain-improvements-v1-2-1e524178da11@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-scripts-kconfig-toolchain-improvements-v1-2-1e524178da11@kernel.org>

On Wed, Oct 07, 2026 at 05:22:22PM +0200, Nathan Chancellor wrote:
> This is essentially a port of commit 550ccb178de2 ("Make 'cc-option'
> work correctly for the -Wno-xyzzy pattern") to scripts/Kconfig.include,
> which simplifies the definition of many of the newly added CC_OPT_WNO_
> symbols in scripts/Kconfig.toolchain and matches cc-option's behavior in
> Kbuild.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Kconfig.include   |  2 +-
>  scripts/Kconfig.toolchain | 18 +++++++++---------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 622d21e6953f..a7d9201acfcc 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -26,7 +26,7 @@ failure = $(if-success,$(1),n,y)
>  # $(cc-probe,<flag>)
>  # The command $(cc-option) and $(cc-option-str) test <flag> with. Not meant
>  # to be called directly; use one of those two instead.
> -cc-probe = trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(CC) -Werror $(CLANG_FLAGS) $(1) -c -x c /dev/null -o .tmp_$$/tmp.o
> +cc-probe = trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(CC) -Werror $(CLANG_FLAGS) $(shell,echo $(1) | sed "s;^-Wno-;-W;") -c -x c /dev/null -o .tmp_$$/tmp.o

Nice! Yeah, good cleanup.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
