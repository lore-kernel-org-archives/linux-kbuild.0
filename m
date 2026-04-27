Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F906367F3C;
	Mon, 27 Apr 2026 19:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318459; cv=none; b=KyL4nVkja4kcg+4Ro2+PhPONl5u64BvKqZXa1l+tOfkiKeJWLGUKWtYRtgrLbv60Wi6a0y5Dfyil6Z1/CIbBY29JPOmyrPPPMme+rW1ImEoDpU4CzYBPtSqYQFQKKSv5YM/pMUyFJmnO5ecq1giF6qwwuLbxQBDvQaCsc8nxNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318459; c=relaxed/simple;
	bh=00n9eH+Jatw2k8EDhclImOak0CbecAi+5zZD8HsjEY4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rl02rjsudeTY68j3QN0G52bsBa4hwcM1scrtBa23eri6WlHODJYBspMHXX8d+OBIF2LKJWzBgqhsPBcsskRRlC+4HK8vm39ycd8rbHYhV2eJZ14TE9xKIWPCrdVobYxK7MYjRB2fI9tsmCp4swkVIVMr4h9mEs0r1xy49qsrarU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lYI6Epet; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IEZq1Bet; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lYI6Epet";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IEZq1Bet"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 354D614000F2;
	Mon, 27 Apr 2026 15:34:16 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 15:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777318456;
	 x=1777404856; bh=D1fY2AS/jcu/FSrkcI3HneHe2EFW7bz1HilYk3KJn4A=; b=
	lYI6Epet30PveRyqiekEsQqrjNUx3/lt8yaUV76spp1E6KoVVQOWQtOgVoEs7G/A
	bSDTY1UVSoSA0OdVF0h0xeLMyMhcPrT+ycZHoXMVVaFLk27HseNLNkloZqkmfONG
	XPyODAxFmJauewHid4CzMXRYWr1TZCm2MfbDAWDn3LewMXOsXmy/r/nNfXGFbRqq
	mapLg01DM2oRYO06qFK1zRtvduEL3cKFrv9K7xPCRzwnsOGnZ0GNqPSDJ4Aih8aw
	/nVjrmJTXScggmEAwFcTkc83i/XXNm/79SLD4jX0/+gEqM2Xy23s5q/kkQE8gF1s
	fX6rlNrHydWasOAteGfUAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777318456; x=
	1777404856; bh=D1fY2AS/jcu/FSrkcI3HneHe2EFW7bz1HilYk3KJn4A=; b=I
	EZq1BetgLz34UGhzMZq/iLkF2usUh2YvQE4naqIC5ooIhIiSUUWovHyDUDwOdD/w
	iF5HQjezkr9uBGPsOa2Tf4NUoTxSm8te2GQzpD+mN3Kq1AMqKPLgOEoeEPRLNZxy
	u+JCFTAk90jTRsM5QGzgF1EZo11pzOk+yGu0ocuIhm2TgFXdcPJpRPnG63/NMp9D
	wC78M94d2bbjkAJl3YF7LNtCYrabOZVm1B/fcxwartkf8fQ3xf4KyMuNR2/x+SpX
	kRLeoc6DG54wSssc/cEzKmRgr2rPQ12ueAwiryvgWsHRBDnDYXw9dklsj3cpns2X
	61IKqgA0l0xc3pZJWgfXg==
X-ME-Sender: <xms:N7rvaX_1_IBtJA85L_7w3yx2xTCqRSio1gUhq24whSuaNYUUM6eZ7Q>
    <xme:N7rvaeh0534YkOsbF2LJjQrzgusACtmbYqk3DhgRS99yTJo-mcxKuIEvhorbiyKn6
    5UWBRARKH3AYgWKJ7BN63QHkBV5H0K55dMN2jdhfLyg3z4m66dbjmM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejleehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhhulhhirghnsghrrghhrgesghhmrghilhdrtghomhdprhgtphhtth
    hopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpdhr
    tghpthhtoheplhhjsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrshgrhhhirh
    hohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojh
    gvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhho
    uhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouh
    hnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:N7rvaZ0q8Rqn_LZJdXESsiMyDSPVcPadxWlgcRVOfAnWrPlv7tfk8Q>
    <xmx:N7rvab7SekCjdH2ic6tNLScMwvOq5Cj7l2ZBxNQOOwkCMwg7RszKZA>
    <xmx:N7rvaQWTMfQ-nECbXsM-k3Za44x9Ifu3I9FEnxVpFyLeVhGSGIodeQ>
    <xmx:N7rvaTgc-fVLRcLSrVsqgat94OZ4f4ZVb8SYmsgVLCB_6QiRO3X6Cg>
    <xmx:OLrvaRW6jjCfOPY_7vG3lj1rdN1NKO1264lHPe0_WLkTF00uaOTfLBQv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A87DE700069; Mon, 27 Apr 2026 15:34:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AdishfI0b-0R
Date: Mon, 27 Apr 2026 21:33:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Julian Braha" <julianbraha@gmail.com>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, ljs@kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Message-Id: <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
In-Reply-To: 
 <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
 <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026, at 20:17, Miguel Ojeda wrote:
> On Mon, Apr 27, 2026 at 7:44=E2=80=AFPM Julian Braha <julianbraha@gmai=
l.com> wrote:
>>
>> +kconfirm also requires the Cargo package manager and an internet
>> +connection for compilation of its dependencies.
>
> This will be quite surprising -- I think any `make` call should avoid
> touching the network and should allow working while offline as long as
> one has set up things beforehand.
>
> i.e. I think tools and dependencies in general should be fetched
> and/or installed beforehand, and then yes, `make` may use them,
> without touching the network (e.g. passing `--offline` or `--frozen`).

It would also be helpful to reduce the number of hard dependencies
and ideally only rely on packages that are already shipping in common
distros.

From the dependency list, it appears that the majority of dependencies
here are only indirectly pulled in by 'reqwest'. I guess is only
required for dead-link checking, so maybe that part could be
made optional?

     Arnd
