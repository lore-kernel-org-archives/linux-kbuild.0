Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466223BCD29;
	Tue, 21 Jul 2026 21:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669547; cv=none; b=RimtgO+ako2MjEDxcMoDB7FYhb1DR/enow+1Z5cssdcUGhEl5cvSdNmGAgqQS6YKjco9djgn8dzZ62dejkg+Za97iTUo46W5W0Mnb/1zmOWAV5MCuw0IFRrTloEOXWDG7PD5nHXB3HFd+3JAbgomYMBjGyaNdl6377/m3OJ+q3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669547; c=relaxed/simple;
	bh=6uWnc2PdtApJFJq02rq421JsE+19CWvTitfqMxHSOSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZoiAqV2EDq1E2L4fZvIehbxQXUndfznF3kB+CcHaaS0B8ePolW+w0tELjEllcqvkdxUKzdtwhnZY5/3kXVh9EmN4dx9cj7CUM+S4l8Ksx6M0y2arpCuNYFrqgu8JlDcLiF+v8oZTRucfaLyqW3k0cSkIMjfyEMCWjOzd+GaCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KJIUb+jp; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KJIUb+jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784669536;
	bh=6uWnc2PdtApJFJq02rq421JsE+19CWvTitfqMxHSOSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJIUb+jpKZPPnqYOXyR6Tq63dZzjFRXBn0uJLA8fCaWqrEw5GbOK9XZ3X94GI6vGg
	 UCaD/SmrJQmeU6myT8RrJUO+l+amy2ozoEUhtgLKAYxxc+mVfkDJ9+RhpSaaxiUzvQ
	 3ukASYhls3uKJlaMSyRaUR/9SvJbw34rrViuaY/E=
Date: Tue, 21 Jul 2026 23:32:16 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Thomas Huth <thuth@redhat.com>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nick Huang <sef1548@gmail.com>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <b83f2696-ec0e-4c35-98bf-1094588dfad1@t-8ch.de>
References: <20260720101025.355623-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720101025.355623-1-thuth@redhat.com>

On 2026-07-20 12:10:25+0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> A previous patch to headers_install.sh normalized the usage of
> __ASSEMBLER__ to __ASSEMBLY__ in the UAPI headers due to the
> assumption that older versions of GCC might not define __ASSEMBLER__
> automatically and thus using __ASSEMBLER__ in the UAPI headers might
> break compilation with very old versions of GCC. However, as we now
> reassured, even GCC 2.95 still defines __ASSEMBLER__ automatically
> (and even older versions are hopefully not in use with the current
> Linux UAPI headers anymore).
> __ASSEMBLER__ is also set automatically by other C compilers like PCC
> (see https://github.com/IanHarvey/pcc/blob/cvs2git/2018.09.20/cc/cc/cc.1#L405)
> and Tiny-C (see https://repo.or.cz/tinycc.git/commitdiff/a25325e9be13e52a),
> so using __ASSEMBLER__ in UAPI header files should really be fine.

I am not that happy about this explanation. The note about old GCC was
dropped in the committed version of the patch.
It should be enough to just explain why __ASSEMBLER__ is better.

> Thus let's head forwards and standardize on __ASSEMBLER__ instead
> of __ASSEMBLY__ in the UAPI header files now.
> 
> Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> Link: https://lore.kernel.org/all/2030a963-33bc-43fe-9a2b-9c626d7d8360@redhat.com/
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Based-on: https://lore.kernel.org/all/20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net/
> 
>  To avoid the churn, feel free to squash this patch with
>  Thomas Weißschuh's original patch as long as it has not been
>  merged to Linus' tree yet.
> 
>  scripts/headers_install.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 83e4475968781..2f1d1767ca267 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -36,7 +36,7 @@ sed -E -e '
>  	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
>  	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
>  	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> -	s/__ASSEMBLER__/__ASSEMBLY__/g
> +	s/__ASSEMBLY__/__ASSEMBLER__/g
>  ' $INFILE > $TMPFILE || exit 1
>  
>  scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
> -- 
> 2.55.0
> 
