Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C08E3BBFB9;
	Tue, 15 Sep 2026 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495416; cv=none; b=bf96vjaKA5lFwSz8Cfq/IPk+2pUIl9Kg0nELMnQTUoGstI0n2AaeBYjoTi+vnmfSVx80l+rcazafBgVU49jk+CDhCSY7LC0XbA7HXXWwUg5Or66OeQoFLPrM2cHAimZXi7YzsXBIpd79l/HgbC/Wr3GnyurLL9EOkF//0zERMjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495416; c=relaxed/simple;
	bh=acA8Pl0ra8uGRhaY3yUxU7JeUeRVK1VSh+mJtBE56Dw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZdhWVAeTmgXJaVzuBy3taytPjhZuR6CNWa0xOArT6gbV4GkQnegx3TGoye28qio4OTKAwcqcChEO9OSHl3AZp/T1Wf3BTfUEEZ1j/a3qTEDhD1nSkJUGL8Ic5xPbHGg8rvNaq4h7+g9GojidXb53wGGeRM4hCAmNDqrLie8yFWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=bfzeMig/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oZOUFFuD; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="bfzeMig/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oZOUFFuD"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id ACCCF1D0021E;
	Tue, 15 Sep 2026 14:03:32 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 15 Sep 2026 14:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789495412;
	 x=1789581812; bh=M+18z9TRevaxtOpUOsKP4yasoi0N4a+EiZHqRi1jYdY=; b=
	bfzeMig/Y+tGM1+bYmo0BbhIVS0y9dIGMrA4LwRTf2Lpje/Kfm8S570bfH/QjUqL
	6/a3eiCelvTXGqhVquzIsr4cr0lUv3ospVpRgXtP4LZbhaVeTzfcbSaGwHa3vtxs
	BcqqDiGb2M6gEjECAzLQuPz0yP99Kk1u011d5pP+gbGS0GiMHg4PRfXQDFoacDOz
	mUF3+J6mkqpifQzxfE5vToAQ+ss3hXjYEHX/9CCuXLtEPcvajpXjy5o6HO5hC5+F
	SRPnzQnKKQAFxx2KqQsMFLmwjSHntR0zRO7nbwOKsRHGNJZYVXFl6AbfAkK1wvXY
	tWR6d95RnBDQpPokvuZ/FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789495412; x=
	1789581812; bh=M+18z9TRevaxtOpUOsKP4yasoi0N4a+EiZHqRi1jYdY=; b=o
	ZOUFFuD6XnpqFUSEJsY2ku4+E5wCoyzzuuGjDK3VOLtNoMZpIRvRxVprQ9i/22II
	jG1jG15qMEzvpaLpECfgkboC8JdgLp9Q39mqgTcR8lYXn/d83bLIcQ5dXDL+TemW
	klIRqMV8FflS6YTNzEQwkIfn2xX1LkA7dmLFMj4E00Q1CW0JkSLBLf2Zk1/g8U4A
	ejyIqZLoetKA/i/YaBFIiwJjewrsmt2inIMSFgG6e+QsHc3VL/1ujnHfQDpawgEm
	I0nYSDFstqFLf3IPHvTqv/TfrIzepp3oweewt4zuJrTzNSjkToeN7dZvBMpDoMyQ
	3pfG1/3YATpk1jIhSkoew==
X-ME-Sender: <xms:cYipaqE_AZTIyS7ZUScZTZ4wde-IC-i3ZyB5ji0kH44t1e0B3LSclg>
    <xme:cYipamKRrUVZH90_QVcnKEsG_cZ2n0jvO7k-iE1vh3ku8J-yTzn_jXbvbJU5AFnEV
    JytVsriQCYwRwPPY87Xo4C9mG4acZP8NtAqXcTtz16YbQpFQW1ivg>
X-ME-Proxy-Cause: dmFkZTEqhHjzH1soeTRI55HShuI0NwF6ztlzSeEa6rdk6X/pP/Jtsnp/rah2tHi5jjcKB2
    lusLwR9l1hsFDHtzVzUwOj5TctfcRlmmLokL8SZY0QOvkDneEL8NNm5kzUhlGtnnIOSY+k
    QYkqiKZp2SLcPCb3DscDI2fJXz78s3/4Ckjem3nv0+Ua+COftzMGlwTptdt88qWV3osb7T
    T5ye+RBTmyxZgFvcLaWtdcO7CFvSIKyHLXrBshilUZxavJSyPA7zRqFPUfEURGFWUZJwOc
    cWn5hWkzyz2adzsNIlzBWhO/OFUO8SAd3243e1XMNMZRUA2r3QWhWls6hiFMwBaPqqSRSe
    dt0T6ZGZOm8+lgAsiZUthxmJtKEmZLaACB/aj4Zn0jPxFJskSxiS/dKB0+K99b18stM6E/
    MGYZZD4Dbbl6ZPwnUdzZbbxWoRg1HxbTeB9DH1iSzXuIw6R3mn9qYrAHsC28FsDlXckeL8
    r0g684T9Dc21Nc1FenOYOwWBi9QUvertwK2jfjyZXgANc9pSFa8KxijA9exEgC/NQSabNT
    N1yuOPdlP61ofVBk3S/9gx/HFxtGHAvc0zRoG7U84I8l0OAHiBmxyobTjsVL3y5sCwVQlM
    pKS/rS0rLj0nsA6qufToAQrMqBJeRG3FxWPhepx4hFOQeYS2c1YC0XYKUYcQ
X-ME-Proxy: <xmx:coipary-7p7j1Kt0qU7OG_-8DDJhBtgPod0au9RKw52o1qZnSESppw>
    <xmx:coipaqIEgSO4ryECQ4vjQQxF3TkIFmqQ9ZxieSNK2v8s1f25VovtPQ>
    <xmx:coipatoXg2wUi6tLNO5bNikhZjmnI5yJjun9dPQztNmowsDc-CeI6Q>
    <xmx:coipahIu2IlxV-XBevCCTOyDFXx89QoUF0csr5hA57H2JIoH8rSBww>
    <xmx:dIipanoLEVa1nmatRE4Cfwr0jAv58eY7-FZDBV9fHKFGa4SlCFozRXvG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2D5C132A0081; Tue, 15 Sep 2026 14:03:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ArHA-gVR6p-N
Date: Tue, 15 Sep 2026 20:02:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Kees Cook" <kees@kernel.org>
Cc: "Lorenzo Stoakes" <ljs@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Alexey Gladkov" <legion@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 "Jens Axboe" <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Message-Id: <90006ad1-73df-4bd0-a434-61875edd5bb9@app.fastmail.com>
In-Reply-To: 
 <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609140844.FA7E848A@keescook> <aqk9gakQhxToLnDI@gremlin>
 <202609150955.A51C9F7A20@keescook>
 <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if available
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026, at 19:47, Nick Desaulniers wrote:
> On Tue, Sep 15, 2026 at 10:31=E2=80=AFAM Kees Cook <kees@kernel.org> w=
rote:
>> On Tue, Sep 15, 2026 at 03:30:43PM +0100, Lorenzo Stoakes (ARM) wrote:
>> a)
>> My main concern is the lack of respecting the -j make argument. In my
>> mind, this is a blocker, because it means a build will now _always_ s=
pin
>> up max CPUs (not what -j has limited it to), and for CIs, shared comp=
ute
>> systems, or whatever, this violates the requested parallelism level. =
For
>> example, if I'm doing a long-running Coccinelle replacement in one tr=
ee
>> (which uses half the CPUs), any builds I launch I'm asking for the ot=
her
>> half of my CPUs to be used so they don't thrash my cache.
>>
>> This is the kind of "why are all the CPUs spinning up?" question I
>> helped track down with commit 51e46c7a4007 ("docs, parallelism: Rearr=
ange
>> how jobserver reservations are made") forever ago.
>
> Parse -j from MAKEFLAGS (https://stackoverflow.com/a/76517886),
> forward it to pigz?

That still has a potential O(n=C2=B2) problem: if one builds N kernels
with a top-level jobserver on N CPUs, and they all take the same
amount of time, you end up with N pigz processes each trying to use
N cpus at the same time. Ideally we'd use the equivalent of
-flto=3Dauto in the compiler, which respects jobserver settings,
but I don't think pigz supports this at the moment.

      Arnd
