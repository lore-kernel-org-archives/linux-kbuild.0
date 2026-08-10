Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DDD3E3166;
	Mon, 10 Aug 2026 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371512; cv=none; b=R8R55AnZo9FsYWb22KBdfssd82Ud0xNZDL+NwmX0V4ZNHSBV/lj+dwmqVNPwQnw5wh9w5cuSyg66mcpl91y++4DyQvMzhr72qb8PzaHdmmODlmET3YDXazdugKGnTHBDvGz9r0MVyVF2Kf2tlVmC3fqNMFRt/DlKQnNV50wicAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371512; c=relaxed/simple;
	bh=qmxTUyKp+OPSu0yX1He4VV2tYbifrXnW+ObUBUof4II=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uRW7sxU0rGR4cYjDGcm2zv4oagoT8o0LK60dlx43MnhChiiqogHjfmhK7tssXX2gzzOiNH5VjXjQAzZbQwrhF1gu8FrNyejcmfrMUxKu+hizx5C+RoqiGKeNbX63+d1mtDpQM9k8AVJD/PlmvfK7ChGM6YwC6dF1JR+LMmpFRBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QEQ20Rd8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iH4WPmJS; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QEQ20Rd8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iH4WPmJS"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id A3B97EC0143;
	Mon, 10 Aug 2026 10:18:28 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 10 Aug 2026 10:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786371507;
	 x=1786457907; bh=E79LdjRO9ilXIwMdJFSIwKNbXmvRhzxygR7EEa7QRTQ=; b=
	QEQ20Rd8dMrEtm6zMY2qmMp+bVDNInLpzmWTY4EJOCzte93gGh9PBG9PVzQY17PR
	KQRkhj4t8Ac/MyKTVcrs1UE4qFDztPSGJLFNWQkRx+QmeCX400l94PbMRQ1ijwc9
	2sbAG6NNBfcUfKyHe2pAFV6ruel+3pIrjuGJ0CVrS2gX/cxrL/gWbH1P5SU/MDls
	AY9OUSN3EVRtPJolw6o8Vl0NIN7k/ZLoXgqi+wn9CZPBjsbQMdxWag4pr0N64Cjn
	0YGERo5jzqAKAoE2TzUxAk3qpUKVQYjMk+MBDT9R0kM1G0Vl81h8DTeC/zwPfDJi
	oOv9oKiqie68irjyf1k2iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786371507; x=
	1786457907; bh=E79LdjRO9ilXIwMdJFSIwKNbXmvRhzxygR7EEa7QRTQ=; b=i
	H4WPmJSAXyiblD/AwQkO9EYblPjnKoKPR7jKgbg5iGKaElwmRaZIlJ8I+TREW6ra
	Hv3i6z9GOQoFoExX6qwxuO8rqdeRCanGWEgn82Xj7CguYXyFm3VK5Bj04qBJNvR1
	HcTG7OpPL23fMGKSufKUS5YMQqkrB3Ywoozn8euJqQ0ifF1TpgpW1S9SFHMRQECv
	FgwywXKZCrqFnkCndO/Ri/bQ1nVSfvmPg0FdOQvYemUN6Qt86ePJVOJnT38D6nni
	BQqh29iDZwKZ6txAftlEd06rHgksAcNdCmIWmuw/WNUaADr2IoplSjs9prvQ/HWl
	2TIE6dyt3Kz9/pjVz5EQg==
X-ME-Sender: <xms:r915atk3tilcPaxt9voA7Q3SIRtLmUt74kHbQ_XNv5naCm1mjV7ULg>
    <xme:r915ajqRXf5v1zy3Cuqg-j9d27pl2ZB1a41u1cSLnDX7TXCyHSeeyh99GkqBminLu
    1VCgJNPmPy7IRvL887TkoYbDgmYkpccTLrXqpWv9YKT1k6S-YiDa0Y>
X-ME-Proxy-Cause: dmFkZTGhjewoSpcD0LfDcFdhJJKdaRGCoP0LQUWWNUVexL2+fbwMabBxka3HXu61stWyh1
    s28hpmPkT4ANPqKMcnrf4gBzDGy9vpyXnsFUjtJP3xPoB0x92LKxTaY1KEOxJj8ygasFQR
    dGhiNoF2Tyh7QUJhDKjAdLpBFqrNjxNI0qA3ORhG8tn7cHhDKdRiseQChFJLtPFvG99nFP
    DYDaoEg7DXDOEqAm0jaz4em3EHIMXgQ0iYb/zHdOkVz5NLLdX3C43IanA2ELdH6TcWiskL
    Kdfp/5yzi56RpBGAUfwmPgc7I0oAg7Q1w1LUmnWqecRJIqMXdMqovAf2wwOiYhE8ek8XTL
    ghL1bsiepLaneKMFW4Coe0pDZPiuIkZweVqth+ALKRW4fDkKkjI+EktiH66cxGPL8S39sw
    2ElFHdzuDzsdAxlNHBpjsxCNy2fGFDVb3lSWIbaYcWtS1gv3wN1utZnPXC0/ZvIF78NMFR
    Sq2dJn6aZffk7GeZ52oG8UW4nb1NN3JwoalaBIzoLZpYa9BmdCAdQP9Zia3IbjRG130L4D
    Ce0mUMHbzcgJKaJfcucGDV983eYO7YPa4BdW/p7cnm4Gx2WFZMqYWzVnNv3UImnZgfVdmE
    gI7ohY8cryfIA55eXqrz1tXyd7fC36uIjxBSdVI8GHUj56lCq4SLNhFlrs1w
X-ME-Proxy: <xmx:sd15avOiIjKQAt09kuVCShN5ZvwxN7PGuKkUseZwyOZT_mVhKeSnVw>
    <xmx:sd15akATd7sKUO_lo6YUIrom3Hxu33f5lvaQJ-hGZt023_0kIWZpqw>
    <xmx:sd15auIN2X96BA9jHG2vNdsklQhICwCTE9-Rt3732MWecQLscF6QRg>
    <xmx:sd15alPwpMgyjKvRszyFpWquQw49lC-tyiMvvjVaMgf4pEB-659jwA>
    <xmx:s915aidV905RS6NLGW8-yZC1R9Hiti2kFR2ys1X35I0kCmGXjsRMws8->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 75A2632A0066; Mon, 10 Aug 2026 10:18:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Adr_s5Dpg-C7
Date: Mon, 10 Aug 2026 16:18:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com
Message-Id: <cd8a7da8-bb01-4b03-9f1b-1132c1bd7662@app.fastmail.com>
In-Reply-To: <52ad6a69-3623-4013-aeb6-60b6be88a4ff@igalia.com>
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
 <f9e24d57-6518-49f0-979e-9af8a57d77c5@app.fastmail.com>
 <52ad6a69-3623-4013-aeb6-60b6be88a4ff@igalia.com>
Subject: Re: [PATCH RFC v3 0/8] syscalls: Add a shared table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026, at 15:25, Andr=C3=A9 Almeida wrote:
> Em 07/08/2026 17:43, Arnd Bergmann escreveu:
>> On Fri, Aug 7, 2026, at 21:34, Andr=C3=A9 Almeida wrote:
>>>
>>> There's already a "common" table shared with a bunch of archs at
>>> `scripts/syscall.tbl`, but due to historical reasons some archs will=
 never be
>>> able to move to this table and share all the numbers.
>>>
>>> The generic table starts from 403 (clock_gettime64), the first commo=
n syscall.
>>>
>>> I've compile tested for arm32, arm64, s390, mips and sparc, by compa=
ring the
>>> syscalls_*.h and unistd_*.h files generated before and after this pa=
tchset. For
>>> most of cases the files are identical, for the few cases that they a=
re not,
>>> there's a note in the commit explaining why they are equivalent.
>>=20
>> Any reason you still didn't include the alpha version? As I mentioned
>> before, I think this is the most important one to be in the initial
>> set, to ensure the script can deal with the having two separate offse=
ts
>> without becoming too messy, or needing a rewrite to take multiple pas=
ses.
>
> One reason that I didn't include alpha on this version yet (but forgot=20
> to explain in the cover letter) is that alpha is the only arch that=20
> doesn't implement `set_mempolicy_home_node`, and the commit message th=
at=20
> creates this syscall doesn't help to explain why. But for now I think =
I=20
> can do something similar to `memfd_secret` and add a new ABI or use th=
e=20
> stub implementation.

No, I think we can just keep the normal table here. There is
already a definition for the syscall macro on alpha, just the
entry point is set to sys_ni_syscall. On alpha, CONFIG_NUMA
is always disabled as of fdb7d9b7acd0 ("alpha: remove DISCONTIGMEM
and NUMA"), so sys_mempolicy_home_node always points to
sys_ni_syscall through the kernel/sys_ni.c redirect.

I would split that change out to a separate commit, but that
patch is clearly only cosmetic here.

We probably want the same thing for memfd_secret() as well, and
always define that for all architectures, with the kernel/sys_ni.c
file taking care of the CONFIG_SECRETMEM=3Dn builds, but that is
not entirely a nop, since it adds a __NR_memfd_seret macro
on architectures that don't already have it.

       Arnd
