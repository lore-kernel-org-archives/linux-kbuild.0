Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347AF2F7EE9;
	Tue, 29 Sep 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691894; cv=none; b=thBVnqp19AUQe57+uKPMuxfHTfEIh+5mA3AtUgZjEj/BSV/H25IqWHHU5UMzwrGEn7LnnAcF3qmDYrRfFWw5r1049zdu/lJsMLUcAdX524uFqE9xvo7on4uIEPjv/LMVZplfR0KdQXdYLYBo3E3wD41icx0BZ4eNT+apWi75uuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691894; c=relaxed/simple;
	bh=2LyAf1a8toXZQ9cCJbGTwyXsOwJuoiFPfdbF4u5/Ir0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJTwI1z0vxDkHIxSmZ3U2Dc6uSwEXlJY5Sj4BSjXzFLsSFbsXJ0JvmgxJ6d4tWOk0H3NyBds3NadJ7DiAUwGYMtavNd1QLbUWLhh7sX821u/Tva30zj3LYpctJpB/nZaZlo+IF8hrf83LjmUNHgGa0EtZHGLxlmTESqIAKxs21c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FpGia1pU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FpGia1pU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=S108zhyFgrWupBnxwjXeQHMSDadfxPXX2/f8wZjphW0=; b=FpGia1pUEKUyyLiJ/s77zVQByE
	R2djtHe+L/OTqu+78ZMdMtGmyIsy+yF9m038TMkyVLXn3JdK6CNZGYTduvreLZfONkv0HVnaiXlYy
	zphDLBzKbnF5kMyDV+voJnOSa5e0jLcPS8060S+BETsPDBGnBZEUtvEfPyMpxxRVSvcZtwi7uQT41
	MeSeHUSurfKJHxl5ozVP+e/VKm5F1P05DsEHu3xDrklm7XlUxi9nQLYSIldqG8PbvnRsXoYFsi93f
	h5+uGYBakygOCU0VOTcvd61E+kAGkuPWpJqwDBLmjY8mR294N7SuUq6CnqcirZ+pVcRo5vK5BRrF/
	rP36JT0A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYl4-0000000E75a-3YGc;
	Tue, 29 Sep 2026 14:24:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B830C3006DD; Tue, 29 Sep 2026 16:24:36 +0200 (CEST)
Date: Tue, 29 Sep 2026 16:24:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sv@linux.ibm.com,
	alexandre.chartre@oracle.com, alexghiti@rivosinc.com,
	aliceryhl@google.com, ardb@kernel.org, bp@alien8.de,
	chleroy@kernel.org, elver@google.com, ihor.solodrai@linux.dev,
	jpoimboe@kernel.org, kees@kernel.org, legion@kernel.org,
	lossin@kernel.org, maddy@linux.ibm.com, masahiroy@kernel.org,
	mpe@ellerman.id.au, nathan@kernel.org, npiggin@gmail.com,
	nsc@kernel.org, ojeda@kernel.org, pmladek@suse.com,
	rostedt@goodmis.org, tamird@kernel.org,
	thomas.weissschuh@linutronix.de, thuth@redhat.com,
	yuxuan.zuo@outlook.com, sourabhjain@linux.ibm.com
Subject: Re: [PATCH v2 3/6] objtool: Fix "can't find starting instruction"
 warnings on vmlinux
Message-ID: <20260929142436.GB88198@noisy.programming.kicks-ass.net>
References: <20260929055138.43489-1-shivangu@linux.ibm.com>
 <20260929055138.43489-4-shivangu@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929055138.43489-4-shivangu@linux.ibm.com>

On Tue, Sep 29, 2026 at 11:21:34AM +0530, Shivang Upadhyay wrote:
> From: Sathvika Vasireddy <sv@linux.ibm.com>
> 
> Objtool throws a lot of can't find starting instruction warnings
> when run on vmlinux with --ftr-fixup option.
> 
> These warnings are seen because find_insn() function looks for
> instructions at offsets that are relative to the start of the section.
> In case of individual object files (.o), there are no can't find
> starting instruction warnings seen because the actual offset
> associated with an instruction is itself a relative offset since the
> sections start at offset 0x0.
> 
> However, in case of vmlinux, find_insn() function fails to find
> instructions at the actual offset associated with an instruction
> since the sections in vmlinux do not start at offset 0x0. Due to
> this, find_insn() will look for absolute offset and not the relative
> offset. This is resulting in a lot of can't find starting instruction
> warnings when objtool is run on vmlinux.

I'm confused; decode_instructions() iterates the section and inserts the
instructions at the exact offset it finds them at. Therefore it should
be able to find them again at that same offset, irrespective of the
actual start, no?

> +			if (func->len == 0 && is_notype_sym(func))
> +				continue;
> +
> +			func_off = opts.ftr_fixup ?
> +				func->offset - sec->sh.sh_addr : func->offset;

function offset really should not depend on opts. It should work
irrespective of any option, no?

