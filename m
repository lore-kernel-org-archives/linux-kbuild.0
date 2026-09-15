Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8E2C11E6;
	Tue, 15 Sep 2026 01:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436277; cv=none; b=eapKuggApsw1nh2MHLVTvilrgGQrYpeerZSXWDBAANGGElOPFVBZAN+jCX4LhrvVJ3xZ4dawZcCX0ZcqXopfZSo7Uxmq6nPXrexShPfd+mI9CVfHuOPnULvSvBMdApZjF4xNqtCsIc69ktoUhRgHvr80OgfwJH1g/uRc3/yai7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436277; c=relaxed/simple;
	bh=K2fbOWwpImtkSlAegM+iMJj9G7ggW4QY0D7aKiESKeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuR6m+a/erOlh0gBE5VfZ6jsZ26TTzizCT1CZE2lnrl+SIZXI5G6iFnogFNhxXSplhls9EF0WNeqoHd+1SjN83a1tzuHN7SIXNMBJcAzmzO6lg0FEJsIruj6nDanNHmiRd81rVe2DehVaFsfbDI6YM2k5pau+C5DEIFvjT708pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHkF9Y4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHkF9Y4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F521F000FF;
	Tue, 15 Sep 2026 01:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789436276;
	bh=rAO0nct2cb/zHdpycbW36zmQCTcfe2gLn4K7gBYrSf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHkF9Y4GPLt7j8giREy+tCy4OkyKPVExPAE20GoaRibB97BMc7w2w0NoTSCwLmPZi
	 oRgk+4UMEfYsUMfZe1+54SXE7Y77hQxALw9uqItmf4AU1ForwUa6gr+RW2JCKSn8Vl
	 B7bPUb0AeVSKjnw7wxMRY4bVEue5fMJd/wwqUOtqQw/6KPjVMjR0/ULTqFIzXeWvwY
	 Ej0MX4mLLutCzf8fN/1YEPl2w7fQkIK03LhMXOGHOEJCvpGEL4Uv+/IghKNpVqyPgR
	 +pavD0+MLMmsof0kKC/4zBCmJwlqEdGoAtQqthsVz4ewtgYqjid3uK9DZeGErV7n9y
	 VPGrTMrE6bSQA==
Date: Mon, 14 Sep 2026 18:37:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Im7CK <computergod47@gmail.com>
Cc: linux-kbuild@vger.kernel.org, nsc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: fix grammar in output Makefile .gitignore
 generation comment
Message-ID: <20260915013752.GA1794450@ax162>
References: <CACgbi99eSJRx-q5yZR3cMheDaDxKKpExg_fkzapbM8B9YuSh6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACgbi99eSJRx-q5yZR3cMheDaDxKKpExg_fkzapbM8B9YuSh6Q@mail.gmail.com>

Hi,

On Sun, Sep 13, 2026 at 08:24:32PM +0530, Im7CK wrote:
> Fixed grammar in the comment describing the generation of the output
> Makefile and .gitignore file.
> 
> Signed-off-by: Mebecool1 <computergod47@gmail.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 66654fa71..13236b460 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -681,8 +681,8 @@ ifdef building_out_of_srctree
>  # outputmakefile generates a Makefile in the output directory, if using a
>  # separate output directory. This allows convenient use of make in the
>  # output directory.
> -# At the same time when output Makefile generated, generate .gitignore to
> -# ignore whole output directory
> +# At the same time as the output Makefile is generated, generate .gitignore to
> +# ignore the whole output directory.
> 

Your email client mangled this patch, it cannot be applied. Please read

  https://docs.kernel.org/process/email-clients.html

for some information on clients and git send-email or consider using

  https://b4.docs.kernel.org/en/latest/contributor/overview.html

to use 'b4 prep' and 'b4 send' to properly handle some of that in a more
user-friendly manner. An example of that workflow (use the kbuild tree
as the base though: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git/):

  https://github.com/ClangBuiltLinux/linux/issues/2093#issuecomment-2932754317

Additionally, you need to signoff your patch with a proper name, as
neither Im7CK or Mebecool1 are a "known identity" per

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

-- 
Cheers,
Nathan
