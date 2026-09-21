Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E2389114;
	Mon, 21 Sep 2026 19:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018661; cv=none; b=hSIjnWtHrM31Ae7KuqDLjoQDsYvNY2/VmR68omr4FMrfBlxAs1/A5qhM9TNt7a4R1Ooz8Tfk5TR2iS6bOvhMkm6UrJq7ejwXQU3C6gexQdmam6WBKpBPcpNvpfMZ/GvhNY5tYbHAh5wiTFdQxMw5jdholsXCP/h4HIVsD6/UhRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018661; c=relaxed/simple;
	bh=3/QrBg70Tf3/O+uM6HFgxQ6ZmwiYPIdzQnJ9xK56ymw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIQ84x+5y+IdchCZm5vYcNXUAzL+wtmuq55Bgv7Y6nrOpbBLtkltzz7mqroAwBzXE9soVAOShVOq9LbD+Y4MTIAhTcEuNIhcC/lpoVL+kStibxVdrowGLbV4dyAFw+lL8278WRFk8O1zd5rrGigg09aAqy6s5tIwJlb7u/ElBqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m9AP3dUp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m9AP3dUp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=eFUPaANFoDFNOYt9UreR4DTZ8ERA7Hd3xPzm0VcHkU4=; b=m9AP3dUpFsmELRt1UZ51/cooba
	zhzb9vh//xqhu3gPEhtBvir7p1yDMUxxJcCRdjbWFhnSEfQUSqYeW2n2b/U9s99R/EFAWALe5FGud
	SMi/cl/70zZauRtVX9ygUUV4/duAdxGLoY/E2y7pNUVTvbSQiWRWI/SMj11bTrJjX1/AYEx8RXIvH
	fG9CN2a9J/hITk9JLUNXf+/5QnNWua70xCNzbKuzIvDby0qNgn4YRhDpsWlhQV5uD/UB5H7efwaQ3
	gwksWZO0K6fCx90IVBHZbDeS+iGLZk/pkPzc8BuDF6pDD6eirhiHp99EOJ45zUp/v8FrluRAyUm76
	sjz4Oybg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jcX-00000003DrZ-3gp7;
	Mon, 21 Sep 2026 19:24:09 +0000
Message-ID: <e08514b5-87f6-4a2b-8080-7d7d8e802f99@infradead.org>
Date: Mon, 21 Sep 2026 12:24:08 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] README: rename to README.rst and make the doc
 references links
To: Osman Ahmadzai <osmanahmadxai@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nathan@kernel.org, nsc@kernel.org, apw@canonical.com, joe@perches.com,
 tglx@kernel.org, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org,
 linux-spdx@vger.kernel.org
References: <20260921050038.76985-1-osmanahmadxai@gmail.com>
 <20260921070556.6909-1-osmanahmadxai@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260921070556.6909-1-osmanahmadxai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/21/26 12:05 AM, Osman Ahmadzai wrote:
> The README points at some sixty files in the tree, but it has no
> extension, so it shows up as plain text and none of those paths can be
> followed.  You have to go and find each one by hand.
> 
> The content has always been reStructuredText - it uses reST section
> syntax for its headings - so give it the extension to match, and wrap
> each in-tree reference in an anonymous hyperlink whose link text is the
> path itself.  The rendered text is byte-for-byte what it was before; only

What causes README.rst to be rendered? Is it named README.html?
I don't see it being rendered on a clean 'make htmldocs' build.

I see DOCS/Documentation/output/admin-guide/README.html, but that's
a different file.

> the markup is new.  Anonymous because a handful of the paths are listed
> twice and named targets would collide.
> 
> checkpatch.pl and get_maintainer.pl both test for a file called README to
> find the top of the tree, and the Makefile points readers at ./README, so
> those are updated in step.  scripts/spdxexclude lists the file as having
> no copyrightable content; only its path changes there.
> 
> Signed-off-by: Osman Ahmadzai <osmanahmadxai@gmail.com>
> ---
> v2: Dropped the second file - you are right, two copies would be out of
>     sync within a release.  This renames instead, so there is one copy of
>     the content, and updates the four places that referred to the old
>     name.  I went with the rename rather than the symlink because it
>     leaves nothing pointing at a name that no longer describes the file,
>     and the fixups turned out to be one line each.
> 
>     I did look at folding it into Documentation/index.rst, and it looks
>     like a bigger change than this one rather than an alternative to it.
>     The README names 55 documents; only 12 of them appear in the
>     index.rst toctrees today, the other 43 being reachable only by
>     descending into process/index.rst, subsystem-apis.rst and the rest.
>     So integrating means either pulling those 43 into index.rst or
>     dropping them, and that is an editorial call about material that
>     landed in b9a565b3e4d8 last November rather than a presentation fix.
>     I would rather not make it as a side effect of this patch.
> 
>     If you do want it, what I had in mind is a short "where to start"
>     section near the top of index.rst - one entry per kind of reader,
>     pointing at the existing index documents (process/index.rst for new
>     developers, subsystem-apis.rst for internals, admin-guide/index.rst
>     for administrators, and so on) rather than repeating the individual
>     paths.  Around forty lines, and automarkup turns every path in it
>     into a link with no markup needed.  The README would then shrink to a
>     pointer at the documentation.  Say the word and I will send it as its
>     own patch.
> 
>  Makefile                  |   4 +-
>  README                    | 168 -------------------------------------
>  README.rst                | 170 ++++++++++++++++++++++++++++++++++++++
>  scripts/checkpatch.pl     |   2 +-
>  scripts/get_maintainer.pl |   2 +-
>  scripts/spdxexclude       |   2 +-
>  6 files changed, 175 insertions(+), 173 deletions(-)
>  delete mode 100644 README
>  create mode 100644 README.rst

thanks.
-- 
~Randy

