Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225B30AD05;
	Thu, 16 Jul 2026 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220071; cv=none; b=GEGjh0Af651pqA7Mih/0zOx8RzfFwu0ZU3xFo8sl57QGDWn9AfYJZ99jKzZkV5NzhIaDedWun/SRQhz3h3mYXj3BZ6+IurFrXgzABOhQXCc/2hXi7Gy+MUevhxc8xYQACRQxjoiRMZ8sizIn8F3FaHdkv6Pn9DIMnuaHPSfAkpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220071; c=relaxed/simple;
	bh=/CM+IFEvBqn3K3FtKLBODUTYgY9Ur3oouhbdIjjh/1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBMxE0c1zCDCScsqyWbDhWgO0FO9oWE4vnXHMTs89+28hAuCh123c7bqTZ7hDXXl4EU4gzNwBURbJ2LO5uERY5KPuMamC8geiw4Syr+OmGcTg2eocb6xfemqTZDhc3JL0ahURWFHYFw+fnCuNVMzTPEp5BojfVAL/aqDJvfvAmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fEvkZdFz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fEvkZdFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784220054;
	bh=/CM+IFEvBqn3K3FtKLBODUTYgY9Ur3oouhbdIjjh/1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fEvkZdFz43ViwmZT3VJsbV6BXx3UtxQ6uHpLgROULNdCEMUQE9nNyzpRAGmbADoDQ
	 6MDB689QmcOcJr7CDTNhU4PxrHuwVmaPgoWvjcBquPjTxCBlEot15zSLeyrbWgIBu1
	 0V4wRQRu+70Kn1+1IAOEIP9Wr7RAloW1u14Ve40E=
Date: Thu, 16 Jul 2026 18:40:53 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <5e05be8c-e9b7-4da7-a182-eefc5043cd2e@t-8ch.de>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <823e3bf3-ef3d-47cf-aff8-1668875a2f38@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <823e3bf3-ef3d-47cf-aff8-1668875a2f38@redhat.com>

Hi Thomas,

On 2026-07-16 12:24:07+0200, Thomas Huth wrote:
> On 09/03/2026 16.58, Thomas Weißschuh wrote:
> > There is an ongoing effort to replace the usage of __ASSEMBLER__ with
> > __ASSEMBLY__ throughout the kernel tree, see for example
> > commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
> > non-uapi headers"). The latter is automatically provided by all compilers
> > and preprocessors supported by the kernel, so the explicit definitions
> > of __ASSEMBLER__ can be removed.
> > 
> > However the UAPI headers might be used with older (< GCC 3.0) or
> > non-GCC-compatible compilers, which do not define __ASSEMBLY__
> > automatically.
> 
> I just had a try with gcc 2.95.4 from a Debian Woody installation, and it
> defines __ASSEMBLER__ automatically when compiling *.S files, i.e. gcc 2.95
> does not seem to be a problem. So can you point me to a real case where
> someone tried to use a user space compiler where __ASSEMBLER__ was not
> defined automatically? Otherwise, I think this patch could be reverted
> again.

I don't have a specific case I can point you to. My goal was
consistency. Therefore I am against reverting the patch as long as
both __ASSEMBLER__ and __ASSEMBLY__ are used in the UAPI headers.
If we want to switch to __ASSEMBLER__ for the UAPI headers today,
we should instead invert the logic of this patch to consistently use it
everywhere. After all UAPI headers are migrated, the normalization can
then be removed.


Thomas

> > So this migration may brake users.
> > Also during the migration phase, the UAPI headers will use a mix of
> > *both* __ASSEMBLY__ and __ASSEMBLER__ at the same time, which is ugly.
> > 
> > For now make sure that the exported UAPI headers consistently use
> > __ASSEMBLER__ as before.
> > 
> > Link: https://lore.kernel.org/lkml/164baf81-2824-4943-bbc1-4ae8a160c0cc@t-8ch.de/
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > This should go either through kbuild or asm-generic, I think.
> > ---
> >   scripts/headers_install.sh | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> > index 9c15e748761c..2f1d1767ca26 100755
> > --- a/scripts/headers_install.sh
> > +++ b/scripts/headers_install.sh
> > @@ -36,6 +36,7 @@ sed -E -e '
> >   	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
> >   	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
> >   	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> > +	s/__ASSEMBLY__/__ASSEMBLER__/g
> >   ' $INFILE > $TMPFILE || exit 1
> >   scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
> 
