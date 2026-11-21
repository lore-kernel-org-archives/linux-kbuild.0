Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304383;
	b=ZqJNXpBabE7TvjP5kuCp1k5O5CtwLyqQCjDm1QPBZcvSHz+pjT5XYhEmDUZAAThElztR
	 5PRIK/XYy/zqgBu8WlEkcg9mMyEpDdGnUdJDY4NhV0CbPYhJIBoH/zbT9TNuQ4xD9ZZLY
	 a+9VSayqhWnCYCVSxrnzeQ2e/4E00cL+1iXW9RfBDfom8JM/vVFH//oVL1CMKK4lxu4QX
	 pEXfNEg0rv13nnCfsWan8zb4+lI66FJvTO+zscGElGYiuNufCK+3fvst309tPOBRLanBi
	 Cpnf2Efk7RaC0M2T4csIMmNJN9eUMwCJSDh9d65pVd85izc3bW5bNGzA7FniuJMYALA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304383;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=XEFK/pjiR6gOPvEjnxDrrcBsl3NrlY/OOSjgIgIAcps=;
	b=dnxME+yb36AlITljdUuNtkXQMsN4wN0hBti5o5IxuoTLOt062L1jEkfOPLlqH6HcMCoe
	 Sdxx1x+9J0ZQ8ErShJ6HRgql79waRsx5a9nJjos9o1aqjp0BZkPHkBfgPgW6Jnc/nouW+
	 raqtnpXtbKoqxKqYjJkP4zAiboQqygGD1YIWmW6U+AM774Masi1scCiklqsaSK3Dqk2NR
	 2kCCwumDKn4Wk1Nkdg+yzSaAHfYx2I3Bb02yY6oj2MECvLYEsuEiVp2/IGOd1+AqlHdRa
	 +C+/pUD7ebK7YSvbjzLo/55H8p9tYFzXWLKYlIJDn17W21fqW0S/29SGvUfJlUY+SKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LW1PpeA2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B4606A332;
	Sat, 21 Nov 2026 23:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LW1PpeA2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1091F000C4;
	Sat, 21 Nov 2026 23:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795304383;
	bh=XEFK/pjiR6gOPvEjnxDrrcBsl3NrlY/OOSjgIgIAcps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LW1PpeA2AV1GUBBWdwfHlHqOqQqoWiinIHIdpxFQz3+auAdvrFg52v239gGKZD/FM
	 fWK49J0Imr7u3HJC99IJP6yXJRB9+poJ4qa7lprQugH0QznGZB9yIWazK7BOB3gvAc
	 A9DGRl7CNvkSPtGsmtaMWWz/67hEu8iZaY0K21JLLCqtzg+qDhRWpRwV4FslrevYm2
	 YsMRgzlzXFBoQ1C6ZgV/0eSTty5NOTaOyZJ83pFVyYVKrkvzUJxDBU6Iu/UMPjzK3G
	 gYucaNuVWNPfn66lcEFXabMv+uZPfZggNYMRx7fibLXB672flAz+DdgCQqO8TNhGJ2
	 CEf+O5JAMhZSA==
Date: Sat, 21 Nov 2026 16:39:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?B?0J3QuNC60LjRgtCwINCi0LXRgNC10L3RgtGM0LXQsg==?= <svet58585@mail.ru>
Cc: Nico Weber <thakis@chromium.org>, aaron.ballman@intel.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittoteggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <kprateek.nayak@amd.com>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yunseong Kim <yunseong.kim@est.tech>
Subject: Re: v7.4-rc2 kernel build failure when using the upstream LLVM 24
 with -Wunsequenced-volatile
Message-ID: <20261121233936.GA2627970@ax162>
References: <624efab4-f1e3-4bd1-8ddc-60bba4b5d798@est.tech>
 <CADZ1XiZG1y=rC05L4K3_5E3FdRR3Et+V3f8gBs9tih5rPCCv_g@mail.gmail.com>
 <1795284838.9252953@f702.i.mail.ru>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1795284838.9252953@f702.i.mail.ru>

On Sat, Nov 21, 2026 at 09:13:58PM +0300, Никита Терентьев wrote:
> By standard UB occur for unsequenced order, not unspecified.

Ah fair, I had conflated those.

> But despite the fact that this is not UB - fields a and b really may
> be different, moreover, according to the standard there is no
> guarantee that a less than is equal to b, and this is most likely not
> the expected result. So I would say that this is incorrect wording
> but this is a correctly issued warning.

Yeah, I think it is definitely ambiguous what someone might be expecting
there: are they expecting the same value or are they okay with the two
separate accesses being different values? It is not always obvious if
the variable is marked as volatile or not.

> I'm not sure whether it's worth changing the wording or turning off
> the warning in this case still.

Maybe a note could be attached to the warning explaining the accesses
may result in different values and offering a small hint how to silence
it?

I do think this is a good warning and I would love to avoid turning it
off, even temporarily. I sent 11 patches for the instances that appeared
in the kernel tree.

Five have been merged into mainline:

  https://git.kernel.org/linus/c3f98ff6309a29979e1867bc3c9d4172755ca122 ("rcu/nocb: Avoid unsequenced accesses to jiffies in show_rcu_nocb_state()")
  https://git.kernel.org/linus/728a2abd15a767f662a44030931ea7b2959b4e88 ("mptcp: Avoid unsequenced accesses to jiffies in mptcp_reset_tout_timer()")
  https://git.kernel.org/linus/5ec918f8d66a0311c52cc767ade67e7019beb176 ("net: microchip: encx24j600: Avoid unsequenced accesses to jiffies in encx24j600_tx()")
  https://git.kernel.org/linus/695d0824cb6b27ff1a1cdeabb2d5138f00b15251 ("qca_spi: Avoid unsequenced accesses to jiffies in qcaspi_netdev_tx_timeout()")
  https://git.kernel.org/linus/9ea01307e6c824eb0b8934d95d52bbacae17887d ("powerpc/xmon: Avoid unsequenced accesses to tsk in show_task()")

Two are pending in maintainers trees:

  https://git.kernel.org/axboe/c/ae1171f38098098e88c13c38e462d27babb50038 ("blk-throttle: Avoid unsequenced accesses to jiffies in throtl_schedule_pending_timer()")
  https://github.com/evdenis/linux-floppy/commit/c1a8feb71ba8613108b212c705a48e0e136d8c3a ("floppy: Avoid unsequenced accesses to jiffies in show_floppy()")

Four are pending on the mailing list:

  https://lore.kernel.org/20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org/ ("sched/topology: Avoid unsequenced accesses to jiffies in sd_init()")
  https://lore.kernel.org/20261114-lkdtm-bugs-wunsequenced-v1-1-b24f15ce1328@kernel.org/ ("lkdtm/bugs: Remove volatile from element_count")
  https://lore.kernel.org/20261114-lkdtm-usercopy-wunsequenced-v1-1-d9f288701932@kernel.org/ ("lkdtm/usercopy: Avoid unsequenced accesses to cache_size in lkdtm_usercopy_init()")
  https://lore.kernel.org/20261115-ceph-wunsequenced-v1-1-6910c560ba9b@kernel.org/ ("libceph: Avoid unsequenced accesses to jiffies in dump_linger_request()")

If the four linger for too long, we can consider moving the warning to
W=1 but it will still bother a decent number of people, so it would be
better to just get them fixed quickly.

-- 
Cheers,
Nathan
