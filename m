Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1CA224AF2;
	Thu, 15 Oct 2026 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071406; cv=none; b=VsK199vZNORTaLsA8HrPKuvcy2CnvS8fiQqdewFTRqy1TUE34VQJfPd9v7QDPvOau1DU31kFJI54fAEfIzUQt6nMsEWrjO/cyMYoPbtXC+XaZiKPpDuxBBhqa8LWL9EiuRBkAgErqGLMkp3RnFSzZWUnNuZDzZYTuV1Ev/Dkb8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071406; c=relaxed/simple;
	bh=w5JO+zmWfR8jUGFTIlWctYX96udREVIpLX8l3C1BYZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSDnIIhoTdpNu4wboaAJtejWmfeVvYdv56oNK9XhTavXnzSNp6vGexGIf4IKJ3jvp8+Ats6PZv8lanPw2KZoKH0YVSxnleezqtTW1EgOsa5iDzgNYcwUNJiQ8f/licEzUb355QfIfNeLQ6Cdn9XMa4pF5jQh/nncMleqB+esobE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUDKrIAI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUDKrIAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD08F1F000C4;
	Thu, 15 Oct 2026 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071405;
	bh=t/R4jQwR3q67Bq6d2+JG5pzBdFJFv1FBilnObRHWmwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JUDKrIAIevUjJIalLCzuO9PSfmgIrjy+SnkMXWX2snIbLbCO7/POOH7K4XGuiSurT
	 ApiYm4r5MkCLrNt2NJ+e4ltC5Un1IBXAx2qMJtS+au9Ey8Y6HRuqDYRTKCYgegiGKJ
	 GVsZbN087qEyYPM46OqVOHwUqSOBKA/ZVQJXPe2d8RDbL8UIXDqrmoIbrf7efxbWsD
	 gAuSONSFF3wHoj6AfuZFrHdXc568QFZ+5MvNJUGmAs2B1Xvp/ewakUcAevJoqNTglO
	 IcVMSC1Y8DwyX9JlW0o2CLIzFfw/U/ld3qF6CTphzRQsv2dtjn0K9xk5A7YCVdKhib
	 rOSjlnO8kPlpQ==
From: SJ Park <sj@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: SJ Park <sj@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: kernel.org container images
Date: Thu, 15 Oct 2026 06:36:37 -0700
Message-ID: <20261015133638.86959-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <01a87de4-8de5-4ff0-941b-2e5932a3a19c@gtucker.io>
References: 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 14:30:48 +0200 Guillaume Tucker <gtucker@gtucker.io> wrote:

> Hello,
> 
> We discussed the topic of managing container images on kernel.org
> again at Kernel Recipes last week with Konstantin and Arnd.  The
> idea is to provide a set of reference images with kernel.org
> toolchains which developers could use via the scripts/container
> tool.  They would provide a common denominator to facilitate
> development and reproducibility.  These images would of course not
> be tied to any single tool and could provide a basis for CI bots
> such as KernelCI or tuxmake.

I run a few humble and hacky build tests on my local machine.  I also want to
do the build test on more setups including rust enabled build, and on more
machines of different architectures.  But I'm short of time to learn how to do
cross build correctly.  The Rust for Linux training at LPC helped me doing rust
enabled kernel build for the first time, though.  Kudos to Rust for Linux team.

I am therefore considering options including use of the scripts/container tool.
I was unable to find a time to do that so far, though.  Having recommended
images in kernel.org will definitly help me prioritizing it.

I also find opportunities to use the images not only for build tests but more
use cases including benchmark runs.

I just wanted to say thank you for developing the tool and this kernel.org
registry initiative.  Looking forward to more progress, and I will also try to
find if there is something that I can help.


Thanks,
SJ

[...]
