Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227242;
	b=XA4fnzLP1BjlEAB4ZVle/FOC4wQMngyeH5PTIvICfdfYdg7Axqos15v9nquAn+/RmG/R
	 0tHjMbx10XinIp8uCw6FACSYcJCevOJR8lieTyJ1/DJPS2PBNNu+e7vVu3/fXmJCOWgyy
	 XyWcG6MPGP2q+EH+qyej8HI+CrMZmej5Jk4Bdhbe8vtcwoDGPCdvy7guBAWRWofhrRrJ3
	 lAu2QfVtsOQONmohAQI8jmId1zlxMpTrErqIzDnnhkGUXrMRPB2/KDpOd1ALQ1K3gpj9U
	 G3eSmTP5ENaosFvtsDcQBS9JeoWu0qvvfQf6pyO5CY6BLwQyFWhv5IfQX8Q+Hky5+sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=K0RzOFqw3ykGjkuUJuIDL3O21z4QTmBT64mYtINqGgo=;
	b=iLe2UG4IyyacSKbsQ1nuEq4blapQiFxDE6IOqdSXvJnqRYz87YTSYx5OP7x+c35wY6go
	 xHziIMAMc5oD8pu5tbMZqKqL3ljp+vG4n1KkORtMYQcuCIrFBl4aECStpda32I3naeN+b
	 WSd2EXRQ69pKNX37hfbr1B2uLxHPQ+foBLmcXKu7KmVxduK3wIo+qkCWx4vGlNJC6Rolu
	 hamM+KIW1ESnGQYU2z4CqlDF86acTc05V/KPufEG60TIu+Tfp8eFCxYFN0xPzYQuq4rsz
	 euPaFTrCV6LL/9IkIZJ7WOiOr9FLJhJrLg18DbH3bvIq/AQqtALpDualj9yI79ZcixA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=BBErKR4G;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C447D606A321;
	Mon,  9 Nov 2026 12:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C447D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=BBErKR4G
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jNTYs122wz5y7Y;
	Mon,  9 Nov 2026 13:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794227233;
	bh=wqL8KYIbugnoqc2Han7wgsJErL3QSM2VLbl8uKbz8T8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BBErKR4G/mT04zHt3fmDWZhC9gnt4BwgmBv7HFHEF+4qVtHk6SQzwoUg3jQl2uh7l
	 8EUnSSFXQ2RVprxBFie/Em405JehZHTx/tZdInHDDJqbIEIIkFOgUH3Dx0Q1U6dGFd
	 OHiZ0zratfNWD2FhC90RPiqXBI20krrN/VlXig83twA7WCYAFPAVywkpNkhxA1caRe
	 8h9hmdU9x/56vvWLtm8ad+l1XCFwJ5XsZsWKxwyJKq9z1GIRdpmOqYlEa4VM0wb98C
	 APH95Syf/Jr510rcyZNzfo6Vw4K7Kt/8EDkpzZH+O7lUCeH1QLl/lv7Nyp2xf++BQZ
	 iUhqz9rXw/dsQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jNTYs0KLZz4xhv;
	Mon,  9 Nov 2026 13:27:13 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jNTYr0X3dz8svY;
	Mon,  9 Nov 2026 13:27:12 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id F163A5F9CD;
	Mon,  9 Nov 2026 13:27:06 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6fac8906-e96c-4241-882a-736c37b77004@leemhuis.info>
Date: Mon, 9 Nov 2026 13:27:05 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] Documentation: admin-guide: Add kernel
 minimization guide
To: Matthew Weber <matthew.l.weber@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com
References: <20261105013823.29741-1-matthew.l.weber@gmail.com>
 <20261105013823.29741-5-matthew.l.weber@gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20261105013823.29741-5-matthew.l.weber@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179422722745.1114344.12801928132550201547@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: F163A5F9CD
X-NC-CID: RMNWfDgRRosEO7ixJ1IrbhCjVu9ceQGZaKU3SvOwuK4mulfHws4=

Lo! Thanks for this. Just a few things from a very quick and incomplete
look at it:

On 11/5/26 02:38, Matthew Weber wrote:
> Add kernel-minimization.rst to the Workload analysis section of the
> admin-guide, for application developers and system integrators who need
> to trim a Linux kernel for a single known workload, for example when
> analyzing the kernel for safety critical applications.

I'm not a native speaker, so take the following with a grain of salt or
maybe even ignore it:

"Trim" to me feels like the wrong word for what this is about, as I
associate it with something rough where you don't have to be that exact
-- like shaping hedges, mowing lawns, or cutting hairs/beards. So it
fits for what "make localmodversion" does if you ask me.

What you do here seems to be something that is finer and more exact. So
I'd use a word like "tailoring" or "custom-tailor" here. Maybe even
replacing a few or most "minimize" (like in the title or the filename)
with "tailoring" might be a good idea, as the word also makes clear that
this is something that takes some thought and work.

Maybe that is just nitpicking, but sometimes the right words can help a
lot in getting the right picture in the head of the readers.

And native speakers: please speak up if I am telling rubbish!

> [...]> +This guide builds on, rather than repeats, several existing
documents:
> +
> +* :doc:`quickly-build-trimmed-linux` for the mechanics of getting, building,
> +  and installing a kernel. This guide assumes you have followed it at least
> +  once and reuses its sections by name below -- in particular its "Download the
> +  sources" and "Define the build configuration for your kernel" steps. Note

I'd repeat those here -- either completely (with a brief note that they
are copied from there or something like that) or just the core commands
one has to use (with links into the other text to the more detailed
explanations).

Yes, like code duplication it bears it risks. But not duplicating also
has them -- and here it make things hard to follow for a relative small
gain if you ask me. Maybe a few internal notes in the relevant files
along the lines of "this para is copies over <to list of other files>,
so when updating it, ensure to update it there, too.

> +  that guide targets a kernel built **natively for the machine you are on**; the
> +  cross-compiled, boot-in-QEMU angle used here is the main thing this guide adds
> +  on top of it (see `Building: native vs cross-compiled`_).

Maybe some of that should move over? Or to
Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst ? That
file and quickly-build-trimmed-linux would need to me synced again
anyway, but that is a different story.

> [...]> +Baseline scenario
> +=================
> +
> +The walkthrough assumes the simplest possible launch model, which keeps the
> +chain from "what the workload needs" to "what the kernel must provide" short:
This made me wonder if this document will clearly separate "What a app
needs from the kernel" "what the kernel must provide to run on the
hardware in question", but maybe we get to that.

> +Prerequisites
> +-------------
> +
> +Follow "Install build requirements" in :doc:`quickly-build-trimmed-linux`
> +for the native build tools. On a Debian/Ubuntu x86_64 host, this example adds::
> +
> +    sudo apt install gcc-aarch64-linux-gnu qemu-system-arm file

Maybe it's just me, but I hate it when software or docs assume just one
distro/distro universe. My brain always reads some bias and limited
testing into that. And every time I tested my own howtos on another
distro universe unfamiliar to me I found important details I got wrong
or missed. Which is why I think it's definitely worth at least testing
and mentioning one other if this is to me merged into the kernel. I'd
suggest Fedora, but that shows my bias. :-/ And maybe I'm asking to much
here, maybe others don't care that much about this as I do. And it can
make things more complicated, too, so maybe it's a bad idea overall.

> +Iterate toward minimal
> +----------------------
> +
> +Pick a direction. These mirror the two bases the trimmed-build guide's "Define
> +the build configuration for your kernel" section describes -- starting from an
> +existing (large) config versus starting from scratch:
> +
> +* **Top-down** -- start from a working configuration and remove features,
> +  re-testing after each removal. For this arm64 QEMU example, build
> +  ``defconfig`` as the baseline::
> +
> +      make defconfig

Wondering if "make kvm_guest.config" would be better.

> +      make tinyconfig

Wondering if tinyconfig is a good idea security-wise these days: does it
(and defconfig/kvm_guest.config) enable all the security features
typical distros usually enable these days that you might even want in a
custom-tailored kernel?

Overall it got a bit hard to follow at this point -- but that might be
because I ran out of time here, too. So didn't look at the rest. But
maybe that helps you somewhat.

Ciao, Thorsten
