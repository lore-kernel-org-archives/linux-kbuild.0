Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9A36B934;
	Fri,  9 Oct 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561424; cv=none; b=IPLwN0dSvHcijLQyVINP+9ZHhjUQeAOCEN+DUt2ZHUgVpTEraF5trU9F0JFuHrsY8IHRlK9JsTFst5fmNYxGxW4xiGb7o8k2UECGB1xfX1eY7HybG8I+mlDQJFlxKM6Kw92BXqMeeCXNBdsSV7KKW+SjhyThlmLeuymWgBm5ftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561424; c=relaxed/simple;
	bh=mVDw3558qi2dmbH+1SMnQnVGN6LG7PdfxcI2x2CWViE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkmuGV9eLAXHYh7vsriQaeIQP5nU2v5MOtoK7I3RY0kgQ52uI1V1YJ5/0xgwiP5/br475HaNS3DN5BjxJdJN24QYDHvo0gaK0l26UsfgYXZZmzmRxZ4WSbVsp3X1Z9mf/oeviUiinpize43ObX68do7/r9i7oruKl/XEijDLsV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfSUF17F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfSUF17F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227F71F000FF;
	Fri,  9 Oct 2026 15:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791561423;
	bh=KuCaZxCYMdZZgfvi4rJIGQNSUWpQj/i0u1SZL9YwMIM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=JfSUF17FIQ5uG0WgMZv5K8JlPGc6Lo0UfZBDoM/LH9OrsUGdFbx4LmEuxkgZYxsZi
	 7uwQzI0RWf7VvVp3UiIXgWXdMZsMpWCCi+eFXZzQ5MJuDrudaKVWa6XjrFbinmLX6i
	 BQhM0qI6lv2pjur4K1esNmz8j+IO3sD0D/FpbrFy3hlgStSiid/Sykt+1oHIiFvXh8
	 t5rcKW0wOEHOpM3EfEPYJVb4HlNHf+QNyIYQAYNi+55C9yBOo97BVA4wjzlpnZ2l/B
	 G7Y5x4mB4IrbM21jjIk1KN5kSxtpJrN5r+FgArJ2ooFrxgcsus3xzk4+hHyut3FJHt
	 WNi41848auhXQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BDF91CE0B28; Fri,  9 Oct 2026 08:57:02 -0700 (PDT)
Date: Fri, 9 Oct 2026 08:57:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-next@vger.kernel.org
Subject: Re: [BUG] Build failure in next-20261007 and next-20261008
Message-ID: <51aa9736-6e78-40db-9d4f-95dc7142e222@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <0ddb5e5e-f801-444c-aa98-0cfe814a3026@paulmck-laptop>
 <202610082200.752C6C08A5@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610082200.752C6C08A5@keescook>

On Thu, Oct 08, 2026 at 10:11:14PM -0700, Kees Cook wrote:
> On Thu, Oct 08, 2026 at 05:56:21PM -0700, Paul E. McKenney wrote:
> > Building a kernel on CentOS Stream 9 from next-20261007 and next-20261008
> > (and maybe others?)  on an x86 or arm64 system results in a strange
> > build failure featuring:
> > 
> > WARNING: Unable to reopen jobserver read-side pipe: FileNotFoundError(2, 'No such file or directory')
> 
> What are your make and python versions? (Oh, the answer is going to be
> "CentOS-patched make 4.3")

I get "GNU Make 4.3", so maybe I need to patch or upgrade or something?

And "Python 3.12.15+meta", so maybe I need to talk to people here.  ;-)

> > The failing systems have a pigz command (which complains bitterly when
> > run without arguments), and the immune system does not.  On the failing
> > systems, "pigz --version" gives me "pigz 2.5".
> > 
> > Do I need a specific version of pigz?  Does this commit need a
> > version-number check?  Are my systems pigz-intolerant?  ;-)
> > 
> > Less flippantly, is this a known problem?  If not, what debugging
> > information can I provide?
> 
> Having pigz just means the parallelism logic kicks in, so I'm suspecting
> something in scripts/jobserver-exec. That would point to something
> specific to python or make.
> 
> I haven't seen this reported before, no.
> 
> Ah, and before I could even finish writing this email, my ever helpful
> LLM has reported: "pre-4.4 make (like CentOS's 4.3) closes jobserver
> pipe descriptors in non-recursive recipes but still exports
> --jobserver-auth=R,W via MAKEFLAGS, whereas 4.4+ uses a named FIFO
> instead, explaining why it doesn't appear here." And has further found
> that this is CentOS-specific, since they appear to have incorrectly
> backported a patch ("make-4.3-cloexec.patch"), as stock make 4.3 doesn't
> have this problem.
> 
> I'll go figure out if there is some proper way to work around CentOS's
> broken make...
> 
> (And given this, I would suspect you can't do a '-j...' build of the
> "htmldocs" target either?)

I will install sphinx &c and give it a try.  ;-)

							Thanx, Paul
