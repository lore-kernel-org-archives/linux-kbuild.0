Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4CB4CCDFC;
	Thu,  3 Sep 2026 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419353; cv=none; b=dr/8NVRv+e0QvMRcDOHExJUxMWFZC/6Xj/w9dIA1eoNLlZa/eQ33AOyNxbxmZ7hEAYM6NlxMM4MgRelsQtbswzHEnqCMutldoFXXhb904CtTt7g2E8WEzBBUZXkckOlb/NmVQQ3NhuyPqvo6MNsbGKb+uVXzbcwMuUSX7kQU+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419353; c=relaxed/simple;
	bh=7xrKsCn9i8xmG7mXfmJas4K9sELWuK6QA5ETBRy6tcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeUKl/QdyC16sXLP97zfULXesATs4PLhQN5P/f2W8xlGpNH6Ip9Op1U4Tlzgpj1zasXAsDCo5UAqZqhxcee8UcpKNvWizl8OTRWoJgaRUksJkr4fxqnbfeGoCQQo/BO1MDEOKeOu0Zg2niIXUF8cSrW6h5IwiP2vGxYT0uHzhpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EIEJ6KEv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BaPN1347; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EIEJ6KEv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BaPN1347"
Date: Thu, 3 Sep 2026 09:09:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788419345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVfBN4hb5Gtl4fERfYgGlWXpHR/oRgkFxPsAM3ItUIg=;
	b=EIEJ6KEvsFraVbUqtBwxwucdP3M0qdIWGWJz3BBAnUVUfg/K3JhyfpiRFhgPTc/1wI2vNe
	hAZqcZT0zUWZgBXnYvSTvzx3Tj6MausKaqcIe2wJzE52oNB+wg3zBjrwtiFtrOkKH/dOeZ
	lXCzokgg3xDOEMa8aDTHjr7gzC1vRUdhUDy0Bjn13ho1B+Qxb6D9D1Hd69+s7J1Gh3Dmz+
	8e+UW+88xuN95zjmVbWex3Ttu6JOVXNwMHpEkTpmr0gmeTZpZcgcDdYeRE91BqumxIs8zI
	dT+IAU3zeIPyNgjkYvG6vT9wh9MsCQsNWuzQYpfEcLX7hSdac7QXJZO3HkQACg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788419345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVfBN4hb5Gtl4fERfYgGlWXpHR/oRgkFxPsAM3ItUIg=;
	b=BaPN1347NwtWhB4hX9YJKcrZ5kuR/IVHMI1vt6djzi2y4zFQrBbnHso4590KAjGkFXSBVd
	tA0gUMwsoRvmgjCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] kbuild: don't delete in-flight filechk temporaries in
 asm-headers
Message-ID: <20260903090632-3c762481-c3ed-477d-851b-0703e7bffcb8@linutronix.de>
References: <20260902161347.4163577-1-vlad.wing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902161347.4163577-1-vlad.wing@gmail.com>

On Wed, Sep 02, 2026 at 09:13:47AM -0700, Vlad Poenaru wrote:
> Commit 2d69b891e646 ("kbuild: Support generated asm-headers in
> subdirectories") switched the stale-wrapper sweep in
> scripts/Makefile.asm-headers from $(wildcard $(obj)/*.h) to a find(1)
> invocation, so that generated headers in subdirectories are considered.
> 
> The two do not match the same set of files. Make's $(wildcard) uses glob
> semantics, where a leading '.' has to be matched explicitly, whereas
> find's -name uses fnmatch() without FNM_PERIOD, so '*.h' matches
> dotfiles as well. filechk writes its output to $(dir $@).tmp_$(notdir $@)
> before renaming it into place, so such a scratch file, if it happens to
> exist in $(obj) when the sub-make is parsed, is now picked up in
> old-headers. It appears in neither generic-y, generated-y nor syscall-y,
> is therefore classified as unwanted, and cmd_remove deletes it.
> 
> On x86 this races with archprepare, which lists both asm-generic and
> arch/x86/include/generated/asm/cpufeaturemasks.h as prerequisites. Under
> -j they run concurrently against the same directory, and the build fails
> intermittently:
> 
>   mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.h': No such file or directory
>   make[1]: *** [arch/x86/Makefile:269: arch/x86/include/generated/asm/cpufeaturemasks.h] Error 1
> 
> The same commit also converted the generic wrapper rule to filechk, so
> those wrappers now create .tmp_*.h in $(obj) too and can race among
> themselves.
> 
> Restore the previous behaviour by excluding dotfiles from the sweep.
> Subdirectories, which is what the find(1) conversion was for, keep being
> descended into. While at it, quote the -name argument: it is currently
> expanded by the shell against the build directory before find sees it.
> 
> Fixes: 2d69b891e646 ("kbuild: Support generated asm-headers in subdirectories")
> Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>

Thanks, and sorry for the breakage!

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

(...)
