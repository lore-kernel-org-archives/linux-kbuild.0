Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A3124676D;
	Fri, 31 Jul 2026 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480880; cv=none; b=Zp2coVZu47Sgg+YXpESB+veD6y167xohBHK3MhiAx5OFgYR0rpf15gZ5p7ynxbjXfQ8a/NItvPhSOspM7IR6+poZ2w6Xc2/+GiZEO+cLQI9QGczPZA0I9HnNNgsSrhxq8ItjjLfUgaY3SQhMon21fyD5gZ34It5zKGy2xrdC24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480880; c=relaxed/simple;
	bh=XBanGmDsEUDA2QUCG6QvFsyVxo/YW+uNFqHVB4E/Idk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d5JZuFTiztO3kqrGtXBGOPzGU1/oUVSU2FaxA2J0P+WWwpz7d3Jp5bDa7Q+X1JDDsYnidJ3lz5Zc1ndDBYupPNkX8VZsfBF16wJk0zHlgqnzY1FF8ZdE1DCJQG3fST0m65v5zjcDALkGsP1E16b7C8AabiRM6fPyI6kDPfrtRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kC5k/8im; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kC5k/8im"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hBGyS0ZBcz8v2W;
	Fri, 31 Jul 2026 08:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785480864; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OG3025m+E3cOsSzM3kKyvSKPHIR9PU9Elpi0M8CJFE8=;
	b=kC5k/8imgrQvg2iwOVJUdbIU10OP0+IrIw0J87DAYuuOAVsA7ntIOZVeyP/jKXF7CxaZdn
	iN5mI3WO7sxlct/yH4LbeZ80NiqBiWyQTcUwyAuZOQRPkrGD0HR2XhjInzVfCRLxFziBx4
	QzWk92Xg69A6kwaygyk2Zg1Xb/d4FkMgEOmHuKCf4p+k5yb+LMN0Ze3xjNIC7+nTzJeJ7x
	cjC2tqSQYxOGw1jzr0QMvdE13SRVj9/Sq3BkhEpPxhzPMEF9DtdTk7fa+Ixvp+7lFYiXYC
	W0tPrYw8K2vgZN92Qe7K/Xte1qt6/GjOXL4EjJfy9fC6E2GasQAfUQNApHmfJQ==
Message-ID: <fa3d31c188640d013c8da2f3a1be32188926e4a5.camel@mailbox.org>
Subject: Re: [PATCH v4 1/4] list: Add mutable iterator variants
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Kaitao Cheng <kaitao.cheng@linux.dev>, David Laight	
 <david.laight.linux@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, David
 Hildenbrand <david@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Nicolas Schier	
 <nsc@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, "Paul E . McKenney"	
 <paulmck@kernel.org>, David Howells <dhowells@redhat.com>, Simona Vetter	
 <simona.vetter@ffwll.ch>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Randy Dunlap
 <rdunlap@infradead.org>, Kaitao Cheng	 <chengkaitao@kylinos.cn>, Andrew
 Morton <akpm@linux-foundation.org>, Philipp Stanner <phasta@kernel.org>,
 Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, "Joy H . J . Lee"
 <rkr0k0r@gmail.com>, Peter Zijlstra	 <peterz@infradead.org>, Ian Rogers
 <irogers@google.com>, Namhyung Kim	 <namhyung@kernel.org>, Swapnil Sapkal
 <swapnil.sapkal@amd.com>, 	linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 31 Jul 2026 08:54:14 +0200
In-Reply-To: <20260730095041.35715-2-kaitao.cheng@linux.dev>
References: <20260730095041.35715-1-kaitao.cheng@linux.dev>
	 <20260730095041.35715-2-kaitao.cheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 74ae807c07d1d091a3f
X-MBO-RS-META: 6g3t6de5zrg34cts5jkseqjse478cuho

Hi,

On Thu, 2026-07-30 at 17:50 +0800, Kaitao Cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> The list_for_each*_safe() helpers allow the current entry to be removed
> while iterating, but require callers to declare and pass a temporary
> cursor. Most callers never use that cursor directly, so exposing it adds
> boilerplate and leaks an implementation detail into each call site.
>=20
> Add *_mutable() variants for list and hlist iterators. These variants
> keep the temporary cursor in a uniquely named local variable inside the
> macro while preserving the removal-safe iteration semantics.
>=20
> Keep the existing *_safe() variants for callers that need to access or
> reset the temporary cursor, and update their documentation to clarify
> which interface to use.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
> =C2=A0include/linux/list.h | 180 ++++++++++++++++++++++++++++++++++++++++=
+--
> =C2=A01 file changed, 175 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/linux/list.h b/include/linux/list.h
> index 09d979976b3b..373b08b929d3 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -765,26 +765,62 @@ static inline void list_splice_tail_init(struct lis=
t_head *list,
> =C2=A0
> =C2=A0/**
> =C2=A0 * list_for_each_safe - iterate over a list safe against removal of=
 list entry
> + *	with a caller-provided temporary cursor
> =C2=A0 * @pos:	the &struct list_head to use as a loop cursor.
> =C2=A0 * @n:		another &struct list_head to use as temporary storage
> =C2=A0 * @head:	the head for your list.
> + *
> + * If the caller does not need to access the temporary cursor, use
> + * list_for_each_mutable() instead.
> =C2=A0 */
> =C2=A0#define list_for_each_safe(pos, n, head) \
> =C2=A0

I as a reader would probably be confused by this. What temporary
cursor? pos? n?

I tend to agree with Andrew's comment, that we would have to wonder how
much of an improvement more functions to choose from are, when
considering the cost-benefit-ratio.

Sure the temporary variables are often not needed, but sometimes APIs
are (have to be) just like that. With spin_lock_irqsave() you're also
forced to carry an integer around that you yourself never need.

Philipp
