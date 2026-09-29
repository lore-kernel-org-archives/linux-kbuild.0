Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8185552CCE5;
	Tue, 29 Sep 2026 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691202; cv=none; b=Dz9fFsG5lS2DqblEhfBFquDvXLfoJ8JSSjd/ywQfTM+iMG06wJcw0REKqjCvmsi8UbFSOadVorVoVNaph2y/mtXow1SqHYU8Px4ShyDzvyzHMu7XLBcAXNl0hqXHufEJNEDmhTBFwqPWbazbmxQXgveUC4I/qSl1IpoQ/ioN6zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691202; c=relaxed/simple;
	bh=cOZLqYVdqh5xtDe0mhhkYGF6lUySS9B6d2Ci3uEIV7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaUWqSd70dVeSBRuMk5WbFOmI8OGNmC8cGrAdwVMA9CcAN1187Pv6iV4iXGNFNgMsg+9zXveXUUmk36M9IrOzZa9RwUK9O2Uffi9B1bAWGrHl/op1RC1fCvX86KqiMzdx0LT/dDEldNhHlt7Cdnp1D9dbIOIqpEGAfU+bh+t+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y0zYeXNw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y0zYeXNw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vmN2npans1p2hiojZm1+Q8GxyaP/JELuYTlJ/y3BRQY=; b=Y0zYeXNwr7kdWeSbBogWYUob6o
	9cgz39NZAJ3Ym9ac2DoumN9NiQS9Qc66DShV8kFzHupTsNsh/oi79uHfX9AyP7dwYG/2t0CgW88/9
	rR6PFkRO9N5jB5CGBxftCd0CZJuKhIzKVcQhghVenshrM1kG962ygGG/J4QEq+wLotuKJx/5ZPmgW
	oAxx0CeooAVBT8LnXo1/DDhWRAm7RCsP2yF4btfDeNNA0jEQZ24jd4GF61M/1tDKtLmd6is9bcR0E
	GK2/o13vz65TlGlLOjV8z2CNacHPx3QOVDX2C5doxYZO4iAMi8nC1jWQIkk37E5CeCJNkSs/4n16Z
	oEVNU/kA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYZb-0000000Dmfz-1vmf;
	Tue, 29 Sep 2026 14:12:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 19C9A300446; Tue, 29 Sep 2026 16:12:44 +0200 (CEST)
Date: Tue, 29 Sep 2026 16:12:43 +0200
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
Message-ID: <20260929141243.GA88198@noisy.programming.kicks-ass.net>
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

> find_insn() is also looking for symbols of size 0. But, objtool does
> not store empty STT_NOTYPE symbols in the rbtree. 

81cf39be3559 ("objtool: Add empty symbols to the symbol tree again")

