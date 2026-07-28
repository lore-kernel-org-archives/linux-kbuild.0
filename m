Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6940313D;
	Tue, 28 Jul 2026 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227488; cv=none; b=Ny9+MyaPdv/mVlSXasx2PzKiQEmFwoFkxkPlBo+3PzuZYCfeSibt+taBwkLJ1DOvIr1VgXFt4zfyRx/uetsvrw/ie1jDZGLcYm9gfGSDV5EYg8z+VpwcEoXxHJrFAGp1yleuFd4mPwXve1SCEp1us59UGul4M19+18xcT9Kh71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227488; c=relaxed/simple;
	bh=BmhiRXsF/Xkdvqt4B1Tv407/jwwHAOdQHkqv4CuchV4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GqTsVbxuP7l2eyb6/hFrCZcETUJL/yfDpC21SPN1+mCVRfjgrlabCmszNkAYOm1ptW6lLnHB3z21F694UIKrFD1mKHUy9M6ZXqyJto5RcHr80wIgX2Ac4OsPk0pE5JAoV0D3cE3TprdlUTyG1D/Ze/it6Cl8xhQO+fFE24jyp/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=K5wGLAPn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M4KALdE6; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="K5wGLAPn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M4KALdE6"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5B2ABEC01BC;
	Tue, 28 Jul 2026 04:31:24 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 28 Jul 2026 04:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785227484;
	 x=1785313884; bh=WmV9ogVI7KdnzvIZ9clI/94mDKwEc52x603Rw7OWgZc=; b=
	K5wGLAPnmmUNdAAfBLkr90npgtnZ7KsCovyybociNQoXiUAvkJL/QjSAmgdKagoq
	35GOZCJthOScQJiDNTFTuYX3sE3WEznu1/ADAXWJJv5fdKNMwvHXBXIei0qKIndE
	px26DDxREN6/25N0t/zV5h4Cr3kOsvQL/kg9cWAYe2DsUx6B50McHDIM5vQgFggO
	pX2WgGJeTZg8kssFQqKB5dnP6TO9yNgsSX3OQEgqQgo84Zc4ZuXMG78JJwr8ltbE
	4yperzTPWHlh8NVdQyWAQ5mTop4JqBvqvKOPLX1B4cMB8DZnmj2cstmG04WX5i+B
	j8J1MWoLwOC+YcXbTU1Hpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785227484; x=
	1785313884; bh=WmV9ogVI7KdnzvIZ9clI/94mDKwEc52x603Rw7OWgZc=; b=M
	4KALdE6IvfSKgD+AnQ6cDg1FoAb65RwCbTX5yEH+eBzOEFSPB+cHx7eV9cuHaLKF
	mZyrYM38UAVIos29bCNoY8cqELBNykFXlU9pC4UW3X2gC7xpKtgO8EuHyXh1I7Et
	C+Y/N+EKHqjMBwG3Bu5IU82HTg1znsgF+pVElXS8bs0hLI9OjjRQkF8p2DtiOEit
	T3J84y2dpm+XhEhieguVrPqYX9BOV/chjyWSzwZdbynvDXqoTAO78q8gcwasYNme
	WuDsS6jOY9PNYJsfSeHhN9kxl0zJNfB2vjfqn7H9+eOR1gTN+x+VIIRHKoy/YDxx
	ZGwXXFDSiNpT773AoXDNw==
X-ME-Sender: <xms:22hoaglDW-y3JLMi9hl_63cM7D3GuXjlRqlNuLIWRCPT2YQJCMwo4A>
    <xme:22hoaqp08BY1ph4wzGWVjkxk3jrUpoD3ySBK6N041Pq2JBOJh4CZL7Hhm3hB9boXF
    SpA81RlMUvgz91mdiBV7ZOs9trnjFiw2Vpiz0f1-bvYMhb3fF4OADw>
X-ME-Proxy-Cause: dmFkZTFchfChdxIe856QZRrA3eWV6srr4bWEz5VSEi8kLA7G3a6a/ZcjhWegZqGnQdi3/3
    bcpb+NxCK+qVIEDAs7V/gsf3g0pDVjcramgkfEohzopDbbA414abiecHAWFfzjKLvsf4z5
    5835pfj+3YwSrbY9kAuz/pFBBoSJCmhASklKzW9QBJU2N1wjaXmd9LoAQQSg4Xljt0rTWr
    vi5zROALystdp3euF2Avp+G2bZIu5yLGfWA0NWQ8AZi0oyow6LV7vozKAewyqyo4lS/cam
    G6ceC/ZNphzaK6HvPBXbeFfPVBS3n3JsnuREZuToEHOjB00xF4nwutLNjkhhh7c210C3HX
    MXSBv2ox3JJXrD9Pd3o8J8hRv6PURihq4jsJ/1eLrIJWkDxkczUqP1fPEc087Bj8l59K9A
    GoiH71zjEgxL1IsjislIDW2NvWTTQwRfuCQ1UKuzmsSmLiVnXqnGnowbfj5Vv4yiC4uQTF
    6N1lip1oW5W25/jkG4lnwTTjO+jztbIzfegN3+3vGYrqqR6FqXDp2k1ZtNhCgGrXJgq419
    B/YLsTef8VWXAMPCS3Yyxuw6f/KgNo4Uh5BVd4s4asb+WIuEyHZg2DrD6+qcqHLws5tEYj
    82jNP1ZtkMwGYm7Nb8JBUmeIMDoNl6NWyc59ANIwgcDeVIp3rG/+kFCoQmgQ
X-ME-Proxy: <xmx:22hoahUFhGeud3IJaLCL7xkLU2_kTfn0YhL6MJP4-iLZHEnSJjx5nA>
    <xmx:22hoahTKnR6YZfavdPC6GtIpvmnKcnUOj2QGjOzP47N0u69xTmO9rQ>
    <xmx:22hoapCIpdHE0YbnInGsh0W1SgdfDe1hNRW4HztP3I1puu2AP2v5hA>
    <xmx:22hoagLJOrig4_9vrRlAw9LQfQ7reBCpk9KIOvu0CjYkZHAfRppyuA>
    <xmx:3Ghoamj6IPxUMQUbUgy-VDdjAgyjgRYhK5Crz_vSBjO8v7F59K0OqHKd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3532B182007E; Tue, 28 Jul 2026 04:31:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AlbVG-vHP6D3
Date: Tue, 28 Jul 2026 10:30:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <a10b536c-42d5-4884-bfd4-2210845b1f7d@app.fastmail.com>
In-Reply-To: <20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com>
References: <20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com>
Subject: Re: [PATCH RFC v2 0/4] syscalls: Add a shared table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026, at 04:47, Andr=C3=A9 Almeida wrote:
> The generic table starts from 403 (clock_gettime64), the first common =
syscall.
> The scripts are adapted to x86 specifics, like not generating the comp=
at entry
> point for x86_64 and placing x86_x32 things in the proper order. x32 i=
s likely
> to be dropped from Linux soon but for the moment I left the support th=
ere. If
> this sounds good, next revision I can add the docs bits too.

It may be easier to skip x32/x86-64 for the moment and focus on
the architectures that we know need small changes (mips, powerpc,
alpha).

The patch at
https://lore.kernel.org/all/20260707212252.bYk3-AlU@linutronix.de/
still hasn't been picked up yet. If your series is done before
we actually remove x32, we may still need to add a temporary
workaround for it, but it would be easier to avoid that altogether
by waiting a bit.

> I've tested this with x86 and arm64, by comparing the syscalls_*.h and
> unistd_*.h files generated before and after this patchset and they are
> identical.

I've had another look at what I tried previously, here is the list of
things we have to figure out to do this properly across all
architectures:

- separate offsets for base and common table on alpha. Maybe we can
  just process the two tables separately here and combine the
  output files afterwards?
- special __sys_clone3 entry points on alpha, m68k, mips, parisc and
  sparc.
- combine mips n32/n64 tables into a single file with regular
  use of compat entries for n32, in order to handle compat entry
  for the common calls (epoll_pwait2, pselect_time64, ppoll_time64,
  io_pgetevents_time64, recvmmsg_time64, rt_sigtimedwait_time64)
- come up with a solution for nospu syscalls on powerpc (clone3,
  set_mempolicy_home_node, rseq_slice_yield). Possibly dropping support
  for spu syscalls entirely, making all common syscalls implicitly
  nospu, incorporating this in the common table, or handling this
  in the syscall implementation where necessary.
  note that newlib still supports spu syscalls, but only lists
  numbers up to __NR_sync_file_range2 (#308). gcc-10 and higher
  no longer support SPU at all.

       Arnd
