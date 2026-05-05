Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8747E48C415;
	Tue,  5 May 2026 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997849; cv=none; b=KixyFhWcTZoUAYylLZo/pRTiuOjsuJwBkCEx5rvfOkWX2Sh/OcpiaIRQgWzxfBreqLuimU0tHQlUrGejqxPt9X8TYo4NzpDZrhATjA3n/U52eu1ZcxP768Ww3AcgEtuqxV1v+yCe6l0dmlybMIEEFt70CH1Q7g3nFr031wVDke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997849; c=relaxed/simple;
	bh=ImitdmfyrLnPZx2shpCjqp5BsRTgtqtIPUUqMSOCi2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLP/spc/ENXFVfRKCrdwhu2KLVLRw0RgJGm3qnnKTCNwyeSUp5KU63puAGfCF/cEmF7aRyXJUh8v5jQE30gDPAnNtnf9MSYxT3zgvYCqeczxLAYweC3VXxbVhQYbBuULgcaEnKX6NLMj59X7gBwz/Ob7UrJS4SgYCuc/6Y3mA0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 645Fv4oO164706;
	Tue, 5 May 2026 10:57:04 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 645Fuwtk164700;
	Tue, 5 May 2026 10:56:58 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 5 May 2026 10:56:58 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, nathan@kernel.org, nsc@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, jpoimboe@kernel.org, ojeda@kernel.org,
        masahiroy@kernel.org, lossin@kernel.org, tamird@kernel.org,
        thomas.weissschuh@linutronix.de, rostedt@goodmis.org,
        ihor.solodrai@linux.dev, thuth@redhat.com, pmladek@suse.com,
        aliceryhl@google.com, elver@google.com, kees@kernel.org,
        legion@kernel.org, ardb@kernel.org, yuxuan.zuo@outlook.com,
        alexghiti@rivosinc.com, alexandre.chartre@oracle.com, bp@alien8.de,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/6] objtool/powerpc: Add build-time fixup of
 alternate feature branch targets
Message-ID: <afoTSvawD4CXCCy1@gate>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505144539.GX3126523@noisy.programming.kicks-ass.net>

Hi!

On Tue, May 05, 2026 at 04:45:39PM +0200, Peter Zijlstra wrote:
> On Tue, May 05, 2026 at 02:16:23PM +0530, Sathvika Vasireddy wrote:
> >  	switch (opcode) {
> > +	case 16:
> 
> Like case 18 below, this wants a comment describing which instruction
> this is; bclr ?

Yes.  It is 19/16, b[c]lr (primary opcode 19, secondary opcode 16).

Where is it described what INSN_RETURN actually means for objtool?  Not
in the header file :-(

For PowerPC, all three of b[c]lr[l], b[c]ctr[l], and b[c]tar[l] are
indirect jumps, to an address in a register.  They do absolutely nothing
typically done in a function epilog, like "return" insns in some other
archs do.  But the BH field ("branch hint") in the instruction helps
predict the control flow involving the insn as something in a call and
return pattern :-)


Segher
