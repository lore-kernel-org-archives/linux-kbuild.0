Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B142CAFA;
	Fri, 17 Jul 2026 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302115; cv=none; b=YBtLs7RTKbhhm3ScCC6SxMFj+AZNHQ5Vur+rpH/3VDLfk2747l496uZ08ZhlpNkoU3BvI1Ki0lk1Ht4PEhgkbf0DJHdYP8SwwlyB8vZC389ymok1C+fYAWhnm60qYBJPvaelszn1LvktLHvxMlj8PZJvfDF8isaREdp/KYzKRCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302115; c=relaxed/simple;
	bh=+POp8cyKfyuhg9JAwcR7WcSPAhyJ4Vsnffx9TIdKPoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc7GgKfmX9LIITPUmTRdOCLKI/71ofmSxYgPN1dYigA/q/8pzOw36EiCbDFKUpXrFVE4O0ZID4jbipIc2mtaaOIZJXE65l6RzBDjVKdyv2nyHbmgOGuK8kbN/lIx/2rF4c54GzlBTxxzYFCylii1bIehTrhgkZF9NbD/thMV9g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=q4NUtxTg; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="q4NUtxTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784302111;
	bh=+POp8cyKfyuhg9JAwcR7WcSPAhyJ4Vsnffx9TIdKPoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4NUtxTgUvok/+ohVhPKDOOQjPb5PEHb47TL6TqwiSoejArFOObjxq6SttA45TnyQ
	 anYgBIeZ5Fa2N2gr7S3sl1xAWtvg6W3xJ82mHXrGDrW6LTDF/qHz4oCR5T68c4wSJ2
	 4XtUQ8RP2C/y5bENsp3PJovhRWUVWB30EVKs1qec=
Date: Fri, 17 Jul 2026 17:28:26 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <6525047d-cc21-40d4-b22e-f85bf1eb1f0d@t-8ch.de>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <823e3bf3-ef3d-47cf-aff8-1668875a2f38@redhat.com>
 <5e05be8c-e9b7-4da7-a182-eefc5043cd2e@t-8ch.de>
 <2030a963-33bc-43fe-9a2b-9c626d7d8360@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2030a963-33bc-43fe-9a2b-9c626d7d8360@redhat.com>

On 2026-07-16 20:52:19+0200, Thomas Huth wrote:
> On 16/07/2026 18.40, Thomas Weißschuh wrote:
> > On 2026-07-16 12:24:07+0200, Thomas Huth wrote:
> > > On 09/03/2026 16.58, Thomas Weißschuh wrote:
> > > > There is an ongoing effort to replace the usage of __ASSEMBLER__ with
> > > > __ASSEMBLY__ throughout the kernel tree, see for example
> > > > commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
> > > > non-uapi headers"). The latter is automatically provided by all compilers
> > > > and preprocessors supported by the kernel, so the explicit definitions
> > > > of __ASSEMBLER__ can be removed.
> > > > 
> > > > However the UAPI headers might be used with older (< GCC 3.0) or
> > > > non-GCC-compatible compilers, which do not define __ASSEMBLY__
> > > > automatically.
> > > 
> > > I just had a try with gcc 2.95.4 from a Debian Woody installation, and it
> > > defines __ASSEMBLER__ automatically when compiling *.S files, i.e. gcc 2.95
> > > does not seem to be a problem. So can you point me to a real case where
> > > someone tried to use a user space compiler where __ASSEMBLER__ was not
> > > defined automatically? Otherwise, I think this patch could be reverted
> > > again.
> > 
> > I don't have a specific case I can point you to. My goal was
> > consistency. Therefore I am against reverting the patch as long as
> > both __ASSEMBLER__ and __ASSEMBLY__ are used in the UAPI headers.
> 
> I've got patches for all files ready and posted them a couple of times
> already - the problem is, some maintainers are not responsive / ignoring me
> ... so I'm afraid but I guess we'll be in this inconsistent state for a
> little bit longer...

Yeah, this is how these things usually go...

> > If we want to switch to __ASSEMBLER__ for the UAPI headers today,
> > we should instead invert the logic of this patch to consistently use it
> > everywhere. After all UAPI headers are migrated, the normalization can
> > then be removed.
> That sounds like the better idea to me. Could you maybe send a patch, or
> want me to do it?

As you are the one driving this effort, it would be great if you could
send the patch. If the patch would make it into v7.3 I am also fine with
merging both patches into one if the kbuild maintainers prefer.


Thomas
