Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046923624CF;
	Fri,  7 Aug 2026 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136553; cv=none; b=q+zzfHbw0yMfa4N2nbQQFQAioaDsAHl4Yo857g+VTlf22ui4Lr4I7tZs4JKPa771k/6jrrIVCedhUkcU7VpN0EUZD4XNwVcJTGUZzxfRorMy2yiYhwjoGS6CzGaEn7/mTrtCkU5wTAmJ/pgjLApyT5g6wGGGtTRraOsyFcIw2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136553; c=relaxed/simple;
	bh=hG5ycys7N2uUiQcB9BoKtiyZiH+Rsnl6AeDCzYdVZOk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nn43iAdhfdv+8S+fNZWWUIpP/ywzE6ipNmNnmXqaYjnvt5VaWjS6KPUhZcymugu9+KzGNdm4WmjUMJwiYPPu+QkM5zHGQ+Cx1JtcJQycB+NFjx8SZl1KB9fBhl8eZ+Zvb/Sbix6Q5jmVfnPlnxeKg7PewGlXn6y3c3dtZau2kRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NueSUMsc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MxiThuRo; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NueSUMsc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MxiThuRo"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 74BE21D000D5;
	Fri,  7 Aug 2026 17:02:26 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 07 Aug 2026 17:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786136545;
	 x=1786222945; bh=dJVahiy5gZgb/9iw1WIcm/9DQ7yCpFoPM/TaSvUsqDM=; b=
	NueSUMscszvwwWnWPf5ZPJ4hA/7JApfJFN11srTqlSz1A+KhvlbMuRkXdRckE1wV
	OSRXgdLA1GtDMSVdeq+ObIbdwTj3KiQsqX4lM3nyxTPFyAxzJCrxKR8eKwqpMT7s
	cpW4SYD1lfRgf5rMrxZ4otL0JMGJbhO5z8elMmNuOC0fJOF+0ZVOh+AeRrNOkUWN
	m1ywSIUAXitWU98Ydd6VAqFNZatYLDK+UnXjkmHknmkG3ZzVYM6kQWB5d4ANh7l0
	VHajZRqhJjsKrZN0GpFbzd0s6gkBmTSfyC9XmbpiO1I9aU4Q8kx/8k3bhGfBw4Us
	ZX85WPvFjSKOE3jGRFKaIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786136545; x=
	1786222945; bh=dJVahiy5gZgb/9iw1WIcm/9DQ7yCpFoPM/TaSvUsqDM=; b=M
	xiThuRoG4GyLmgPE/zWKaWqnhb1eqUmr6WW9JnZrobZthRmRa9dRSRf8kYGGhU0e
	Hxcni7rox27gbLW7L8VnLbuv0Y54q/14V/YrUO9Vs1Fug7VSQp5LlowUnIuSZARf
	VrqHVgMcFLQZQwP+qFr2EvHDrVPMKWVHWuvHKds/m18ojCqoKKqxiTyDoCecLBgQ
	yVknSY0xYPB8onZjPO6Wx2drOVZwwwbYi1N3pU9e5MuGPzJ26fUbeeVt7c1El4h0
	WlxeXRP6cCEvrVwAKb4X3TcrjpPKECWRXisK3BbxnAAgqafHYKP+3mNKCktishXW
	DvvKSOKm0ElOfxAnjgs7A==
X-ME-Sender: <xms:3Ud2ah8l4ySE4M3-Kyfl3DhQM_Yp95INaAB0Vf2z5dPt_lorfg87WQ>
    <xme:3Ud2agh8M758E8rp7j_rBCoDbfOrw5FJSlLyHN35AxYRfQV8hMSdaWR9sniUro_Fu
    CkKVQEuzEp41rzCSwiutniSQA4Zt-QXBQq6VM_bkdmBvYoK87XiNA>
X-ME-Proxy-Cause: dmFkZTFROsvYPl2A/5+0XOZdKtcGtS+4WQZYpT+CMkWWt9BUKYGRwkrvB/3tg7Exl/G/YW
    iirTrjRj0MFF8qM1jRwq4EOtmuyC+eyFb7G4aOa4tW3yEt2mZD2v4a0HvalaaWmOk/X3JG
    vgtMB2GjEJvuE/RkjSQHIuV9aA7vFle/xO//EJ3fGtMCEGHlbeSBnfubU+MWX1PZdpSm02
    GY/7wibnbmrdV+oJMluHbKHBiSPEEji2S5b+LdMVO2qDk8f3C9cgdFNUvaer+6bifTf6C0
    pEAvBrKpna4lvPTgW8nZgnwR5JYWnjY7XbjLCZlMZc6wCxZNhnoyVTA2mUr6hSbRYHL3kn
    ffd9pndnSuAoZFcLKZpPw4IhJBdPwXVAPLjHNAytpSYCayFKdkkFUHlA8aHzkYH7nfvws6
    qQv7xdX+iomZzgcz4AJCagilsci8jI2c3/Sytu8AUs2S7OqZZ5YsFbiE0w/u+ZrGFIAmwJ
    gTHcAnDo0HN0cKq8nxk1FcP+fomjf7UMSJfEis8ptUMYXgE7FjxmdgSwGOam4NM1HgaTGa
    l1T+sTuqCybMdXmauUNziJgppQM5XQv9AkXh511Lrc1Hj2pF2itIsL8NjgThbaCxWG1TJ4
    AkbY/YIyXFmztl59clcuwx9PAepj7MumeTr9Ag8+yDlpa9IY8R2yi1mlm1ww
X-ME-Proxy: <xmx:30d2arlIqKAV4Zk8Xgp4cLqTuoGlu1qc5B7AicnxtM8wIT0NrYcGYA>
    <xmx:30d2ao6M1mN6EQcE4m_dC1vLMfB2hTooSxIlZmi0BRV0FC22i5S3Uw>
    <xmx:30d2ahjIY28G3Xb1-LGJNr0a8f15LhfjmRnN3Kl7Q_1AcihHN5SjRA>
    <xmx:30d2alG9yueryzr9AK84CnKaxClJB4gWulzzZkLH23VvhdSwKPV9jg>
    <xmx:4Ud2as3xqhg99Y0RpaA0FRqurKcoCj6r6AyGKv8gPlHIg54j4Cr9lDwi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6B4DF32A0065; Fri,  7 Aug 2026 17:02:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AKm4r7D4MYOo
Date: Fri, 07 Aug 2026 23:02:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <772d5c6a-d080-4bff-acbd-5021d93ca2d7@app.fastmail.com>
In-Reply-To: <20260807-tonyk-syscall_table-v3-8-7c45a23c50b5@igalia.com>
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
 <20260807-tonyk-syscall_table-v3-8-7c45a23c50b5@igalia.com>
Subject: Re: [PATCH RFC v3 8/8] mips: Use the common syscall table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026, at 21:34, Andr=C3=A9 Almeida wrote:
> Syscall numbers from 403 are shared with all architectures, so move the
> toolchain to use the common syscall table and remove duplicated code.
>
> The generated files are not exactly the same as before, but they have =
no
> functional changes:
>
>  - for O32 ABI, the syscall table would have entries like
>  __SYSCALL_WITH_COMPAT(403, sys_clock_gettime, sys_clock_gettime)
>  which is equivalent to the new entry __SYSCALL(403, sys_clock_gettime)
>
>  - for N32 ABI, the syscall table would have entries like
>  __SYSCALL(413, compat_sys_pselect6_time64), which is equivalent to
>  __SYSCALL_WITH_COMPAT(413, sys_pselect6, compat_sys_pselect6_time64)
>  given the new __SYSCALL_WITH_COMPAT() definition for N32.
>
> The generated syscall table for N64 is exactly the same.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/mips/kernel/scall64-n32.S            |  1 +
>  arch/mips/kernel/syscalls/Makefile        | 22 +++++++---
>  arch/mips/kernel/syscalls/syscall_n32.tbl | 68 ----------------------=
---------
>  arch/mips/kernel/syscalls/syscall_n64.tbl | 48 ----------------------
>  arch/mips/kernel/syscalls/syscall_o32.tbl | 68 ----------------------=
---------
>  5 files changed, 18 insertions(+), 189 deletions(-)

I still wonder whether we should combine the n32 and n64 tables
here. Since the script can now deal with multiple input files,
the first 211 syscall numbers can be in a shared file, while
numbers 212 through 332 are always going to be different.

Alternatively, two the files could just be merged into one file
like

0       common    read                       sys_read
1       common    write                      sys_write
...
13      common    rt_sigaction                sys_rt_sigaction     compa=
t_sys_rt_sigaction
...
210     common    remap_file_pages           sys_remap_file_pages
211     common    rt_sigreturn               sys_rt_sigreturn
...
212     32        fcntl64                       compat_sys_fcntl64
213     32        set_tid_address               sys_set_tid_address
...
212     64        set_tid_address               sys_set_tid_address
213     64        restart_syscall               sys_restart_syscall

=20
> -$(kapi)/unistd_nr_%.h: $(src)/syscall_%.tbl $(sysnr) FORCE
> +abis :=3D common,__cln3
> +
> +abis_n32 :=3D $(abis),32,n32
> +abis_o32 :=3D $(abis),32,o32
> +abis_n64 :=3D $(abis),64,n64

We should probably drop the custom ABI names here and just use
common/32/64 in the .tbl file. There was never a real need for
the special case here, and now it causes extra complexity.

     Arnd
