Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F573CB2F8;
	Tue, 29 Sep 2026 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691979; cv=none; b=TdiuTG1c2mHmo1uKlq2nu+qbphEtqYNjwFUCmuHYach0Rd66eKvR1JbLvLgewQ8/Eqn0Q11nbpk0N1Oa4xf2+pWWV0UKZTzP559Foz0vqEHsxkmKd7wGtJqSDbN+eSNnuryWiMZm3N4DlG1082zQQL1Ef9PEJy0Y45nqihLW8Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691979; c=relaxed/simple;
	bh=AI/78WJhD4CPIbJy+nlJpnGWgauJNLp0Y3rc2dalCGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSvJ/izxswyb0DkF6edbutoOY/mYTMV4MF6adY7JyuiIMvmsyiyx6NWrflIVvdsXdVQlDpn0+RHsCCcNhfNX01mCj+TaYxYwDSoBUG5yPXmPwZ2Zi2AIUQiJgjslj/LlERsDq7tOXyNkpQ0q+jJ8TLfcyT05s6nnPPJzZw35gtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ErCl8NV5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ErCl8NV5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8DMiTrHEuHAfAfHczM3479xqIi6gNKMUHt0Q9Yhupb0=; b=ErCl8NV51ZUSe5AJcfBmq4kN8P
	2TLVoAo84HDsopf6r7NEQlOe3C7Ftiy7oukl5U6W+9fgjL5LUeJHnCopcsfjOkQjv/jDlVCv/glIf
	zzwEMZsQV+VhHepotwgXSgbQmidrYM8GJVI6NcTln5piQvcQB87+OFq8Kve0FvVHAp61r4RGLqyiS
	NrHJS9JuMKRMVwiHaSJ0rgKKVkmp05nkJ6E30/FzcBdxkybvkpPlgh4bLNChB0Bo4b05rSMhBb9nH
	PTjWHeBqf4Ed0IsZeNByfu/OkyrsspUCx93ZO5w3XL4pWaTC9LyhBdNR5c6+nDd5hplWza8tCb8F9
	HTPRZVbQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYmN-0000000E8Bs-340X;
	Tue, 29 Sep 2026 14:25:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 48ABF3006DD; Tue, 29 Sep 2026 16:25:59 +0200 (CEST)
Date: Tue, 29 Sep 2026 16:25:59 +0200
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
Subject: Re: [PATCH v2 4/6] objtool/powerpc: Skip jump destination analysis
 and unnanotated intra-function call warnings for --ftr-fixup
Message-ID: <20260929142559.GC88198@noisy.programming.kicks-ass.net>
References: <20260929055138.43489-1-shivangu@linux.ibm.com>
 <20260929055138.43489-5-shivangu@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929055138.43489-5-shivangu@linux.ibm.com>

On Tue, Sep 29, 2026 at 11:21:35AM +0530, Shivang Upadhyay wrote:
> From: Sathvika Vasireddy <sv@linux.ibm.com>
> 
> Objtool is throwing unannotated intra-function call warnings
> when run on vmlinux with --ftr-fixup option.
> 
> One such example:
> 
> vmlinux: warning: objtool: .text+0x3d94:
>                         unannotated intra-function call
> 
> .text + 0x3d94 = c000000000008000 + 3d94 = c0000000000081d4
> 
> c0000000000081d4: 45 24 02 48  bl c00000000002a618
> <system_reset_exception+0x8>
> 
> c00000000002a610 <system_reset_exception>:
> c00000000002a610:       0e 01 4c 3c     addis   r2,r12,270
>                         c00000000002a610: R_PPC64_REL16_HA    .TOC.
> c00000000002a614:       f0 6c 42 38     addi    r2,r2,27888
>                         c00000000002a614: R_PPC64_REL16_LO    .TOC.+0x4
> c00000000002a618:       a6 02 08 7c     mflr    r0
> 
> This is happening because we should be looking for destination
> symbols that are at absolute offsets instead of relative offsets.

Again, confused. We run objtool on objects, this is pre-linking, there
are no absolute offsets.
