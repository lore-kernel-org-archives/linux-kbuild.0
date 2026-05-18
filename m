Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F093B7763;
	Mon, 18 May 2026 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091717; cv=none; b=rW08yMMixrPg8UFbXdVryeRHOFmEtz8A47URBj2pAspj9vfhHsdvkKA1DvbqUQ+eAsQ6wLzStT2qzfCkUicmAKZLBcQyVJ5PpWEVXiqgGDetC9+lR7Vl0CYepp/yPzGI0cRKPBXhu22DTfWhqXvHnWaGeUWdi7h1FlOAd8kILWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091717; c=relaxed/simple;
	bh=o3YCFVIczNIry44nAnDihzccv7vZrX+n7Q0zFtD8cKE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WrySVdenBtB1LZyGyfmurfd4gDrWoGq8S5REysTmRqPmGd5jOHyEX3QlRxFcajwdVUBfCGI/2o2FotNPYNN/fa0I5Q2VR70MkcRk4ZOJny4PjTp8k98UWMRKjQKjlhgF+8SSmmuCO9HsnGsqzjhT5qs5n/d5nWa7jw7bwEwbqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FAxhkYyu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p/62/miq; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FAxhkYyu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p/62/miq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 05EA27A0114;
	Mon, 18 May 2026 04:08:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 18 May 2026 04:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779091711;
	 x=1779178111; bh=SMTE3eKUoPJQ9Fckj2EBplDYrIXz7DHO/1XXF0HbP1E=; b=
	FAxhkYyuLp9QidDS8KwCzt5I9eFjCKuXS6WlEfWw/4xqZq2Gv3EFRu7YZEV6gZWR
	V88n1VBalToYEo+DDz3r33kmGYNayDWO+RMCxjfjel+Q2pZ5YJRIUw7/vda2z/Te
	owpMXDik+TQGtbyTvzBHlA4KaAFiiy/yJ+vF7jfrcm+abClJcryARx57nduckvkS
	fuvoo0wHUZLEWeM2rCJBdEdiy1Ntk2v+x7SqL/j/70pETf+Mr1RoCopdegeOTiIS
	U4J8S/jvvCBSIBWKnp6dbhFddl/Zl0nwaKzuztrfpAoN22fQqKuDwHYWWFJtIoXB
	m5H3ATTVzi6WTDGZd6ZONQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779091711; x=
	1779178111; bh=SMTE3eKUoPJQ9Fckj2EBplDYrIXz7DHO/1XXF0HbP1E=; b=p
	/62/miq9xDJbvy0O/t7ak+HpbTF7idnT1/Eu/lXsv5x2kbXEkQkfEzZjsugtQCo4
	S8VyQ+/PNhokthuvCh410TB70+cbYG6zWwBph8ROLYgvkBZOOB5z24r0TSF/TYHB
	5rA86oVDqNLRRLcwc80zn72qf0jwsAnFnrqV1ujQSQD0J5c9X3uUp5AaF3XoiPDi
	4nkK5YLqTdB6IDfXdDLmY/obH/L9NZg4QIUTh3o6F5WB037HsfIHdn8ZsEnDa/+j
	h6vooQKrJQFW+rOF4m4EBrBUv8cUwOd5P7z3D6FqgQbZQGQbyKI88zhTWHNMqXjc
	ro7gj2ADERZtNGNWUeCLw==
X-ME-Sender: <xms:_sgKaqFtZMscDadiwF6vnRuRP9GLRSo8zTFDq40f4AxqrpKN3YsJ9g>
    <xme:_sgKamInPF6wZJCqPUKbunfyBJxYkc2D5DpQd9OqBacFxm5AVCQaRCacEoytZMEuV
    XEBDJwcpazTwlCauvgEylH6Alo84vmVptBdaOBYF9nV1PuTfwY5U3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeekfeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopeguvg
    hmihhosggvnhhouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhulhhirghnsghr
    rghhrgesghhmrghilhdrtghomhdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrsh
    grnhguohhnihhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepvghjsehinhgrihdruggv
    pdhrtghpthhtoheplhhjsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrshgrhh
    hirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_sgKahvZfXVB2y2iD6OXwPyFctVH5KWlUkQBIb2AY0veHI6KZAzL9w>
    <xmx:_sgKahhJ42ah9loNqrmLbDQHqusOWeLESmcHCthaVWFnBJXRWeRdPA>
    <xmx:_sgKasfQWz7GRS0f_qvCBoVrgtKuLQBB2ITxvAgVzmupnJY41lv4UA>
    <xmx:_sgKauliLd5wz_BIeuIxMUslcviBLEPJ5bRx097M7tk-e9PSUVxksQ>
    <xmx:_8gKauBNVy1Ny4K4BDfkSfG8RXh3lLLg9pC3MavyjdjdCwRsqhzFTKf8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A9B081820082; Mon, 18 May 2026 04:08:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AShNAKQnQ-07
Date: Mon, 18 May 2026 10:08:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Demi Marie Obenour" <demiobenour@gmail.com>
Cc: "Julian Braha" <julianbraha@gmail.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Gary Guo" <gary@garyguo.net>,
 ljs@kernel.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, qingfang.deng@linux.dev,
 yann.prono@telecomnancy.net, ej@inai.de, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Message-Id: <ef59ee46-87e2-4f99-babf-4dc8ee3cbec5@app.fastmail.com>
In-Reply-To: 
 <CANiq72mGTehUWS2-MgukOKmwAn3fB63boFNqbNENse6B00M7Zg@mail.gmail.com>
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com>
 <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
 <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com>
 <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
 <CANiq72mGTehUWS2-MgukOKmwAn3fB63boFNqbNENse6B00M7Zg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026, at 00:53, Miguel Ojeda wrote:
> On Sun, May 17, 2026 at 10:25=E2=80=AFPM Demi Marie Obenour
> <demiobenour@gmail.com> wrote:
>>
>> I was hoping for Linux to avoid the Rust trend of downloading tons
>> of third-party crates, with all the supply-chain risks that entails.
>
> I completely agree -- it is why I said a well-known, vetted set of cra=
tes.
>
> That is, we should decide on e.g. a single CLI arg parser, a single
> logger, etc. for most of our tools, and ideally they should be
> well-known crates (ideally already trusted via use in the compiler
> itself).
>
> Moreover, they should be pinned with `--locked` or similar (like we
> already recommend for `bindgen-cli`), so that we only ever use
> something that matches the hash in the lockfile that would be
> committed in the tree.

What about dependencies that are normally shipped by the distros
along with the rust compiler? Would it be possible to allow a
range of version that matches the ones that are present on
common distros like we do with C libraries, or would that cause
more problems than it solves?

     Arnd
