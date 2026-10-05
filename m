Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D844825B2;
	Mon,  5 Oct 2026 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205635; cv=none; b=JDn+o4D1OjfgLRVkv+Q4BksVr4Bk2FQYI6rgx/58kmwsGRrtwrdUZMxmSit9qJOSRgOVim3kuf9z1c1diG4kZRY+OTjMjWoQQu32WWUY+pnWgh5Wk4WY6xRIGeXLXwRRTXOasIKSyRh7R4USuxZjyea6MwLlapBX6CWQhbkW5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205635; c=relaxed/simple;
	bh=jitezfqwji1pZx3701XLy05q7t2U4eoFU1bJbjXRNCw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GfPKX/fcsTzGQl9/s/VarpmN3BztuXJqWtNrccblPnAMZPdAlC9P1JaxmzrxuZbB/CS7LCGPFp4YYrl1Ntx3MDVPwCLNvvLFbgeDo/sKIYeaZCilBj8huTEa3IfIvrMOpzAjQAQd6eVagSRfRcJ1m5aWdXKkB+C0oh57Bsu9D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=e3OeAfC7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="e3OeAfC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED181F000FF;
	Mon,  5 Oct 2026 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791205633;
	bh=Ym8fD57TQaFfPwXHnEQHQ0jtTOHEhACYrmL2ZU06asU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=e3OeAfC74li1mJtHeZR88UojvHL0s0g4rgajUh8l/WNSHpEAhA/Kwf000Ab3UmTma
	 kVg4cWtdmFsLc39aNL6kWZvVR4WGFCC50nmhnKb2chpA0tZ99qKSAG1QF6fb6cMwAb
	 Y5ngqRZ4052EsI6I9sb2TchAy/kkrxM5iHEsf5wk=
Date: Mon, 5 Oct 2026 06:07:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 KBuild Mailing List <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Maciej
 =?UTF-8?Q?=C5=BBenczykowski?= <maze@google.com>, Wilson Felipe Pereira
 <wfelipe@google.com>, Wilson Felipe Pereira <wfelipe@google.com>
Subject: Re: linux-next: manual merge of the kbuild tree with the
 mm-nonmm-unstable tree
Message-Id: <20261005060713.afde74805e607478d6bda2ea@linux-foundation.org>
In-Reply-To: <asN8duP-cEdNqP5I@sirena.co.uk>
References: <asN8duP-cEdNqP5I@sirena.co.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 12:31:18 +0200 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the kbuild tree got a conflict in:
> 
>   init/Kconfig
> 
> between commits:
> 
>   d514d23689356 ("init/Kconfig: make config INIT_ENV_ARG_LIMIT user-configurable")
>   9998f5eea1407 ("init, arch: make CONFIG_COMMAND_LINE_SIZE globally configurable")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.toolchain")
> 
> from the kbuild tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating

Thanks.

> diff --combined init/Kconfig
> index 914c4c3ed7ee4,352601b44b5ca..0000000000000
> ...
> [250+ lines of diff]
>

yikes.  I think I'll disable Wilson's command-line patches until after
kbuild has merged up.

After kbuild is upstream I'll take a look at resurrecting command-line
patches for a late merge-window thing or I'll bump them into 7.4-rcX. 
Probably the former.

kbuilders: please try to merge early!
