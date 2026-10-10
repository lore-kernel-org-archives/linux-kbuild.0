Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E874332907;
	Sat, 10 Oct 2026 04:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791606512; cv=none; b=KSr+E/q7yysremqFI6TIxSPqT0L7FD6RzM1GetVtkSkaTowyztCfQjD8gOT4Ky4trlSnyPOhu+birbHoejWlqVcKZ7eYIvvr6Y7nLyuA7Y4xzdOCM/D+HrTyFZd/QlrWBmM42qnzfe5a4wAZGsV2vFAUB1SLeIM2a/cC4ilVFK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791606512; c=relaxed/simple;
	bh=qLa17zDzqAWX06CSTIht6/3ZKuRGd3pqG1TQ6XIR/Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ol8V0yvhDGRXknzfokzzDgrntGkNHmxsyO26UCDG4P3L/hH1qJPDwFELHn21Oo+Ozt27ePI1g4SogYImTm/AQldCgyfEikz0IVJ/V/2cw5jCVy6t1kcGyNVZAn+bafejFDAjpAn0FLTiu/0+Evv8hgw7sw1bcDLn5YT6QUmHLGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcsbVGhx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcsbVGhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970E01F000FF;
	Sat, 10 Oct 2026 04:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791606511;
	bh=ZZTc9D1V8A2+OS/p3LTBWh2BWyf0o66OW3k/3rcAAuM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=kcsbVGhxmyULjTAHnqJr9seeINcnzWsxe3nH+clEfYzFRGZVnQi6rpqKYFR/SfGp2
	 3ZjFAp2T2Lsj/ElIcFcC8bg6ypaGzUaZKkJdX8uNOCgEy7UbziEFgA7w7H77wizOPs
	 qa65UMKUiZJ9e/R9vJN+AbAG0m5yIMhiWPwae5WGucWVFfsS/wgDDpAtkfe7lmeGiz
	 aewAlRW6XkiDDDCkTt2tz6kcnqCK18pWnk3XRUAxpd/o/99Yf3JhnsH1OitGJ1lHRr
	 2DB12g294SqmGphqJ59N+AxmtOceKIpaWyewKoKlob/RtsvSlL6dO0UPW7ecDTZF2k
	 YbGaUJMFRbTqA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 651BBCE0D77; Fri,  9 Oct 2026 21:28:31 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:28:31 -0700
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
Message-ID: <62bd2378-d908-47fc-8c33-4e2f8dc04920@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <0ddb5e5e-f801-444c-aa98-0cfe814a3026@paulmck-laptop>
 <202610082200.752C6C08A5@keescook>
 <51aa9736-6e78-40db-9d4f-95dc7142e222@paulmck-laptop>
 <202610091922.19792FDA8@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610091922.19792FDA8@keescook>

On Fri, Oct 09, 2026 at 07:23:29PM -0700, Kees Cook wrote:
> On Fri, Oct 09, 2026 at 08:57:02AM -0700, Paul E. McKenney wrote:
> > On Thu, Oct 08, 2026 at 10:11:14PM -0700, Kees Cook wrote:
> > > On Thu, Oct 08, 2026 at 05:56:21PM -0700, Paul E. McKenney wrote:
> > > > Building a kernel on CentOS Stream 9 from next-20261007 and next-20261008
> > > > (and maybe others?)  on an x86 or arm64 system results in a strange
> > > > build failure featuring:
> > > > 
> > > > WARNING: Unable to reopen jobserver read-side pipe: FileNotFoundError(2, 'No such file or directory')
> > > 
> > > What are your make and python versions? (Oh, the answer is going to be
> > > "CentOS-patched make 4.3")
> > 
> > I get "GNU Make 4.3", so maybe I need to patch or upgrade or something?
> > 
> > And "Python 3.12.15+meta", so maybe I need to talk to people here.  ;-)
> 
> I meant, it looks like CentOS has a patched version of "make". But I
> think that just changes the nature of the bug; it's still a bug that
> needs to be fixed even with unpatched "make".

Whew!!!

And thank you very much for looking into this!

							Thanx, Paul
