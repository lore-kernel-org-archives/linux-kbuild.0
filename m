Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606451;
	b=Sp2allt1c3uOxwNxb0RAexy6OJt0kwJX92vCNB+ofmBiuUH0Mv4fK1Wt8Fp3Uh7fmTJG
	 Yk2i3UZXe4GuC0wYxiNCntS5uWYylxgwiEAB8byXJKjYDzXK+v9zReM1MywVHPTIy9oIk
	 gJgAAulsIaanIO7xs2F77JLclxnX9fnoe4x8eMLSTcx14WWC3gKxQwEuxpUo3cLNWc0xn
	 gLQmSX3DgPfuNJOWYDwdEre4IpWqgdrJOioCRSbHkFD7H4sqUp4xHKHSd8r4JV9pgErKv
	 qHLqLyLStWgJPlItQSSc1kk4fkplLVai8/1JFbMSSDw6Re6l44rcCGpIY1ijTIOc3OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606451;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=dyCoPsA0aOvLJXWHgDENXQwMLfq1W+de7nvoNnEl1II=;
	b=G/4Uttj0oE5jMI2hm/beeDgWjNS0/4DLth8gdC8j+ZA32q+ZNd3XjLsKIU2+iveHl26w
	 X//vLBBtuRw2ammJbntX5P8gtmd7vpImtUOBsiOoMS5BPcdjywGaieLCXOfhFE4im5SqY
	 /7d1zqsFQ2awqhiC5kr875WE1zHmZJYWa6uXdZFwuJ9HxheIYfDRhjAHDorqtkMrf6Mdl
	 RNYEXt0HvcVaHY2WrFKC4kDnqGpKqrQ7YJXge7FPK35A19mwMRx9vilprCe8qntwVCvoy
	 UjN6JD0S78wmEyiKNjczoebA7nLWmWMkOBD4hoAzIMbwB+/CcGxVsiTBh6G8aUgPG2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4xpMlSz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122CA606A336
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4xpMlSz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726F11F000CC;
	Fri, 13 Nov 2026 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794606450;
	bh=dyCoPsA0aOvLJXWHgDENXQwMLfq1W+de7nvoNnEl1II=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=M4xpMlSzgtN1gl+LY+LdBB4tYi9a6KJfWiukiNA0a4aGgtPtBYa5ZuZu7pBjwC/G3
	 hT7HN3c364kasIqlRRTzSzn4XKJwP9YlK5+TicjdzVQHMAXNJUR5uOYGvf1fw3+mjY
	 E8U7XroSDb0EXtcKNB8lrckuN8Oed/gzokM2zPDXEpQHAmf/AxVdwrW35lZwMqQ7Aq
	 IyLfPnTNURAot35eWJowEbodgOukMKrjPRWbqQU8M15E6guhiitXOloZJA3y/eqTbC
	 N/4JvfE5hZQ4V7ko1QMonvwxZXaKfHB6LXiDw6Q2XHNxaYBlmL61JmGG3lzHsvEpAI
	 2elrPQAo3DFWA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7B766198003A;
	Fri, 13 Nov 2026 16:47:28 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 16:47:28 -0500
X-ME-Sender: <xms:boX3as7Xa1vd_C9l0vVk2S1n6okh9_45h98mF9Wbn-tUZyYQlMZhOQ>
    <xme:boX3aovKRELz2ZRAALb3yQBmO1EWCacRIdFc07DlIGWUhGIcZAUrbqQggvnotgCKs
    naTlEBsv4XZnZu61C3ZdpZPVAE6dWXm7vtQBATrYw5jRfZAFzN_eHm2Aw>
X-ME-Proxy-Cause: dmFkZTGn9lrskfsW1+KbF6ZUS6NkVQFTi6onuN4cCIouK54mbrZXCz6ufIVLN1gsoPBIEw
    0RFP+B6M2pDlmqKmu6sBndWXJi2T3Hgu27A/8xAjhQkjUXOHB647a/OUIL3C3Sf0AhAp9j
    au4hmQbGK7SR9ukusDshTV9UBw7bg/H+VzFyMHGJjvKwq8pW10PQTH7Qbkrg7uorMRBavh
    M+aeCb7QBysFip3jMt7w+4pNdXhynAQ+ayS8LOi57/U4WxbQFESC3vM/rVA/5UgvT08jWb
    jsGxSCsJGmjeAPXk/C34f5qMtmCOWtO1+HWQtUwcWcTyzXRDZefimuQfEMllQ8BfWt38je
    CLKQDEldFgV+B7AK9UBrQ9V8gZfnz7gW4+svkE9YuPVnTsxLa+PZBqImnqgJH+6YQtM1ir
    OtulGULT0p4AaviB3K4pFy/+lopvEK1YIpMqHeX2vhXVFvNnEDApXmv2AgHiPzivyEBrGB
    s4hBAIVC5AnV9li/f3fbZYJ/uYvwhelHveNVk/AU4OOdt3HnWnL4FT3/YHXhyK/gZBXJWz
    RIi6l0+qbtbTxZMy7g0JyoN4fHYQpxWvE3TzGndxS1nasW9f8bDmCqB5gkvHD8MgFvd//s
    5vbWtaSTNKKIH5LG8wxj8Y5M3JB6hu1vjXUtm69jzmFBXcn/lnZLlKU80aKA
X-ME-Proxy: <xmx:cIX3ah-3xPlXF68y2C1WHKlnjV3DAljzi3bu2s3AS09jXSzN98JtsA>
    <xmx:cIX3akzNRFbDpo62wYqIOq_Ym6qorqrm1ZYoU2uHq4gefIK2w_T4zQ>
    <xmx:cIX3alNvWkkCtq9XFFAMQJBZA80NujBNEZBAtcT3niCsxAWADW8-sQ>
    <xmx:cIX3ah8W84qwh5HHIaVUZ4jjewlY78sgnJB5GDYS9VHvP42XDJGavg>
    <xmx:cIX3aq7TMv6ITrAfE_XnT744kil1uWbsr0uZem-l8mZeHJvc9irFnYJF>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 864FBF8008E; Fri, 13 Nov 2026 16:47:26 -0500 (EST)
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
X-ThreadId: A5RLEaK5Drvc
Date: Fri, 13 Nov 2026 22:47:06 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>
Cc: "Nathan Chancellor" <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 "Christoph Hellwig" <hch@lst.de>
Message-Id: <289380e8-9bdd-4769-b62e-dbedb553a16e@app.fastmail.com>
In-Reply-To: <20261113203007.GB29151@quark>
References: <20261029135020.272082-6-ardb+git@google.com>
 <20261112222720.GA188816@ax162>
 <bc58b973-3d54-4480-aaaa-f5d5269418ea@app.fastmail.com>
 <20261113190150.GA2857474@ax162>
 <b7f72b97-6e8e-4b07-a2a1-6ac8c6e596e4@app.fastmail.com>
 <20261113203007.GB29151@quark>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

cc Catalin for real this time.

TL;DR Clang builds are broken due to type override hacks that we
don't actually need.

Please consider these for the arm64 tree, preferably as fixes.

On Fri, 13 Nov 2026, at 21:30, Eric Biggers wrote:
> On Fri, Nov 13, 2026 at 09:05:32PM +0100, Ard Biesheuvel wrote:
>> (cc Catalin)
>> 
>> Full thread:
>> https://lore.kernel.org/all/20261029135020.272082-6-ardb+git@google.com/
>> 
>> On Fri, 13 Nov 2026, at 20:01, Nathan Chancellor wrote:
>> > On Fri, Nov 13, 2026 at 09:23:03AM +0100, Ard Biesheuvel wrote:
>> >> On Thu, 12 Nov 2026, at 23:27, Nathan Chancellor wrote:
>> >> > Who do you think should take this series? It would be nice if it could
>> >> > start making its way to mainline sooner rather than later since tip of
>> >> > tree clang builds have been broken for over a month at this point.
>> >> >
>> >> 
>> >> Are the first two patches sufficient for that? Perhaps Eric can take them
>> >> through the CRC or libcrypto trees, and I can send the remaining ones
>> >> through the respective arch trees the following cycle.
>> >
>> > Unfortunately not :/ we need the third patch to resolve the error since
>> > that is where the conflict is originating.
>> >
>> 
>> OK in that case, maybe Catalin can take the whole thing via the arm64 tree? 
>> 
>> 
>> 
>> Diffstat:
>> 
>> Ard Biesheuvel (4):
>>   lib/crc: Don't include <linux/types.h> in NEON intrinsics code
>>   xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
>>   arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
>>   ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h
>> 
>>  Documentation/arch/arm/kernel_mode_neon.rst | 10 +++--
>>  arch/arm/include/asm/neon-intrinsics.h      | 43 +++-----------------
>>  arch/arm64/include/asm/neon-intrinsics.h    | 24 +++--------
>>  lib/crc/crc64-neon.c                        | 10 ++---
>>  lib/raid/xor/arm/xor-neon-glue.c            |  3 ++
>>  lib/raid/xor/arm/xor-neon.h                 | 16 +++++++-
>>  lib/raid/xor/arm64/xor-eor3.c               | 15 ++-----
>>  lib/raid/xor/arm64/xor-neon-glue.c          |  5 +++
>>  lib/raid/xor/arm64/xor-neon.h               | 31 ++++++++++++--
>>  lib/raid/xor/xor-neon.c                     | 16 ++------
>>  10 files changed, 78 insertions(+), 95 deletions(-)
>
> I agree the arm64 tree makes the most sense for cross-subsystem arm and
> arm64 infrastructure changes like this.
>
> - Eric
