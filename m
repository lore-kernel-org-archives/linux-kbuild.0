Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600357;
	b=pjndqd+wiIBt9LL9h+ZSn8pD1aeIwj8QXeen0YOvFCkNHKnokPTRbkkPs5lQCdDZNpKh
	 8v3MXb2n/XER6lJLMHNDTem9HhB4bWYdkCKC+cu4enCO/HRV6g678Tgj5TBOFQ7szdCne
	 JJtv1jn11bBHqsCQeWzWJc034FXSHhis6h0t/pWDn3PkKpZwOkZfuST2Fef8V/zMqVgvK
	 Wou+4wv25qA0OOcB5evk0vgoKbtgFA3jSjuPQ9vPdBfCeIL0hWvol6KP5sbX6ZwdB7JVZ
	 Xz1lobHAa5DlU2KvSpx3qXwvtnzOmhl3y9tI4hOY5J+wulbS16arrWN9CSdPOSkQUbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600357;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=VvQJyhwgQ+YhbM+FtddDOciD0h7PQaqhxjTy41nTAJE=;
	b=WjtS7SNiXYM3UjBAcOgT6QkbnTnc9Z0hxbydZHgpsUA3xSzlYPfj1bvqtOBrPRubIw7S
	 0cR9/EKxJhZuqT0gsik3bLkC7LLmLKiu+bhkbZgbu5UeMnUSDpYhkusBd6wdxvYAmE7Ti
	 Oo9+twuqK1FTw6EBiCchudKuwcC365/lx2G/cZwfDjzD6aw4NBu6KfwrCRO8ecjjUVSEn
	 6oJdVestExcp+M/TmH1PwevDcA0XAuAu89WaxK9HQ1r+nkzbqvVzztatxeObey98Z2O6O
	 O5ViiKD/mUAgM0N3JpiT2N37Z+dQLjcQ4GiMbHPcDs2cI1rQKfgYukxPJZWjSpIMFKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDe4n0SQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F76606A323
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDe4n0SQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C941F000C5
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794600356;
	bh=VvQJyhwgQ+YhbM+FtddDOciD0h7PQaqhxjTy41nTAJE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=VDe4n0SQNQq+U2H+GeQp9Ln5ycFphUpo9o1RvMgkjl1LYpndhQPgvRmpOXnZR9VJ9
	 dsXHmTfBUA96g7/1WulQAvY+IFILPIQLwH0F0/GFl+N7AVk//g3xwegphDcEELX8cH
	 TUrn1/jQYxpor/RDbyoIsetL60j72gAjmSqeQsIvt8B4vc5M0bqs+Dt1TrC9di33Om
	 wcLkqYMVLq8zwAetL5gqTi7Pr574A2sxAXyK+gBoZrTqCKl604yQ2NitLGd5PMAw8n
	 P6qX//qsQfkGqi/X2BLGtl2ZzPl1MCsZQstZOgsfL8JZkUiU0oSqW1I5ZX9Vo5QicC
	 7ITWzo1rL94cQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8B4E8198003A;
	Fri, 13 Nov 2026 15:05:54 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 15:05:54 -0500
X-ME-Sender: <xms:oG33ala2Qs4dNCz_pgKY9qRFkQNTC8Md8bjb0LxB46k3LYEbFL24aw>
    <xme:oG33anO6D0ny--CeA8YHwhOR2Bnxkws17cmN25HV8MXK2cJ7kSMiFxQLvCKELokaa
    _P9FBJN182cikAmS_EWuQU6f2s5w5re3_lzq_YaU2r3zedxLFq2yi9M>
X-ME-Proxy-Cause: dmFkZTFrh2j1YerPcsdYSEJl2fuNPZBBkrWfKhKGJpB+r05OZ52nQHlNbhYFKI0raic5S0
    5bMlCyChL49t3w8ZhhOR0NlNe3z9Lg7QBBiJ59KgCh1sycLWSK809y0RE5D/RanX5bwkrc
    EudQ9Fb7dAjmpZGKgucomUumnKpy8W0Ifj2G/RKLfrE67vIpEVZmZLp2GFgvO65vFSLxcv
    +k7OYpW55f5SLyKg+v3yrBkk34QdbPV0RCfi+OvplFq/xqwI0LylgEtFVmCLGUyZvzK/lB
    joRJw+3eq+P+s9M3NmX+1p1vZU043sdwYPKegHO9x2WqAdMAwNOhQR3RorxmNswidt5zkv
    hJVDuN6TQrb50u5stQadctkO+AFYznGeqlthIJiuhnH9e6cQFD+7x4XCSZ60HbgKOaTYxF
    tIl4yKFaQ4aLE3fwHNRQ99xcInMXWkrZDGLOJMIa1+jBcePoyMS5liR4ibrgMaOEWY2mih
    4IVSRU7Xb3Mqn1LqYgWN8SGE2Bz7yTt6B3sKJ3//eXRiqQdfXcWUZ0n0CcQMy3kI/eHVs6
    mfBsgf3cLFx9Pe5vb+hYqKSSuLVMgavmAWee3WBa4WNK7/kegauBOUj4lOghBSwIaWgxWy
    yQ5mOeLhSTkY5m4sG8j6E8abAfc9Rqgy7aT9SUPpBGfe041MC/DINB2qovsw
X-ME-Proxy: <xmx:om33av8JIDuF_Ma5r_he8EYFJwpuPdP3VGQh-jAlBjKuqbSUBCatiw>
    <xmx:om33at9fgU3GD5mjgAg1Ga21D6YsgKrJ_wdZicKzXvTcqeRoj0KDng>
    <xmx:om33avQHEOsTYqaVrKaWbbE4tRwGGfUvyQ1AeBEA3AgIlwpf6sUL0A>
    <xmx:om33ahcJmPgNrYZJ-_PouhKo7piju3djExvLGCz_NLgX4u1PmOp2JQ>
    <xmx:om33ajBdzwsFsd6xdno2q81dxNKuZUS8sa3B9bO6gXyXwln_S5LnVrFj>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D33FBF8008E; Fri, 13 Nov 2026 15:05:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 13 Nov 2026 21:05:32 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, "Christoph Hellwig" <hch@lst.de>,
 "Eric Biggers" <ebiggers@kernel.org>
Message-Id: <b7f72b97-6e8e-4b07-a2a1-6ac8c6e596e4@app.fastmail.com>
In-Reply-To: <20261113190150.GA2857474@ax162>
References: <20261029135020.272082-6-ardb+git@google.com>
 <20261112222720.GA188816@ax162>
 <bc58b973-3d54-4480-aaaa-f5d5269418ea@app.fastmail.com>
 <20261113190150.GA2857474@ax162>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

(cc Catalin)

Full thread:
https://lore.kernel.org/all/20261029135020.272082-6-ardb+git@google.com/

On Fri, 13 Nov 2026, at 20:01, Nathan Chancellor wrote:
> On Fri, Nov 13, 2026 at 09:23:03AM +0100, Ard Biesheuvel wrote:
>> On Thu, 12 Nov 2026, at 23:27, Nathan Chancellor wrote:
>> > Who do you think should take this series? It would be nice if it could
>> > start making its way to mainline sooner rather than later since tip of
>> > tree clang builds have been broken for over a month at this point.
>> >
>> 
>> Are the first two patches sufficient for that? Perhaps Eric can take them
>> through the CRC or libcrypto trees, and I can send the remaining ones
>> through the respective arch trees the following cycle.
>
> Unfortunately not :/ we need the third patch to resolve the error since
> that is where the conflict is originating.
>

OK in that case, maybe Catalin can take the whole thing via the arm64 tree? 



Diffstat:

Ard Biesheuvel (4):
  lib/crc: Don't include <linux/types.h> in NEON intrinsics code
  xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
  arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
  ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h

 Documentation/arch/arm/kernel_mode_neon.rst | 10 +++--
 arch/arm/include/asm/neon-intrinsics.h      | 43 +++-----------------
 arch/arm64/include/asm/neon-intrinsics.h    | 24 +++--------
 lib/crc/crc64-neon.c                        | 10 ++---
 lib/raid/xor/arm/xor-neon-glue.c            |  3 ++
 lib/raid/xor/arm/xor-neon.h                 | 16 +++++++-
 lib/raid/xor/arm64/xor-eor3.c               | 15 ++-----
 lib/raid/xor/arm64/xor-neon-glue.c          |  5 +++
 lib/raid/xor/arm64/xor-neon.h               | 31 ++++++++++++--
 lib/raid/xor/xor-neon.c                     | 16 ++------
 10 files changed, 78 insertions(+), 95 deletions(-)

