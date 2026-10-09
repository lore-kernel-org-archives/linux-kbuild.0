Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0564F3DAAB8;
	Fri,  9 Oct 2026 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522676; cv=none; b=Z8G9uI7v6L8yJSYkq5Kn3flLt1uCiW1Qw0RZ5UP6Y8uQPFIUosDmVolvIDSneXRDkDFZpD1K9gZKYsMpco/KyI3fFkThX5SWApHqkhcsD/fichp/NwyAdRDzYMdiYlPOJm/Xd/vfIzDuiSFEcYkJx8vbLo/uE/mUop7+4qPP1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522676; c=relaxed/simple;
	bh=RzkyiB51qcBMO9M9pe/skL3kPgqjbkSNBulhFPoDd80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwo6Oi2m5DTnsVjcokZhEoydNOKIJaHB8YJ2EbM8WweOvs+YRnMjL21K5gG0VaEYm5hx0UDJXTqZVUQgj6Cku37d8oM6YOfbVSOyhfrxR5ehleOwM0H0e8jM9D92u8XnmWllFUIY1+TDzqZ5AiYGl/igGk06VRj6AFSxQngarZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8uiIdEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8uiIdEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0FD1F000FF;
	Fri,  9 Oct 2026 05:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791522674;
	bh=iIl2Cg3RK/sSQdjUu8PWtqQJorCmflCcV7loVaKT08s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B8uiIdEZtT5l8fJqbwJZ3epIk/LuQCZNjgx7+XWz+f6NcDedzqismbSB7oS7ckwL2
	 4UiFs+6GvlLCUujipOaktLe7HMTk8Qaka7QiaqDeQdnJbfWinFd9Er+6ScUCYkJ2R8
	 6B2h+MSKe8q+ZtKlXP2lfEMRzSdrllKQd/vCUjPusP/NSh7J/O1TTtOmF9ug6Rey1C
	 JtzAkZ/fdL5wny0HDue3cvJyTy3miIy2nStVtQVt3Vua7MKGFcExldGDBrC3UJNK+S
	 is3anucNfefxptlwbf4uOyHcTktwmjp9PVANNOOPKx0BpJPOVruq9Vc+fLmMy4gvOl
	 D464FsKUEDE4Q==
Date: Thu, 8 Oct 2026 22:11:14 -0700
From: Kees Cook <kees@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-next@vger.kernel.org
Subject: Re: [BUG] Build failure in next-20261007 and next-20261008
Message-ID: <202610082200.752C6C08A5@keescook>
References: <0ddb5e5e-f801-444c-aa98-0cfe814a3026@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ddb5e5e-f801-444c-aa98-0cfe814a3026@paulmck-laptop>

On Thu, Oct 08, 2026 at 05:56:21PM -0700, Paul E. McKenney wrote:
> Building a kernel on CentOS Stream 9 from next-20261007 and next-20261008
> (and maybe others?)  on an x86 or arm64 system results in a strange
> build failure featuring:
> 
> WARNING: Unable to reopen jobserver read-side pipe: FileNotFoundError(2, 'No such file or directory')

What are your make and python versions? (Oh, the answer is going to be
"CentOS-patched make 4.3")

> The failing systems have a pigz command (which complains bitterly when
> run without arguments), and the immune system does not.  On the failing
> systems, "pigz --version" gives me "pigz 2.5".
> 
> Do I need a specific version of pigz?  Does this commit need a
> version-number check?  Are my systems pigz-intolerant?  ;-)
> 
> Less flippantly, is this a known problem?  If not, what debugging
> information can I provide?

Having pigz just means the parallelism logic kicks in, so I'm suspecting
something in scripts/jobserver-exec. That would point to something
specific to python or make.

I haven't seen this reported before, no.

Ah, and before I could even finish writing this email, my ever helpful
LLM has reported: "pre-4.4 make (like CentOS's 4.3) closes jobserver
pipe descriptors in non-recursive recipes but still exports
--jobserver-auth=R,W via MAKEFLAGS, whereas 4.4+ uses a named FIFO
instead, explaining why it doesn't appear here." And has further found
that this is CentOS-specific, since they appear to have incorrectly
backported a patch ("make-4.3-cloexec.patch"), as stock make 4.3 doesn't
have this problem.

I'll go figure out if there is some proper way to work around CentOS's
broken make...

(And given this, I would suspect you can't do a '-j...' build of the
"htmldocs" target either?)

-Kees

-- 
Kees Cook
